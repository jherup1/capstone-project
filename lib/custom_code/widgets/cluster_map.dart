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
import 'package:flutter_map_supercluster/flutter_map_supercluster.dart';
import 'package:latlong2/latlong.dart' as latlong2;

class ClusterMap extends StatefulWidget {
  const ClusterMap({
    super.key,
    this.width,
    this.height,
    this.zoom,
    required this.initialCenter, // Assuming this is Flutter Flow's LatLng
    required this.markerLocations, // Assuming these are Flutter Flow's LatLng
    this.urlTemplate,
  });

  final double? width;
  final double? height;
  final int? zoom;
  final LatLng? initialCenter; // Flutter Flow's LatLng
  final List<LatLng> markerLocations; // Flutter Flow's LatLng
  final String? urlTemplate;

  @override
  State<ClusterMap> createState() => _ClusterMapState();
}

class _ClusterMapState extends State<ClusterMap> {
  late List<Marker> _markers;

  // Conversion function
  latlong2.LatLng convertToLatlong2(LatLng ffLatLng) {
    return latlong2.LatLng(ffLatLng.latitude, ffLatLng.longitude);
  }

  @override
  void initState() {
    super.initState();
    /*final List<LatLng> testLocations = [
      LatLng(39.5393, -119.8203), // Example coordinates
      LatLng(39.5300, -119.8100), // Add a few more to test
    ];*/

    _markers = widget.markerLocations.map((location) {
      //_markers = testLocations.map((location) {
      // Convert each location to latlong2.LatLng before creating the Marker
      final latlong2Location = convertToLatlong2(location);
      print(
          'Marker location: ${latlong2Location.latitude}, ${latlong2Location.longitude}'); // Log converted location
      return Marker(
        width: 80.0,
        height: 80.0,
        point: latlong2Location,
        builder: (ctx) => const Icon(Icons.location_on, color: Colors.red),
      );
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    print('Total markers: ${_markers.length}');
    // Convert initialCenter to latlong2.LatLng for MapOptions
    final latlong2InitialCenter = widget.initialCenter != null
        ? convertToLatlong2(widget.initialCenter!)
        : null;
    if (latlong2InitialCenter != null) {
      print(
          'Initial center: ${latlong2InitialCenter.latitude}, ${latlong2InitialCenter.longitude}');
    }
    return Scaffold(
      body: SizedBox(
        width: widget.width ?? MediaQuery.of(context).size.width,
        height: widget.height ?? MediaQuery.of(context).size.height,
        child: FlutterMap(
          options: MapOptions(
            center: latlong2InitialCenter,
            zoom: widget.zoom?.toDouble() ?? 13,
            minZoom: 3,
            maxZoom: 17,
          ),
          children: [
            TileLayer(
              urlTemplate: widget.urlTemplate ??
                  'https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png',
              subdomains: ['a', 'b', 'c'],
            ),
            SuperclusterLayer.immutable(
              initialMarkers: _markers,
              clusterWidgetSize: const Size(40, 40),
              indexBuilder: IndexBuilders.computeWithOriginalMarkers,
              builder: (context, position, markerCount, extraClusterData) =>
                  Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.0),
                  color: Colors.blue,
                ),
                child: Center(
                  child: Text(
                    markerCount.toString(),
                    style: const TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
