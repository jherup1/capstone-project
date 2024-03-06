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

Future deleteFavSchool(
  BuildContext context,
  String uid,
  DocumentReference schoolRef,
) async {
  try {
    CollectionReference users = FirebaseFirestore.instance.collection('users');
    users.doc(uid).update({
      'schools': FieldValue.arrayRemove([schoolRef]),
    });
  } on FirebaseException catch (e) {
    return;
  }
  // Add your function code here!
}
