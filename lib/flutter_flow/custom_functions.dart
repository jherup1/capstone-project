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

String extractPageName(String url) {
  Uri uri = Uri.parse(url);
  List<String> pathSegments = uri.pathSegments;
  if (pathSegments.isNotEmpty) {
    return pathSegments.last;
  } else {
    return 'XXX';
  }
}

bool addUserDoc(
  String firstName,
  String? lastName,
  String email,
  String? phoneNumber,
  String? photoURL,
  String uid,
  String role,
) {
  CollectionReference users = FirebaseFirestore.instance.collection('users');

  users.doc(uid).set({
    'email': email,
    'display_name': firstName,
    'created_time': DateTime.now(),
    'uid': uid,
    'phone_number': phoneNumber,
    'photo_url': photoURL,
    'last_active_time': DateTime.now(),
    'role': role,
    'last_name': lastName,
    'schools': [],
    'location': GeoPoint(39.530895, -119.814972),
  });
  return true;
}

double averageRating(List<FeedbackRecord> feedbackList) {
  if (feedbackList.isEmpty) {
    return 0.0;
  }

  int sum = 0;
  for (FeedbackRecord feedback in feedbackList) {
    sum += feedback.reviewNumber;
  }

  double average = sum / feedbackList.length;

  return average;
}

List<DateTime> getPastDates(int numDaysToTrack) {
  DateTime today = DateTime.now();
  List<DateTime> pastDates = [];
  for (int i = numDaysToTrack; i > 0; --i) {
    pastDates.add(today.subtract(Duration(days: i)));
  }
  return pastDates;
}
