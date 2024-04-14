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
    final supportTicketsRef =
        FirebaseFirestore.instance.collection('supportTickets');
    final numAssigneeTickets = await supportTicketsRef
        .where('assignee', isEqualTo: 'uid')
        .where('status', isEqualTo: 'closed')
        .count()
        .get();
    final numTotTickets = await supportTicketsRef
        .where('status', isEqualTo: 'closed')
        .count()
        .get();
    await updateSupportStats(
        context, uid, numAssigneeTickets as int, numTotTickets as int);
    return true;
  } on FirebaseException catch (e) {
    return false;
  }
}
