// ignore_for_file: non_constant_identifier_names, library_private_types_in_public_api

import 'package:flutter/material.dart';
// import 'package:flutter_map/flutter_map.dart';
// import 'package:latlong/latlong.dart' as latlong;

var logo = const Image(
  image: AssetImage(
    'assets/images/logo-1-sos.png',
  ),
);
const defultColor = Colors.blue;
const defultColor2 = Colors.white;
var P_profile = const Padding(
  padding: EdgeInsets.only(right: 16.0),
  child: CircleAvatar(
    backgroundImage: AssetImage('assets/images/p_profile.jpg'),
  ),
);

class PasswordTextField extends StatefulWidget {
  const PasswordTextField({super.key});

  @override
  _PasswordTextFieldState createState() => _PasswordTextFieldState();
}

class _PasswordTextFieldState extends State<PasswordTextField> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      child: TextField(
        obscureText: _obscureText,
        decoration: InputDecoration(
            labelText: 'Password',
            filled: true,
            fillColor: Colors.white,
            suffixIcon: IconButton(
              icon:
                  Icon(_obscureText ? Icons.visibility : Icons.visibility_off),
              onPressed: () {
                setState(() {
                  _obscureText = !_obscureText;
                });
              },
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20.0),
            )),
      ),
    );
  }
}
//import 'package:flutter/material.dart';
// import 'package:flutter_map/flutter_map.dart';
// import 'package:geolocator/geolocator.dart';
// import 'package:http/http.dart' as http;
// import 'package:latlong2/latlong.dart' as latlong;
//
// import 'dart:convert';
//
//
// class p_dhelp extends StatefulWidget {
//   @override
//   State<p_dhelp> createState() => _p_dhelpState();
// }
//
// class _p_dhelpState extends State<p_dhelp> {
//   late MapController mapController;
//   late latlong.LatLng currentLocation;
//
//   @override
//   void initState() {
//     super.initState();
//     mapController = MapController();
//     currentLocation = latlong.LatLng(0, 0); // تهيئة مؤقتة
//     _getCurrentLocation();
//   }
//   @override
//   Widget build(BuildContext context) {
//     return    Scaffold( body: FlutterMap(
//       mapController: mapController,
//       options: MapOptions(
//         center: currentLocation,
//         zoom: 13.0,
//       ),
//       layers: [
//         TileLayerOptions(
//           urlTemplate: 'https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png',
//           subdomains: ['a', 'b', 'c'],
//         ),
//         MarkerLayerOptions(
//           markers: [
//             Marker(
//               width: 80.0,
//               height: 80.0,
//               point: currentLocation,
//               builder: (ctx) => Container(
//                 child: FlutterLogo(),
//               ),
//             ),
//           ],
//         ),
//       ],
//     ),
//     );
//   }
//
//   void _getCurrentLocation() async {
//     Position position = await Geolocator.getCurrentPosition(
//       desiredAccuracy: LocationAccuracy.high,
//     );
//     setState(() {
//       currentLocation = latlong.LatLng(position.latitude, position.longitude);
//     });
//   }
// }