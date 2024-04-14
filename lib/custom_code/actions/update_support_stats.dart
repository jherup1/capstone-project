// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'index.dart'; // Imports other custom actions

Future<bool> updateSupportStats(
  BuildContext context,
  String uid,
  int numTickets,
  int numTotTickets,
) async {
  try {
    CollectionReference supportStats =
        FirebaseFirestore.instance.collection('supportStats').doc(uid);
    double percentTotTickets =
        ((numTickets / numTotTickets) * 100).roundToDouble();

    await supportStats.add({
      'uid': uid,
      'numTickets': numTickets,
      'lastResolved': FieldValue.serverTimestamp(),
      'percentTotTickets': percentTotTickets,
    }, SetOptions(merge: true));
    return true;
  } on FirebaseException catch (e) {
    return false;
  }
}
