import 'package:flutter/material.dart';
import 'package:location/location.dart';
import 'dart:async';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapPage extends StatefulWidget {
  final LocationData userLocation;
  MapPage({Key key, this.userLocation}) : super(key: key);
  @override
  _MapPageState createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  Completer<GoogleMapController> _controller = Completer();
  @override
  Widget build(BuildContext context) {
    CameraPosition _currentPos = CameraPosition(
      bearing: 0.0, //compass direction – 90 degree orients east up
      target: LatLng(1.3521, 103.8198),
      tilt: 60.0, //title angle – 60 degree looks ahead towards the horizon
      zoom: 17, //zoom level – a middle value of 11 shows city-level
    );
    return Scaffold(
      backgroundColor: Colors.blue,
      appBar: AppBar(
        title: const Text('Map'),
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: GoogleMap(
        mapType: MapType.hybrid,
        myLocationEnabled: true,
        initialCameraPosition: _currentPos,
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
      ),
    );
  }
} //_MapPageState
