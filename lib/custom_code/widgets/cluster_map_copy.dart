// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '/custom_code/actions/index.dart'; // Imports custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_map_marker_cluster/flutter_map_marker_cluster.dart';
import 'package:latlong2/latlong.dart' as latlong2;

class ClusterMapCopy extends StatefulWidget {
  const ClusterMapCopy({
    super.key,
    this.width,
    this.height,
    this.zoom,
    required this.initialCenter,
    required this.markerLocations,
    required this.rebuildPage,
  });

  final Future<dynamic> Function() rebuildPage;
  final double? width;
  final double? height;
  final int? zoom;
  final LatLng? initialCenter; // Flutter Flow's LatLng
  final List<LatLng> markerLocations; // Flutter Flow's LatLng

  @override
  State<ClusterMapCopy> createState() => _ClusterMapCopyState();
}

class _ClusterMapCopyState extends State<ClusterMapCopy> {
  late List<Marker> _markers;
  late final MapController _mapController;

  latlong2.LatLng convertToLatlong2(LatLng ffLatLng) {
    return latlong2.LatLng(ffLatLng.latitude, ffLatLng.longitude);
  }

  @override
  void initState() {
    super.initState();
    _mapController = MapController();
    _markers = widget.markerLocations.map((location) {
      final latlong2Location = convertToLatlong2(location);
      return Marker(
        width: 80.0,
        height: 80.0,
        point: latlong2Location,
        builder: (ctx) => GestureDetector(
          onTap: () async {
            // Update the FFAppState().tapped with the marker's LatLng for bottom sheet
            FFAppState().tapped =
                LatLng(latlong2Location.latitude, latlong2Location.longitude);
            await widget.rebuildPage();
          },
          child: const Icon(Icons.location_on, color: Colors.red),
        ),
      );
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    final latlong2InitialCenter = widget.initialCenter != null
        ? convertToLatlong2(widget.initialCenter!)
        : null;

    return Scaffold(
      body: Stack(
        children: [
          SizedBox(
            width: widget.width ?? MediaQuery.of(context).size.width,
            height: widget.height ?? MediaQuery.of(context).size.height,
            child: FlutterMap(
              mapController: _mapController, // Use the MapController here
              options: MapOptions(
                center: latlong2InitialCenter,
                zoom: widget.zoom?.toDouble() ?? 13,
                minZoom: 3,
                maxZoom: 17,
              ),
              children: [
                TileLayer(
                  urlTemplate:
                      'https://{s}.basemaps.cartocdn.com/light_all/{z}/{x}/{y}.png',
                  subdomains: ['a', 'b', 'c', 'd'],
                ),
                MarkerClusterLayerWidget(
                  options: MarkerClusterLayerOptions(
                    spiderfyCircleRadius: 80,
                    spiderfySpiralDistanceMultiplier: 2,
                    circleSpiralSwitchover: 12,
                    maxClusterRadius: 120,
                    size: Size(40, 40),
                    fitBoundsOptions: FitBoundsOptions(
                      padding: EdgeInsets.all(50),
                    ),
                    markers: _markers,
                    polygonOptions: PolygonOptions(
                      borderColor: Colors.blueAccent,
                      color: Colors.black12,
                      borderStrokeWidth: 3,
                    ),
                    builder: (context, markers) {
                      return FloatingActionButton(
                        child: Text(markers.length.toString()),
                        onPressed: null,
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            right: 20,
            bottom: 20,
            child: FloatingActionButton(
              onPressed: () {
                // When tapped, this button centers the map on initialCenter
                _mapController.move(convertToLatlong2(widget.initialCenter!),
                    widget.zoom?.toDouble() ?? 13);
              },
              child: Icon(Icons.center_focus_strong),
              backgroundColor: Color(0x4741ff),
            ),
          ),
        ],
      ),
    );
  }
}
