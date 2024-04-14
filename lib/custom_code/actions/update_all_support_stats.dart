// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

Future<bool> updateAllSupportStats(BuildContext context) async {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  CollectionReference ticketsRef = firestore.collection('supportTickets');
  CollectionReference statsRef = firestore.collection('supportStats');

  try {
    QuerySnapshot ticketSnapshot = await ticketsRef.get();
    Map<String, int> ticketCounts = {};
    Map<String, Timestamp?> latestResolved = {};

    for (var doc in ticketSnapshot.docs) {
      var data = doc.data() as Map<String, dynamic>;
      DocumentReference assigneeRef = data['assignee'];
      String assigneeId = assigneeRef.id;
      Timestamp resolvedTime = data['lastActive'];
      ticketCounts[assigneeId] = (ticketCounts[assigneeId] ?? 0) + 1;

      if (latestResolved[assigneeId] == null ||
          (latestResolved[assigneeId] != null &&
              resolvedTime.compareTo(latestResolved[assigneeId]!) > 0)) {
        latestResolved[assigneeId] = resolvedTime;
      }
    }

    for (var userId in ticketCounts.keys) {
      DocumentReference statRef = statsRef.doc(userId);
      Timestamp? lastResolvedTime = latestResolved[userId];

      if (lastResolvedTime == null) {
        statRef.set({
          'uid': userId,
          'numTickets': ticketCounts[userId],
          'lastResolved': FieldValue.serverTimestamp(),
        }, SetOptions(merge: true));
      } else {
        statRef.set({
          'uid': userId,
          'numTickets': ticketCounts[userId],
          'lastResolved': lastResolvedTime,
        }, SetOptions(merge: true));
      }
    }

    return true;
  } catch (e) {
    return false;
  }
}
