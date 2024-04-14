// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

Future<bool> getTicketNumbers(
  BuildContext context,
  String uid,
) async {
  try {
    final CollectionReference supportTicketsRef =
        FirebaseFirestore.instance.collection('supportTickets');
    final DocumentReference userRef =
        FirebaseFirestore.instance.collection('users').doc(uid);
    print('userRef: $userRef');
    final QuerySnapshot assigneeTicketsQuery = await supportTicketsRef
        .where('assignee', isEqualTo: userRef)
        .where('status', isEqualTo: 'closed')
        .get();
    final int numAssigneeTickets = assigneeTicketsQuery.size;
    print('numAssigneeTickets: $numAssigneeTickets');
    final QuerySnapshot totalTicketsQuery =
        await supportTicketsRef.where('status', isEqualTo: 'closed').get();
    final int numTotTickets = totalTicketsQuery.size;
    print('numTotTickets: $numTotTickets');
    await updateSupportStats(context, uid, numAssigneeTickets, numTotTickets);
    return true;
  } catch (e) {
    return false;
  }
}
