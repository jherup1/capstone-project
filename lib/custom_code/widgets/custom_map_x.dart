// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

class CustomMapX extends StatefulWidget {
  const CustomMapX({
    super.key,
    this.width,
    this.height,
    this.schools,
    this.mapZoomLevel,
    this.clusterColor,
    this.clusterRadius,
  });

  final double? width;
  final double? height;
  final SchoolsRecord? schools;
  final double? mapZoomLevel;
  final Color? clusterColor;
  final int? clusterRadius;

  @override
  State<CustomMapX> createState() => _CustomMapXState();
}

class _CustomMapXState extends State<CustomMapX> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
