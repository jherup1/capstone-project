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

Future guestLogin(
  BuildContext context,
) async {
  try {
    final credential = await FirebaseAuth.instance.signInAnonymously();
    bool addDoc = addUserDoc(
        "Guest", null, "", null, null, credential.user!.uid, 'guest');
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
    FFAppState().update(() {
      FFAppState().createAccountAttempt = 'unknown';
      FFAppState().loginAttempt = 'unknown';
    });
  }
}
