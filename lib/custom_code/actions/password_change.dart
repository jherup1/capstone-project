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

Future passwordChange(
  BuildContext context,
  String email,
  String currentPassword,
  String newPassword,
  String confirmNewPassword,
) async {
  try {
    if (newPassword != confirmNewPassword) {
      FFAppState().update(() {
        FFAppState().passwordChangeAttempt = 'passwords-do-not-match';
      });
      return;
    } else if ((newPassword.length < 8) |
        (!newPassword.contains(RegExp(r'\d'))) |
        (!newPassword.contains(RegExp(r'[a-z]'))) |
        (!newPassword.contains(RegExp(r'[A-Z}'))) |
        (!newPassword.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]')))) {
      FFAppState().update(() {
        FFAppState().passwordChangeAttempt = 'weak-password';
      });
      return;
    }
    final user = FirebaseAuth.instance.currentUser;
    await user?.reauthenticateWithCredential(
      EmailAuthProvider.credential(
        email: email,
        password: currentPassword,
      ),
    );
    await user?.updatePassword(newPassword);
    FFAppState().update(() {
      FFAppState().passwordChangeAttempt = 'success';
    });
    return;
  } on FirebaseAuthException catch (e) {
    if (e.code == 'invalid-credential') {
      FFAppState().update(() {
        FFAppState().passwordChangeAttempt = e.code;
      });
    } else {
      FFAppState().update(() {
        FFAppState().passwordChangeAttempt = 'unknown';
      });
    }
  }
}
