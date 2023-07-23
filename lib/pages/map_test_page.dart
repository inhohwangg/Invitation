import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter/services.dart';
import 'package:latlong2/latlong.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Polygon> polygons = [];
  List<Polyline> polylines = [];

  @override
  void initState() {
    super.initState();
    loadGeoJson();
  }

  Future<void> loadGeoJson() async {
    final geojson =
        jsonDecode(await rootBundle.loadString('assets/uimarket.geojson'));
    final features = geojson['features'] as List;

    features.forEach((feature) {
      final coordinates = feature['geometry']['coordinates'][0] as List;
      final points = coordinates
          .map((coordinate) => LatLng(coordinate[1], coordinate[0]))
          .toList();

      polygons.add(Polygon(
        points: points,
        color: Colors.blue.withOpacity(0.3),
        borderColor: Colors.blue,
        borderStrokeWidth: 2,
      ));

      // Add to polylines
      polylines.add(Polyline(
        points: points,
        color: Colors.red,
        strokeWidth: 2.0,
      ));
    });

    setState(() {}); // re-render
  }

  @override
  Widget build(BuildContext context) {
    return FlutterMap(
      options: MapOptions(
        center: LatLng(37.738098, 127.0336819),
        zoom: 16,
        minZoom: 11,
        maxZoom: 18,
      ),
      children: [
        TileLayer(
          urlTemplate:
              'http://api.vworld.kr/req/wmts/1.0.0/C76066FF-27A5-3837-9D15-DDB92635F8A3/Base/{z}/{y}/{x}.png',
          userAgentPackageName: 'com.example.app',
        ),
        PolygonLayer(
          polygons: polygons,
        ),
        PolylineLayer(
          polylines: polylines,
        ),
      ],
    );
  }
}
