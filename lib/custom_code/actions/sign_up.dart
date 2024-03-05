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

Future signUp(
  BuildContext context,
  String email,
  String password,
  String confirmPassword,
  String firstName,
  String? lastName,
  String? phoneNumber,
) async {
  try {
    if (password != confirmPassword) {
      FFAppState().update(() {
        FFAppState().createAccountAttempt = 'passwords-do-not-match';
      });
      return;
    }
    final credential = await FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email, password: password);
    bool addDoc = addUserDoc(firstName, lastName, email, phoneNumber, null,
        credential.user!.uid, 'user');
    FFAppState().update(() {
      FFAppState().createAccountAttempt = 'success';
    });
    context.pushNamed(
      'signIn',
      extra: <String, dynamic>{
        kTransitionInfoKey: TransitionInfo(
          hasTransition: true,
          transitionType: PageTransitionType.rightToLeft,
          duration: Duration(milliseconds: 400),
        ),
      },
    );
  } on FirebaseAuthException catch (e) {
    if (e.code == 'email-already-in-use') {
      FFAppState().update(() {
        FFAppState().createAccountAttempt = e.code;
      });
    } else if (e.code == 'invalid-email') {
      FFAppState().update(() {
        FFAppState().createAccountAttempt = e.code;
      });
    } else if (e.code == 'weak-password') {
      FFAppState().update(() {
        FFAppState().createAccountAttempt = e.code;
      });
    } else if (e.code == 'too-many-requests') {
      FFAppState().update(() {
        FFAppState().createAccountAttempt = e.code;
      });
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            e.code,
            style: TextStyle(color: Colors.red),
          ),
        ),
      );
      FFAppState().update(() {
        FFAppState().createAccountAttempt = 'unknown';
      });
    }
  }
}
