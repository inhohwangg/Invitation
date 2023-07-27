import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:mapbox_gl/mapbox_gl.dart';

class MapLibreTestPage extends StatefulWidget {
  const MapLibreTestPage({Key? key}) : super(key: key);

  @override
  State<MapLibreTestPage> createState() => _MapLibreTestPageState();
}

class _MapLibreTestPageState extends State<MapLibreTestPage> {
  late MapboxMapController mapController;
  CameraPosition _initialCameraPosition = CameraPosition(
    target: LatLng(37.738098, 127.0336819),
    zoom: 15,
  );

  _onMapCreated(MapboxMapController controller) {
    mapController = controller;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Mapbox Example'),
      ),
      body: MapboxMap(
        styleString: dotenv.env['MAPBOXLINK'],
        onMapCreated: _onMapCreated,
        initialCameraPosition: _initialCameraPosition,
        myLocationEnabled: false,
        minMaxZoomPreference: const MinMaxZoomPreference(11, 26),
        myLocationTrackingMode: MyLocationTrackingMode.None,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _animateToNewLocation,
        child: Icon(Icons.directions),
      ),
    );
  }

  void _animateToNewLocation() {
    mapController.animateCamera(
      CameraUpdate.newCameraPosition(
        CameraPosition(
          target: LatLng(
            37.738098 + Random().nextDouble() * 0.01 - 0.005,
            127.0336819 + Random().nextDouble() * 0.01 - 0.005,
          ),
          zoom: 16.0,
        ),
      ),
      // duration: Duration(seconds: 5),
    );
  }
}
