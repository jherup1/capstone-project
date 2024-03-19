// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:firebase_auth/firebase_auth.dart';

Future sendVerificationEmail(BuildContext context) async {
  final firebaseAuth = FirebaseAuth.instance;

  try {
    final user = await firebaseAuth.currentUser;
    if (user != null && !user.emailVerified) {
      await user.sendEmailVerification();
      //print('Verification email sent to ${user.email}');
    } else {
      //print('User is either null or already verified');
    }
  } on FirebaseAuthException catch (e) {
    //print('Error sending verification email: $e');
  }
}
