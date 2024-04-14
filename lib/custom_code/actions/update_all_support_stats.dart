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
    // Fetch all tickets
    QuerySnapshot ticketSnapshot = await ticketsRef.get();
    Map<String, int> ticketCounts = {};
    Map<String, Timestamp> latestResolved = {};

    // Process each ticket
    for (var doc in ticketSnapshot.docs) {
      var data = doc.data() as Map<String, dynamic>;
      DocumentReference assigneeRef = data['assignee'];
      String assigneeId = assigneeRef.id;
      Timestamp resolvedTime = data[
          'lastActive']; // Ensure this field is the timestamp of when the ticket was resolved

      // Count tickets
      if (ticketCounts.containsKey(assigneeId)) {
        ticketCounts[assigneeId] += 1;
      } else {
        ticketCounts[assigneeId] = 1;
      }

      // Track the latest resolved time
      if (latestResolved.containsKey(assigneeId)) {
        if (resolvedTime.compareTo(latestResolved[assigneeId]) > 0) {
          latestResolved[assigneeId] = resolvedTime;
        }
      } else {
        latestResolved[assigneeId] = resolvedTime;
      }
    }

    // Update support stats for each user
    for (var userId in ticketCounts.keys) {
      DocumentReference statRef = statsRef.doc(userId);
      await statRef.set({
        'uid': userId,
        'numTickets': ticketCounts[userId],
        'lastResolved': latestResolved[userId]
      }, SetOptions(merge: true));
    }

    print('Support stats updated successfully.');
    return true;
  } catch (e) {
    print('Error updating support stats: $e');
    return false;
  }
}
