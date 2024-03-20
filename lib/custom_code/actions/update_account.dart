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
import 'package:firebase_auth/firebase_auth.dart';

Future updateAccount(
  BuildContext context,
  String email,
  String firstName,
  String? lastName,
  String uid,
  String password,
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
    if (password == "") {
      FFAppState().update(() {
        FFAppState().updateAccountAttempt = 'no-password';
      });
    }
    final user = FirebaseAuth.instance.currentUser;
    await user?.reauthenticateWithCredential(
      EmailAuthProvider.credential(
        email: user!.email!,
        password: password,
      ),
    );
    CollectionReference users = FirebaseFirestore.instance.collection('users');
    users.doc(uid).update({
      'email': email,
      'display_name': firstName,
      'last_name': lastName,
      'last_active_time': DateTime.now(),
    });
    if (user != null) {
      if (user.displayName != firstName) {
        user.updateDisplayName(firstName);
      }
      if (user.email != email) {
        user.verifyBeforeUpdateEmail(email);
      }
    }

    FFAppState().update(() {
      FFAppState().updateAccountAttempt = 'success';
    });
  } on FirebaseException catch (e) {
    if (e.code == 'invalid-credential') {
      FFAppState().update(() {
        FFAppState().updateAccountAttempt = e.code;
      });
    } else {
      FFAppState().update(() {
        FFAppState().updateAccountAttempt = 'unknown';
      });
    }
  }
}
