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
  List<Marker> markers = [];
  LatLngBounds? mapBounds;
  
  @override
  Widget build(BuildContext context) {
    return FlutterMap(
      options: MapOptions(
        initialCenter: ll.LatLng(0, 0), // Set your default center
        initialZoom: 7, // Set your default zoom level
        onPositionChanged: (position, hasGesture) {
          setState((){
            mapBounds = position.bounds;
          });
          _loadSchoolsWithinBounds();
        },
      ),
      children: [
        TileLayer(
          urlTemplate: 'https://api.mapbox.com/styles/v1/ivsnag/cl3b3oqds000c15p2xoqnq41s/tiles/256/{z}/{x}/{y}@2x?access_token=pk.eyJ1IjoiaXZzbmFnIiwiYSI6ImNsMzVkdmdoNzAyaWIza3E4eGlhMzY3bDkifQ.BG7N5aKn_r1t03XgZNYLqw',
          subdomains: ['a', 'b', 'c'],
        ),
        // MarkerClusterLayerWidget(
        //   options: MarkerClusterLayerOptions(
        //       maxClusterRadius: 45,
        //       size: const Size(40, 40),
        //       anchor: AnchorPos.align(AnchorAlign.center),
        //       fitBoundsOptions: const FitBoundsOptions(
        //         padding: EdgeInsets.all(50),
        //         maxZoom: 15,
        //       ),
        //       markers: markers,
        //       builder: (context, markers) {
        //         return Container(
        //           decoration: BoxDecoration(
        //               borderRadius: BorderRadius.circular(20),
        //               color: Colors.blue),
        //           child: Center(
        //             child: Text(
        //               markers.length.toString(),
        //               style: const TextStyle(color: Colors.white),
        //             ),
        //           ),
        //         );
        //       },
        //     ),
        // ),
        MarkerLayer(
          markers: markers,
        ),
      ],
    );
  }
  void _loadSchoolsWithinBounds() {
    if (widget.schools != null && mapBounds != null) {
      setState(() {
        markers.clear();
        widget.schools!.forEach((school) {
          if (mapBounds!.contains(ll.LatLng(school.myGeopoint!.latitude, school.myGeopoint!.longitude))) {
            markers.add(
              Marker(
                width: 40.0,
                height: 40.0,
                point: ll.LatLng(school.myGeopoint!.latitude, school.myGeopoint!.longitude),
                  child: Icon(Icons.school),
              ),
            );
          }
        });
      });
    }
  }
}
