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
    CollectionReference supportTicketsRef =
        FirebaseFirestore.instance.collection('supportTickets');
    QuerySnapshot numAssigneeTicketsQuery = await supportTicketsRef
        .where('assignee', isEqualTo: uid)
        .where('status', isEqualTo: 'Resolved')
        .get();
    int numAssigneeTickets = numAssigneeTicketsQuery.docs.length;

    QuerySnapshot numTotTicketsQuery =
        await supportTicketsRef.where('status', isEqualTo: 'Resolved').get();
    int numTotTickets = numTotTicketsQuery.docs.length;

    return await updateSupportStats(
        context, uid, numAssigneeTickets, numTotTickets);
  } catch (e) {
    return false;
  }
}
