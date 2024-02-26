// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_map_marker_cluster/flutter_map_marker_cluster.dart';
import 'package:flutter_map_marker_popup/flutter_map_marker_popup.dart';
import 'package:latlong2/latlong.dart' as ll;

class Map extends StatefulWidget {
  const Map({
    super.key,
    this.width,
    this.height,
    this.schools,
  });

  final double? width;
  final double? height;
  final List<SchoolsRecord>? schools;

  @override
  State<Map> createState() => _MapState();
}

class _MapState extends State<Map> {
  @override
  Widget build(BuildContext context) {
    return Container(
        width: widget.width,
        height: widget.height,
        child: FlutterMap(
          mapController: MapController(),
          options: MapOptions(
            center: ll.LatLng(34.6, -92.4),
            zoom: 7.0,
            minZoom: 7.0,
          ),
          children: [
            TileLayer(
              minZoom: 1,
              maxZoom: 18,
              backgroundColor: Colors.black,
              urlTemplate:
                  'https://api.mapbox.com/styles/v1/jherup/clsffkjh800kv01pv1eibdifg/wmts?access_token=pk.eyJ1IjoiamhlcnVwIiwiYSI6ImNscDJ6a2dxOTB2bjUya280NXZzNXlibTUifQ.rZdJcR6nvUCf3s7T0w82_w',
              additionalOptions: {
                'accessToken':
                    "pk.eyJ1IjoiamhlcnVwIiwiYSI6ImNscDJ6a2dxOTB2bjUya280NXZzNXlibTUifQ.rZdJcR6nvUCf3s7T0w82_w",
              }, //additionalOptions
            ) //TileLayer
          ], //children
        ) //FlutterMap
        ); //Container
  } //build
} //_MapState
