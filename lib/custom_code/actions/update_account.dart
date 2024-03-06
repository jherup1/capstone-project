// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:cloud_firestore/cloud_firestore.dart';

Future updateAccount(
  BuildContext context,
  String email,
  String firstName,
  String? lastName,
  String? phoneNumber,
  String uid,
) async {
  try {
    if (email == "") {
      FFAppState().update(() {
        FFAppState().updateAccountAttempt = 'no-email';
      });
      return;
    }
    if (firstName == "") {
      FFAppState().update(() {
        FFAppState().updateAccountAttempt = 'no-first-name';
      });
      return;
    }
    CollectionReference users = FirebaseFirestore.instance.collection('users');
    users.doc(uid).update({
      'email': email,
      'display_name': firstName,
      'last_name': lastName,
      'phone_number': phoneNumber,
      'last_active_time': DateTime.now(),
    });
    FFAppState().update(() {
      FFAppState().updateAccountAttempt = 'success';
    });
  } on FirebaseException catch (e) {
    FFAppState().update(() {
      FFAppState().updateAccountAttempt = 'unknown';
    });
  }
}
