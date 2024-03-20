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

import 'package:google_maps_cluster_manager/google_maps_cluster_manager.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart' as gm;
import 'dart:async';
import 'dart:ui' as ui;

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Custom Cluster Manager Demo',
      home: CustomMapSample(
        initialCenter: LatLng(48.856613, 2.352222), // Example initial center
        markerLocations: [],
      ),
    );
  }
}

// Customized Clustering maps

class CustomMapSample extends StatefulWidget {
  final LatLng initialCenter;
  final List<LatLng> markerLocations;
  final double? width;
  final double? height;

  CustomMapSample({
    Key? key,
    this.width,
    this.height,
    required this.initialCenter,
    required this.markerLocations,
  }) : super(key: key);

  @override
  State<CustomMapSample> createState() => CustomMapSampleState();
}

gm.LatLng convertCustomLatLngToGmLatLng(LatLng customLatLng) {
  return gm.LatLng(customLatLng.latitude, customLatLng.longitude);
}

class CustomMapSampleState extends State<CustomMapSample> {
  late ClusterManager<Place> _manager; // Specify Place in ClusterManager

  Completer<gm.GoogleMapController> _controller = Completer();

  Set<gm.Marker> markers = Set();

  @override
  void initState() {
    super.initState();
    // Initialize items here to avoid null checks
    List<Place> items = widget.markerLocations
        .map((customLatLng) => Place(
              name: 'Place',
              latLng: convertCustomLatLngToGmLatLng(
                  customLatLng), // Apply conversion here
            ))
        .toList();

    _manager = _initClusterManager(items);
  }

  ClusterManager<Place> _initClusterManager(List<Place> items) {
    return ClusterManager<Place>(
      items,
      _updateMarkers,
      markerBuilder: _markerBuilder as Future<gm.Marker> Function(dynamic),
    );
  }

  void _updateMarkers(Set<gm.Marker> markers) {
    setState(() {
      this.markers = markers;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: gm.GoogleMap(
        mapType: gm.MapType.normal,
        initialCameraPosition: gm.CameraPosition(
          target: convertCustomLatLngToGmLatLng(widget.initialCenter),
          zoom: 12.0,
        ),
        markers: markers,
        onMapCreated: (gm.GoogleMapController controller) {
          _controller.complete(controller);
          _manager.setMapId(controller.mapId);
        },
        onCameraMove: _manager.onCameraMove,
        onCameraIdle: _manager.updateMap,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Example action to update markers, replace or remove as needed
        },
        child: Icon(Icons.update),
      ),
    );
  }

  Future<gm.Marker> Function(Cluster<Place>) get _markerBuilder =>
      (cluster) async {
        return gm.Marker(
          markerId: gm.MarkerId(cluster.getId()),
          position: cluster.location,
          onTap: () {
            print('Cluster tapped');
            cluster.items.forEach((p) => print(p.name));
          },
          icon: await _getMarkerBitmap(cluster.isMultiple ? 125 : 75,
              text: cluster.isMultiple ? cluster.count.toString() : null),
        );
      };

  Future<gm.BitmapDescriptor> _getMarkerBitmap(int size, {String? text}) async {
    final ui.PictureRecorder pictureRecorder = ui.PictureRecorder();
    final Canvas canvas = Canvas(pictureRecorder);
    final Paint paint1 = Paint()..color = Colors.orange;
    final Paint paint2 = Paint()..color = Colors.white;

    canvas.drawCircle(Offset(size / 2, size / 2), size / 2.0, paint1);
    canvas.drawCircle(Offset(size / 2, size / 2), size / 2.2, paint2);
    canvas.drawCircle(Offset(size / 2, size / 2), size / 2.8, paint1);

    if (text != null) {
      TextPainter painter = TextPainter(textDirection: ui.TextDirection.ltr);
      painter.text = TextSpan(
        text: text,
        style: TextStyle(
            fontSize: size / 3,
            color: Colors.white,
            fontWeight: FontWeight.normal),
      );
      painter.layout();
      painter.paint(
        canvas,
        Offset(size / 2 - painter.width / 2, size / 2 - painter.height / 2),
      );
    }

    final img = await pictureRecorder.endRecording().toImage(size, size);
    final data = await img.toByteData(format: ui.ImageByteFormat.png);

    return gm.BitmapDescriptor.fromBytes(data!.buffer.asUint8List());
  }
}

// Define the Place class as before, implementing ClusterItem
class Place with ClusterItem {
  final String name;
  final gm.LatLng latLng;

  Place({required this.name, required this.latLng});

  @override
  gm.LatLng get location => latLng;
}
