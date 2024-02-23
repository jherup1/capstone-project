// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

class FlutterMap extends StatefulWidget {
  const FlutterMap({
    super.key,
    this.width,
    this.height,
    this.schools,
  });

  final double? width;
  final double? height;
  final List<SchoolsRecord>? schools;

  @override
  State<FlutterMap> createState() => _FlutterMapState();
}

class _FlutterMapState extends State<FlutterMap> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
