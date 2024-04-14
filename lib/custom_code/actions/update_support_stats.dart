// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

Future<bool> updateSupportStats(
  BuildContext context,
  String uid,
  int? numTickets,
  DateTime? lastResolved,
  double? percentTotTickets,
) async {
  try {
    CollectionReference supportStats =
        FirebaseFirestore.instance.collection('supportStats');
    await supportStats.add({
      'uid': uid,
      'numTickets': numTickets,
      'lastResolved': FieldValue.serverTimestamp(),
      'percentTotTickets': percentTotTickets,
    });
    return true;
  } on FirebaseException catch (e) {
    return false;
  }
}
