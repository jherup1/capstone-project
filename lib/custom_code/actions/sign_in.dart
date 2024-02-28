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

Future signIn(
  BuildContext context,
  String email,
  String password,
) async {
  try {
    final user = await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: password);
    context.pushNamed(
      'homePage',
      extra: <String, dynamic>{
        kTransitionInfoKey: TransitionInfo(
          hasTransition: true,
          transitionType: PageTransitionType.fade,
          duration: Duration(milliseconds: 0),
        ),
      },
    );
  } on FirebaseAuthException catch (e) {
    if (e.code == 'invalid-credential') {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            'Invalid email or password. Please try again.',
            style: TextStyle(color: Colors.red),
          ),
        ),
      );
    } else if (e.code == 'too-many-requests') {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            'Too many attempts. Please wait a moment then try again.',
            style: TextStyle(color: Colors.red),
          ),
        ),
      );
    }
  }
}
