// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

Future<bool> addFeedback(
  BuildContext context,
  String? feedbackText,
  int feedbackNumber,
  String? uid,
) async {
  try {
    CollectionReference feedback =
        FirebaseFirestore.instance.collection('feedback');
    await feedback.add({
      'uid': uid,
      'submissionDate': FieldValue.serverTimestamp(),
      'reviewNumber': feedbackNumber,
      'reviewDescription': feedbackText,
    });
    return true;
  } on FirebaseException catch (e) {
    return false;
  }
}
