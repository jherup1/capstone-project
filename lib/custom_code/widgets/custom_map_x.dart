// Automatic FlutterFlow imports
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/widgets/index.dart'; // Imports other custom widgets
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!


import 'package:image/image.dart' as img;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:async';
import 'dart:ui' as ui;
import 'package:http/http.dart' as http;
import 'package:google_maps_flutter/google_maps_flutter.dart' as gm;
import 'dart:typed_data';
import 'package:fluster/fluster.dart';

class ClusterIcons {
  Map<int, gm.BitmapDescriptor> _cache = {};

  ui.PictureRecorder? recorder; // Make recorder nullable
  Canvas? canvas;
  final Size size;
  final Color color;
  ui.Image? background;

  ClusterIcons({required this.size, required this.color}) {
    this.recorder = ui.PictureRecorder(); // Create a new PictureRecorder
    print("creating recorder");
    if (this.recorder!.isRecording) {
      print("true");
    } else {
      print("false");
    }
    this.canvas = Canvas(recorder!); // Use the newly created recorder
    if (this.recorder!.isRecording) {
      print("true");
    } else {
      print("false");
    }
  } //Made by Blupry.com //Blupry.com No-code marketplace, custom template and support!
  Future createIconPicture() async {
    if (this.recorder!.isRecording) {
      print("true");
    } else {
      print("false");
    }
    final CirclePainter circlePainter = CirclePainter(color: color, size: size);
    circlePainter.paint(canvas!, size);
    print("creating");
    print("size is ${size.height}");
    background = await recorder!
        .endRecording()
        .toImage(size.width.toInt(), size.height.toInt());
    print("createed");
  }

  ui.Picture addClusterNumbers(int clusterSize) {
    recorder = ui.PictureRecorder();
    canvas = Canvas(recorder!);
    late double fontSize;
    if (isWeb) {
      print("its is web");
      fontSize = 20;
    } else {
      fontSize = 50;
    }

    // Draw the background image on the canvas
    canvas!.drawImage(background!, Offset(0, 0), Paint());
    final TextSpan span = TextSpan(
      style: TextStyle(
          color: Colors.white,
          fontSize: fontSize), // Adjust font size and color as needed
      text: clusterSize.toString(),
    );

    // Create a TextPainter to draw the TextSpan onto the canvas
    final TextPainter tp = TextPainter(
      text: span,
      textAlign: ui.TextAlign.center,
      textDirection: ui.TextDirection.ltr,
    );

    // Layout the text and get its size
    tp.layout();
    final double textWidth = tp.width;
    final double textHeight = tp.height;

    // Determine position to center the text on the canvas
    final Offset position = Offset(
      (size.width - textWidth) / 2,
      (size.height - textHeight) / 2,
    );

    // Draw the text onto the canvas
    tp.paint(canvas!, position);
    var picture = recorder!.endRecording();
    return picture;
  }

  Future<gm.BitmapDescriptor> getBitmap(ui.Picture picture) async {
    final ui.Image image =
        await picture.toImage(size.width.toInt(), size.height.toInt());
    final ByteData? byteData =
        await image.toByteData(format: ui.ImageByteFormat.png);
    if (byteData == null) {
      throw Exception("Failed to convert image to bytes");
    }

    final Uint8List list = byteData.buffer.asUint8List();
    return gm.BitmapDescriptor.fromBytes(list);
  }

  Future createIconCache(int markerLength) async {
    int i = 2;
    while (i <= markerLength) {
      ui.Picture temp = addClusterNumbers(i);
      _cache[i] = await getBitmap(temp);
      i++;
    }
  }

  gm.BitmapDescriptor getIcon(int clusterSize) {
    return _cache[clusterSize]!;
  }
}

class CirclePainter extends CustomPainter {
  final Color color;
  final Size size;
  CirclePainter({
    required this.color,
    required this.size,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()
      ..color = color.withOpacity(0.3)
      ..style = PaintingStyle.fill;

    final double centerX = size.width / 2;
    final double centerY = size.height / 2;

    // Draw the bigger circle with lower opacity
    canvas.drawCircle(
        Offset(centerX, centerY), size.height / 2, paint); // Adjust radius

    // Draw the smaller circle with full opacity
    paint.color = color;
    canvas.drawCircle(
        Offset(centerX, centerY), size.height * 0.4, paint); // Adjust radius
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}

class RoundImageHelper {
  static Uint8List? getRoundImageFromWeb(int iconSize, http.Response response) {
    img.Image? imageFromWeb =
        img.decodeImage(Uint8List.fromList(response.bodyBytes));

    if (imageFromWeb == null) {
      print("Failed to decode the fetched image.");
      return null;
    }
    imageFromWeb =
        img.copyResize(imageFromWeb, width: iconSize, height: iconSize);

    // Turning image into a round shape
    final int radius = imageFromWeb.width ~/ 2;
    final img.Image roundedImage = img.Image(
      width: imageFromWeb.width,
      height: imageFromWeb.height,
      numChannels: 4,
      format: img.Format.uint8,
    );

    for (int y = 0; y < imageFromWeb.height; y++) {
      for (int x = 0; x < imageFromWeb.width; x++) {
        if ((x - radius) * (x - radius) + (y - radius) * (y - radius) <=
            radius * radius) {
          var pixel = imageFromWeb.getPixel(x, y);
          roundedImage.setPixelRgba(x, y, pixel.r, pixel.g, pixel.b, 255);
        } else {
          roundedImage.setPixelRgba(x, y, 0, 0, 0, 0);
        }
      }
    }

    // Convert the rounded img.Image to Uint8List
    return Uint8List.fromList(img.encodePng(roundedImage));
  }
}

class ClusterMarker extends Clusterable {
  final String id;
  final gm.LatLng position;
  final Future<dynamic> Function() rebuildPage;

  final gm.BitmapDescriptor icon;
  ClusterMarker({
    required this.id,
    required this.position,
    required this.icon,
    required this.rebuildPage,
    bool isCluster = false,
    clusterId,
    pointsSize,
    childMarkerId,
  }) : super(
          markerId: id,
          latitude: position.latitude,
          longitude: position.longitude,
          isCluster: isCluster,
          clusterId: clusterId,
          pointsSize: pointsSize,
          childMarkerId: childMarkerId,
        );
  gm.Marker toMarker() => gm.Marker(
        markerId: gm.MarkerId(id),
        position: gm.LatLng(
          position.latitude,
          position.longitude,
        ),
        icon: icon,
        onTap: () {
          FFAppState().tapped = LatLng(position.latitude, position.longitude);
          rebuildPage();
        },
      );
}

class CustomMarkerWidget extends StatefulWidget {
  const CustomMarkerWidget({
    Key? key,
    this.width,
    this.height,
    required this.positions,
    required this.defaultImageUrl,
    required this.rebuildPage,
    required this.mapZoomLevel,
    required this.clusterColor,
    required this.isWeb,
    required this.appIconSize,
    required this.webIconSize,
    this.clusterRadius,
  }) : super(key: key);

  final double? width;
  final double? height;
  final String defaultImageUrl;
  final Future<dynamic> Function() rebuildPage;
  final List<stores> positions;
  final double mapZoomLevel;
  final int webIconSize;
  final Color clusterColor;
  final int? clusterRadius;
  final bool isWeb;
  final int appIconSize;

  @override
  _CustomMarkerWidgetState createState() => _CustomMarkerWidgetState();
}

class _CustomMarkerWidgetState extends State<CustomMarkerWidget> {
  ValueNotifier<bool> isCameraMovingNotifier = ValueNotifier(false);

  late Future<Set<gm.Marker>> future;
  final Completer<gm.GoogleMapController> _controller =
      Completer<gm.GoogleMapController>();
  List<gm.Marker> listMarkers = [];
  late gm.LatLng center;
  late double currentZoom;
  Fluster<ClusterMarker>? fluster;
  Set<gm.Marker> clusters = {};
  List<ClusterMarker> clusterMarkers = [];
  late final int iconSize;

  @override
  void initState() {
    super.initState();
    if (isWeb) {
      iconSize = widget.webIconSize;
    } else {
      iconSize = widget.appIconSize;
    }
    future = initMarkersAndClusters();
    currentZoom = widget.mapZoomLevel;
  }

  double getDevicePixelRatio(BuildContext context) {
    // Use 1.0 for web as devicePixelRatio always returns 1.0 for web
    if (widget.isWeb) {
      print("Device pixel ${MediaQuery.of(context).devicePixelRatio}");

      return MediaQuery.of(context).devicePixelRatio;
    } else {
      print("Device pixel ${MediaQuery.of(context).devicePixelRatio}");
      return MediaQuery.of(context).devicePixelRatio;
    }
  }

  Future<Set<gm.Marker>> initMarkersAndClusters() async {
    await generateClusterMarkers();
    try {
      fluster = await createFluster(clusterMarkers);
    } catch (e) {
      print('Error creating Fluster: $e');
    } // Passing the clusterMarkers list to createFluster

    return generateMarkersFromClusters();
  }

  Set<gm.Marker> generateMarkersFromClusters() {
    print(currentZoom);
    final clusters =
        fluster!.clusters([-180, -85, 180, 85], currentZoom.toInt());
    final markers = clusters.map((cluster) => cluster.toMarker()).toSet();
    return markers;
  }

  Future<void> generateClusterMarkers() async {
    List<gm.Marker> markers = <gm.Marker>[];

    for (final location in widget.positions) {
      print("Fetching image for location: $location");

      // Fetch image from web and decode
      final response = await http.get(Uri.parse(location.imageUrl.isEmpty
          ? widget.defaultImageUrl
          : location.imageUrl));

      if (response.statusCode != 200) {
        print(
            "Failed to fetch image. HTTP Status Code: ${response.statusCode}");
        continue;
      }

      // Decode the image using the 'image' library
      Uint8List roundedImageBytes =
          RoundImageHelper.getRoundImageFromWeb((iconSize).toInt(), response) ??
              Uint8List.fromList([]);

      final gm.BitmapDescriptor icon =
          await getBitmapDescriptorFromUint8List(roundedImageBytes);

      ClusterMarker clusterMarker = ClusterMarker(
        icon: icon,
        rebuildPage: widget.rebuildPage,
        id: widget.positions.indexOf(location).toString(),
        position: gm.LatLng(
            location.coordinates!.latitude, location.coordinates!.longitude),
      );

      clusterMarkers.add(clusterMarker);

      final marker = clusterMarker.toMarker();

      markers.add(marker);
    }

    listMarkers = markers;
  }

  Future<Fluster<ClusterMarker>> createFluster(
      List<ClusterMarker> markers) async {
    print("creating fluster");

    ClusterIcons clusterIconHelper = ClusterIcons(
      size: Size(iconSize.toDouble(), iconSize.toDouble()),
      color: widget.clusterColor,
    );
    print("hmm");
    await clusterIconHelper.createIconPicture();
    await clusterIconHelper.createIconCache(listMarkers.length);
    print("hey");

    return Fluster<ClusterMarker>(
      minZoom: 0, // The minimum zoom level at which clusters will be generated
      maxZoom: 21, // The maximum zoom level at which clusters will be generated
      radius:
          250, // The radius (in pixels) of the circle within which markers will be clustered
      extent: 2048, // The tile extent used by the `Fluster` instance
      nodeSize: 64, // The size of the KD-tree leaf node
      points: markers, // The list of markers to be clustered
      createCluster: (BaseCluster? cluster, double? lng, double? lat) {
        return ClusterMarker(
          id: cluster?.id.toString() ?? '',
          position: gm.LatLng(lat ?? 0, lng ?? 0),
          isCluster: cluster?.isCluster ?? false,
          clusterId: cluster?.id ?? 0,
          pointsSize: cluster?.pointsSize ?? 0,
          childMarkerId: cluster?.childMarkerId ?? '',
          icon: clusterIconHelper.getIcon(cluster!.pointsSize ?? 2),
          rebuildPage: widget.rebuildPage,
        );
      },
    );
  }

  Future<gm.BitmapDescriptor> getBitmapDescriptorFromUint8List(
      Uint8List uint8list) async {
    return gm.BitmapDescriptor.fromBytes(uint8list);
  }

  gm.LatLng calculateCenter() {
    double totalLat = 0;
    double totalLong = 0;
    if (listMarkers.isEmpty) {
      return gm.LatLng(widget.positions[0].coordinates!.latitude,
          widget.positions[0].coordinates!.longitude);
    }
    for (var marker in listMarkers) {
      totalLat += marker.position.latitude;

      totalLong += marker.position.longitude;
    }

    return gm.LatLng(
        totalLat / listMarkers.length, totalLong / listMarkers.length);
  }

  void _centerLocation() async {
    gm.GoogleMapController controller = await _controller.future;
    await controller.animateCamera(gm.CameraUpdate.newCameraPosition(
        gm.CameraPosition(target: center, zoom: widget.mapZoomLevel)));
  }

  Timer? _debounce; // Declare a Timer variable

  @override
  void dispose() {
    if (_debounce?.isActive ?? false) _debounce?.cancel();
    super.dispose();
  }

  static int k = 0;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Set<gm.Marker>>(
        future: future,
        builder: (context, snapshot) {
          Widget g = CircularProgressIndicator();

          if (snapshot.hasData) {
            if (k == 0) {
              print("CENTERING");
              center = calculateCenter();
              clusters = snapshot.data!;
              k++;
            }

            g = gm.GoogleMap(
              onMapCreated: (gm.GoogleMapController controller) {
                _controller.complete(controller);
                //_animateToCenter(controller);
              },
              onCameraMoveStarted: () async {
                //
              },
              onCameraIdle: () async {},
              onCameraMove: (gm.CameraPosition position) async {
                if (_debounce?.isActive ?? false)
                  _debounce?.cancel(); // If there's an active timer, cancel it

                _debounce = Timer(Duration(milliseconds: 50), () async {
                  // Place the code that you want to debounce here.
                  print("camera move after debounce");

                  gm.GoogleMapController controller = await _controller.future;
                  currentZoom = await controller.getZoomLevel();
                  fluster = await createFluster(clusterMarkers);
                  setState(() {
                    if (fluster != null) {
                      // Ensure fluster is initialized

                      var newClusters = generateMarkersFromClusters();

                      clusters = newClusters;
                    }
                  });
                });
              },
              initialCameraPosition:
                  gm.CameraPosition(target: center, zoom: currentZoom),
              markers: clusters,
            );
            if (k == 1) {
              _centerLocation();
              k++;
            }
          } else {
            print("has no data");
            g = gm.GoogleMap(
              onMapCreated: (gm.GoogleMapController controller) {
                _controller.complete(controller);
              },
              onCameraIdle: () {},
              onCameraMove: (var position) {},
              onCameraMoveStarted: () {},
              initialCameraPosition: gm.CameraPosition(
                  target: gm.LatLng(widget.positions[0].coordinates!.latitude,
                      widget.positions[0].coordinates!.longitude),
                  zoom: 12),
              markers: Set.of(<gm.Marker>[]),
            );
          }
          return g;
        });
  }
}
//Made by Blupry.com
//Blupry.com No-code marketplace, custom template and support!
