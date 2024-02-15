// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import '/backend/schema/structs/index.dart';
import '/custom_code/actions/index.dart'; // Imports custom actions

import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart' as ll;
import 'package:geolocator/geolocator.dart';

import 'package:snag_nexus/components/driver_map_location/driver_map_location_widget.dart';
import 'package:snag_nexus/components/order_map_location/order_map_location_widget.dart';
import 'package:snag_nexus/components/store_map_location/store_map_location_widget.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:snag_nexus/auth/firebase_auth/auth_util.dart';

const _DISTANCE_FILTER =
    5; // minimum distance location needs to change to send an update, in meters

String getUrlTemplate(BuildContext context) {
  if (!(Theme.of(context).brightness == Brightness.dark) ?? true) {
    return "https://api.mapbox.com/styles/v1/ivsnag/cl4fvie5e000114mi8t5oa85z/tiles/256/{z}/{x}/{y}@2x?access_token=pk.eyJ1IjoiaXZzbmFnIiwiYSI6ImNsMzVkdmdoNzAyaWIza3E4eGlhMzY3bDkifQ.BG7N5aKn_r1t03XgZNYLqw";
  } else {
    return "https://api.mapbox.com/styles/v1/ivsnag/cl3b3oqds000c15p2xoqnq41s/tiles/256/{z}/{x}/{y}@2x?access_token=pk.eyJ1IjoiaXZzbmFnIiwiYSI6ImNsMzVkdmdoNzAyaWIza3E4eGlhMzY3bDkifQ.BG7N5aKn_r1t03XgZNYLqw";
  }
}

StreamSubscription<Position?>? positionStream;

class CustomMap extends StatefulWidget {
  const CustomMap({
    Key? key,
    required this.width,
    required this.height,
    required this.driverLocations,
    required this.orders,
    required this.store,
    required this.orderStatusFilter,
    this.displayDeliveryBorder = false,
    this.orderDriverFilter,
  }) : super(key: key);

  final double width;
  final double height;
  final List<NexusDriverLocationsRecord> driverLocations;
  final List<NexusOrdersRecord> orders;
  final StoresRecord store;
  final List<String> orderStatusFilter;
  final DocumentReference? orderDriverFilter;
  final bool displayDeliveryBorder;

  @override
  _CustomMapState createState() => _CustomMapState();
}

class _CustomMapState extends State<CustomMap>
    with TickerProviderStateMixin, WidgetsBindingObserver {
  MapController mapController = MapController();
  DateTime? lastSuspendTime; // Time when we last paused/suspended
  bool paused = false;
  bool locationServiceStopped = false;
  List<Polyline> deliveryZonePolylines = [];

  @override
  Widget build(BuildContext context) {
    var storeLocation =
        ll.LatLng(34.412729, -119.855420); // Default to Isla Vista

    // grab store location
    if (widget.store.geoLocation != null) {
      storeLocation.latitude = widget.store.geoLocation?.latitude ?? 0.0;
      storeLocation.longitude = widget.store.geoLocation?.longitude ?? 0.0;
    }

    // get assigned order counts of drivers:
    Map<String, int> driverOrderCounts = {};
    Map<String, List<NexusOrdersRecord>> orderBatches = {};
    widget.orders.forEach((order) {
      if (order.drivingBy != null &&
          (order.drivingBy?.id.isNotEmpty ?? false) &&
          order.status != "CANCELLED" &&
          order.status != "FULFILLED") {
        if (driverOrderCounts[order.drivingBy?.id] == null) {
          driverOrderCounts[order.drivingBy?.id ?? ""] = 1;
        } else {
          driverOrderCounts[order.drivingBy?.id ?? ""] =
              driverOrderCounts[order.drivingBy?.id ?? ""]! + 1;
        }
      }

      if (widget.orderStatusFilter.contains(order.status) &&
          order.pickupOnly != true &&
          order.batchId != null &&
          order.batchId!.isNotEmpty) {
        if (orderBatches[order.batchId!] == null) {
          orderBatches[order.batchId!] = [order];
        } else {
          orderBatches[order.batchId!]!.add(order);
        }
      }
    });

    List<Polyline> batchPolylines =
        createBatchPolylines(orderBatches, storeLocation);

    // Filter markers based on passed order status and driver filter
    var markers = widget.driverLocations
        .where((el) => el.location != null)
        .map(
          (el) => Marker(
            key: Key(el.reference.id),
            width: 20.0,
            height: 45.0,
            anchorPos: AnchorPos.align(AnchorAlign.center),
            point: ll.LatLng(el.location!.latitude, el.location!.longitude),
            builder: (ctx) => DriverMapLocationWidget(
              initials: makeInitialsFromName(el.name),
              driverRef: el,
              orderCount: driverOrderCounts[el.reference.id] ?? 0,
            ),
          ),
        )
        .toList(growable: true);

    markers.addAll(widget.orders
        .where((el) =>
            ((el.pickupOnly ?? false) == false) &&
            (el.geoDestination != null &&
                widget.orderStatusFilter.contains(el.status)) &&
            (widget.orderDriverFilter == null ||
                el.drivingBy == widget.orderDriverFilter))
        .map((el) => Marker(
              key: Key(el.reference.id),
              width: 20.0,
              height: 65.0,
              anchorPos: AnchorPos.align(AnchorAlign.center),
              point: ll.LatLng(
                  el.geoDestination!.latitude, el.geoDestination!.longitude),
              builder: (ctx) => OrderMapLocationWidget(
                order: el,
              ),
            )));

    markers.add(Marker(
        width: 20,
        height: 20,
        anchorPos: AnchorPos.align(AnchorAlign.center),
        point: storeLocation,
        builder: (ctx) => StoreMapLocationWidget(store: widget.store)));

    return FlutterMap(
      mapController: mapController,
      options: MapOptions(
        center: storeLocation, // Default to Isla Vista
        zoom: 15.0,
        maxZoom: 20.0,
        minZoom: 13.0,
        interactiveFlags: InteractiveFlag.pinchZoom | InteractiveFlag.drag,
      ),
      children: [
        TileLayer(
          urlTemplate: getUrlTemplate(context),
          tileProvider: CachedTitleProvider(),
          subdomains: ['a', 'b', 'c'],
          maxNativeZoom: 19,
          maxZoom: 20,
        ),
        PolylineLayer(
          polylines: deliveryZonePolylines,
        ),
        PolylineLayer(
          polylines: batchPolylines,
        ),
        MarkerLayer(
          markers: markers,
        )
      ],
    );
  }

  List<Polyline> createBatchPolylines(
      Map<String, List<NexusOrdersRecord>> orderBatches,
      ll.LatLng storeLocation) {
    if (FFAppState().displayBatchPolylines == false) {
      return [];
    }
    // Create a list of colors (up to 10) to use for batch polylines
    List<Color> colors = [
      Color.fromARGB(255, 161, 202, 162),
      Colors.yellow,
      Colors.orange,
      Colors.pink,
      Colors.teal,
      Colors.cyan,
      Colors.lime,
      Colors.red,
      Colors.blue,
      Colors.purple,
    ];
    int colorIndex = 0;
    try {
      final List<Polyline> batchPolylines = orderBatches.values.map((value) {
        value.sort(
          (a, b) => a.batchSequence?.compareTo(b.batchSequence ?? 0) ?? 0,
        );
        final List<ll.LatLng> points = value
            .where((el) =>
                el.geoDestination != null &&
                (widget.orderDriverFilter == null ||
                    el.drivingBy == widget.orderDriverFilter))
            .map((e) => ll.LatLng(
                e.geoDestination!.latitude, e.geoDestination!.longitude))
            .toList();
        // Prepend points with store location:
        points.insert(0, storeLocation);
        // Append store location to points at the end
        // points.add(storeLocation);
        // Pick a color that we have not used before

        Color color = colors[colorIndex % colors.length];
        colorIndex++;
        if (colorIndex > colors.length - 1) {
          colorIndex = 0;
        }
        return Polyline(points: points, color: color, isDotted: true);
      }).toList();
      return batchPolylines;
    } catch (e) {}
    return [];
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);

    final LocationSettings locationSettings = LocationSettings(
      accuracy: LocationAccuracy.high,
      distanceFilter: _DISTANCE_FILTER,
    );
    positionStream =
        Geolocator.getPositionStream(locationSettings: locationSettings)
            .listen((Position? position) {
      _onLocationUpdate(position);
    });

    WidgetsBinding.instance
        .addPostFrameCallback((_) => _loadDeliveryZonePolylines());
  }

  @override
  void dispose() {
    positionStream?.cancel();
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  _onLocationUpdate(location) async {
    // mapController.move(
    //     ll.LatLng(location.latitude, location.longitude), 15.0);

    if (this.paused) {
      // if we are paused, if lastSuspendTime was over 20 minutes ago and stop the background location service
      if (lastSuspendTime != null &&
          DateTime.now().difference(lastSuspendTime!).inMinutes > 20) {
        positionStream?.cancel();
        locationServiceStopped = true;
        return false;
      }
    }

    FFAppState().lastDriverLocation =
        LatLng(location.latitude, location.longitude);

    var storeId = widget.store.reference.id;
    var locationName = '';
    var storeLocation =
        ll.LatLng(34.412729, -119.855420); // Default to Isla Vista

    // grab store location
    if (widget.store.geoLocation != null) {
      storeLocation.latitude = widget.store.geoLocation?.latitude ?? 0.0;
      storeLocation.longitude = widget.store.geoLocation?.longitude ?? 0.0;
    }

    if (getGeoDistance(FFAppState().lastDriverLocation,
            LatLng(storeLocation.latitude, storeLocation.longitude)) <
        50) {
      locationName = storeId;
    }

    var userLocUpdateData = createNexusDriverLocationsRecordData(
        name: currentUserDisplayName,
        location: LatLng(location.latitude, location.longitude),
        staffRef: currentUserReference,
        accuraccy: location.accuracy,
        bearing: location.heading,
        speed: location.speed,
        storeId: storeId,
        timeMeasured: location.timestamp,
        locationName: locationName);

    // Set ttl to 3 weeks from now
    var ttl = DateTime.now().add(Duration(days: 21));

    var userLocHistoryData = createNexusDriverLocHistoryRecordData(
        staffRef: currentUserReference,
        accuraccy: location.accuracy,
        bearing: location.heading,
        speed: location.speed,
        location: LatLng(location.latitude, location.longitude),
        storeId: storeId,
        timeMeasured: location.timestamp,
        ttl: ttl,
        locationName: locationName);
    var f1 = NexusDriverLocationsRecord.collection
        .doc(currentUser!.uid)
        .set(userLocUpdateData);

    var f2 = NexusDriverLocHistoryRecord.collection.add(userLocHistoryData);

    return await Future.wait([f1, f2]);
  }

  _loadDeliveryZonePolylines() async {
    if (widget.displayDeliveryBorder == false) {
      return;
    }
    var storeId = widget.store.reference.id;

    // Get our Firestore instance
    final firestoreInstance = FirebaseFirestore.instance;
    // Query our storesGeoJSON collection for the storeId
    var querySnapshot =
        await firestoreInstance.collection('storesGeoJSON').doc(storeId).get();

    if (!querySnapshot.exists) {
      return;
    }

    var data = querySnapshot.data() as Map<String, dynamic>;
    var deliveryZoneGeoJSONStr = data['deliveryZoneGeoJSON'];
    var deliveryZoneGeoJSON = jsonDecode(deliveryZoneGeoJSONStr);
    var deliveryZonePolylines = <Polyline>[];

    if (deliveryZoneGeoJSON['type'] == 'FeatureCollection') {
      var features = deliveryZoneGeoJSON['features'];
      for (var feature in features) {
        var geometry = feature['geometry'];
        var type = geometry['type'];
        var deliveryZonePoints = <ll.LatLng>[];
        var coordinates = [];
        if (type == 'LineString') {
          coordinates = geometry['coordinates'];
        } else if (type == 'Polygon') {
          coordinates = geometry['coordinates'][0];
        }
        for (var coordinate in coordinates) {
          var lat = coordinate[1];
          var lng = coordinate[0];
          deliveryZonePoints.add(ll.LatLng(lat, lng));
        }
        if (deliveryZonePoints.length > 0) {
          var deliveryZonePolyline = Polyline(
              points: deliveryZonePoints,
              color: Colors.orange,
              strokeWidth: 4.0,
              isDotted: true);
          deliveryZonePolylines.add(deliveryZonePolyline);
        }
      }
    }

    setState(() {
      this.deliveryZonePolylines = deliveryZonePolylines;
    });
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    print("didChangeAppLifecycleState: $state");

    DateTime currentTime = DateTime.now();
    switch (state) {
      case AppLifecycleState.resumed:
        paused = false;
        lastSuspendTime = null;
        if (locationServiceStopped) {
          print("Resuming location service");
          final LocationSettings locationSettings = LocationSettings(
            accuracy: LocationAccuracy.high,
            distanceFilter: _DISTANCE_FILTER,
          );
          positionStream =
              Geolocator.getPositionStream(locationSettings: locationSettings)
                  .listen((Position? position) {
            _onLocationUpdate(position);
          });
          locationServiceStopped = false;
        }
        setState(() {});
        break;
      // case AppLifecycleState.inactive:
      case AppLifecycleState.paused:
      case AppLifecycleState.detached:
        // Save current time
        if (!paused) {
          lastSuspendTime = currentTime;
          paused = true;
        }
        break;
      case AppLifecycleState.inactive:
        break;
    }
  }

  // TODO: We can use GlobalKey https://stacksecrets.com/flutter/how-to-call-method-of-a-child-widget-from-parent-in-flutter

  void _animatedMapMove(LatLng destLocation, double destZoom) {
    // Create some tweens. These serve to split up the transition from one location to another.
    // In our case, we want to split the transition be<tween> our current map center and the destination.
    final latTween = Tween<double>(
        begin: mapController.center.latitude, end: destLocation.latitude);
    final lngTween = Tween<double>(
        begin: mapController.center.longitude, end: destLocation.longitude);
    final zoomTween = Tween<double>(begin: mapController.zoom, end: destZoom);

    // Create a animation controller that has a duration and a TickerProvider.
    var controller = AnimationController(
        duration: const Duration(milliseconds: 500), vsync: this);
    // The animation determines what path the animation will take. You can try different Curves values, although I found
    // fastOutSlowIn to be my favorite.
    Animation<double> animation =
        CurvedAnimation(parent: controller, curve: Curves.fastOutSlowIn);

    controller.addListener(() {
      mapController.move(
          ll.LatLng(latTween.evaluate(animation), lngTween.evaluate(animation)),
          zoomTween.evaluate(animation));
    });

    animation.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        controller.dispose();
      } else if (status == AnimationStatus.dismissed) {
        controller.dispose();
      }
    });

    controller.forward();
  }
}

class CachedTitleProvider extends TileProvider {
  CachedTitleProvider();

  @override
  ImageProvider getImage(Coords<num> coords, TileLayer options) {
    return CachedNetworkImageProvider(getTileUrl(coords, options));
  }
}
