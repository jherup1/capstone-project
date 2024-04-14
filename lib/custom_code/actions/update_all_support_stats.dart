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
    // Fetch all tickets and aggregate counts
    QuerySnapshot ticketSnapshot =
        await ticketsRef.where('status', isEqualTo: 'closed').get();
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

    // Fetch all existing stats entries
    QuerySnapshot statsSnapshot = await statsRef.get();
    Set<String> statsUserIds = statsSnapshot.docs.map((doc) => doc.id).toSet();

    // Write batch to update or delete supportStats
    WriteBatch batch = firestore.batch();
    statsUserIds.forEach((userId) {
      DocumentReference statRef = statsRef.doc(userId);
      int ticketCount = ticketCounts[userId] ?? 0;

      if (ticketCount == 0) {
        // No tickets found for this user, delete the document
        batch.delete(statRef);
      } else {
        // Update with the actual ticket count and latest resolved time
        batch.set(
            statRef,
            {
              'uid': userId,
              'numTickets': ticketCount,
              'lastResolved': latestResolved[userId],
            },
            SetOptions(merge: true));
      }
    });

    // Ensure any new users with tickets are added
    ticketCounts.keys
        .where((id) => !statsUserIds.contains(id))
        .forEach((userId) {
      DocumentReference statRef = statsRef.doc(userId);
      batch.set(
          statRef,
          {
            'uid': userId,
            'numTickets': ticketCounts[userId],
            'lastResolved': latestResolved[userId],
          },
          SetOptions(merge: true));
    });

    // Commit the batch
    await batch.commit();
    return true;
  } catch (e) {
    return false;
  }
}
