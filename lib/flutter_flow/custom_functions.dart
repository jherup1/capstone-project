import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import 'uploaded_file.dart';
import '/backend/backend.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '/auth/firebase_auth/auth_util.dart';

String? addSchoolToUser() {
  Future<void> addSchoolToUser(String school) async {
    try {
      final userDoc = await FirebaseFirestore.instance
          .collection('users')
          .doc(currentUserUid)
          .get();
      final userSchoolList = List<String>.from(userDoc['userSchoolList'] ?? []);
      userSchoolList.add(school);
      await FirebaseFirestore.instance
          .collection('users')
          .doc(currentUserUid)
          .update({'userSchoolList': userSchoolList});
    } catch (e) {
      print('Error adding school to user: $e');
    }
  }

  return null;
}

String? addSchool() {
  Future<void> addSchoolToUser(String school) async {
    try {
      final userDoc = await FirebaseFirestore.instance
          .collection('users')
          .doc(currentUserUid)
          .get();
      final userSchoolList = List<String>.from(userDoc['userSchoolList'] ?? []);
      userSchoolList.add(school);
      await FirebaseFirestore.instance
          .collection('users')
          .doc(currentUserUid)
          .update({'userSchoolList': userSchoolList});
    } catch (e) {
      print('Error adding school to user: $e');
    }
  }

  return null;
}

List<LatLng> drawPolygon(List<LatLng> pos) {
  return pos;
}

bool isSupport(List<String>? roles) {
  if (roles == null) {
    return false;
  }
  return roles.contains("SUPPORT") || roles.contains("ADMIN");
}

int? indexMarkerIdentifier(
  LatLng? centerMarkerCoordinate,
  List<LatLng>? listofLocation,
) {
  // return index of argument 1 in argument 2
  if (centerMarkerCoordinate == null || listofLocation == null) {
    return null;
  }
  for (int i = 0; i < listofLocation.length; i++) {
    if (centerMarkerCoordinate == listofLocation[i]) {
      return i;
    }
  }
  return null;
}
