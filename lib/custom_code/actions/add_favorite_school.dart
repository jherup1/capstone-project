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

Future<void> addFavoriteSchool(String userId, String schoolId) async {
  DocumentReference userDocRef =
      FirebaseFirestore.instance.collection('users').doc(userId);
  DocumentReference schoolDocRef =
      FirebaseFirestore.instance.collection('favoriteSchools').doc(schoolId);

  return FirebaseFirestore.instance.runTransaction((transaction) async {
    DocumentSnapshot userSnapshot = await transaction.get(userDocRef);

    if (userSnapshot.exists) {
      List<dynamic> currentFavorites = userSnapshot['favoriteSchools'] ?? [];
      if (!currentFavorites.contains(schoolDocRef)) {
        transaction.update(userDocRef, {
          'favoriteSchools': FieldValue.arrayUnion([schoolDocRef])
        });
      }
    } else {
      // Handle the case where the user does not exist
    }
  });
}
// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the green button on the right!
