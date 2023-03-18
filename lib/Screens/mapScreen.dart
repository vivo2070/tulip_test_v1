// import 'package:flutter/material.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';
// import 'package:geolocator/geolocator.dart';
//
// class MapScreen extends StatefulWidget {
//   @override
//   _MapScreenState createState() => _MapScreenState();
// }
//
// class _MapScreenState extends State<MapScreen> {
//   late GoogleMapController _mapController;
//   late Position _currentPosition;
//
//   @override
//   void initState() {
//     super.initState();
//     _getCurrentLocation();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Map Screen'),
//       ),
//       body: GoogleMap(
//         initialCameraPosition:
//         CameraPosition(target: LatLng(0.0, 0.0), zoom: 15),
//         onMapCreated: (controller) {
//           _mapController = controller;
//         },
//         myLocationEnabled: true,
//       ),
//     );
//   }
//
//   void _getCurrentLocation() async {
//     final position = await Geolocator.getCurrentPosition(
//         desiredAccuracy: LocationAccuracy.high);
//     setState(() {
//       _currentPosition = position;
//       _mapController.animateCamera(
//           CameraUpdate.newLatLngZoom(LatLng(position.latitude, position.longitude), 15));
//     });
//   }
// }
