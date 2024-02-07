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

import 'package:google_maps_flutter/google_maps_flutter.dart' as GoogleMap;
import 'package:google_fonts/google_fonts.dart';
import 'package:geolocator/geolocator.dart';

// Set your widget name, define your parameter, and then add the
// boilerplate code using the green button on the right!
class CustomGoogleMap extends StatefulWidget {
  @override
  _CustomGoogleMapState createState() => _CustomGoogleMapState();
}

class _CustomGoogleMapState extends State<CustomGoogleMap> {
  late GoogleMap.GoogleMapController _mapController;
  late GoogleMap.LatLngBounds _currentMapBounds;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: GoogleMap.GoogleMap(
            onMapCreated: (GoogleMap.GoogleMapController controller) {
              _mapController = controller;
              _updateMapBounds();
            },
            onCameraMove: (_) {
              _updateMapBounds();
            },
            initialCameraPosition: GoogleMap.CameraPosition(
              target:
                  GoogleMap.LatLng(0, 0), // Initial map center, will be updated
              zoom: 7.0, // Initial zoom level
            ),
          ),
        ),
        Text("Current Map Bounds: $_currentMapBounds"),
      ],
    );
  }

  @override
  void initState() {
    super.initState();
    _getUserLocation();
  }

  Future<void> _getUserLocation() async {
    Position position = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
    );

    setState(() {
      _mapController.animateCamera(
        GoogleMap.CameraUpdate.newLatLngZoom(
          GoogleMap.LatLng(position.latitude, position.longitude),
          7.0,
        ),
      );
    });
  }

  void _updateMapBounds() {
    _mapController.getVisibleRegion().then((bounds) {
      setState(() {
        _currentMapBounds = bounds;
      });
    });
  }
}
