import 'dart:math';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late GoogleMapController _controller;
  final CameraPosition _initialposition=CameraPosition(target: LatLng(9.925176 , 78.132237));
  final List<Marker> markers=[];
  addMarker(cordinate){
    int id =Random().nextInt(100);
    setState(() {

      markers.add(Marker(position: cordinate,markerId: MarkerId(id.toString())));
    });

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GoogleMap(
        initialCameraPosition: _initialposition,
        mapType: MapType.normal,
        onMapCreated: (controller){
          setState(() {
            _controller=controller;
          });
        },
        markers: markers.toSet(),
        onTap: (cordinate){
          _controller.animateCamera(CameraUpdate.newLatLng(cordinate));
          addMarker(cordinate);
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _controller.animateCamera(CameraUpdate.zoomOut());
        },
        child: Icon(Icons.zoom_out),
      ),
    );
  }
}