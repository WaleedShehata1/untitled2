// ignore_for_file: prefer_collection_literals

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// ignore: unnecessary_import
import 'package:flutter/widgets.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:screenshot/screenshot.dart';

import '../../const/market.dart';
import '../../function/loction_map.dart';
import '../../static/serach_location_widget.dart';
import '../../static/static.dart';

class p_dmap extends StatefulWidget {
  const p_dmap({super.key});

  @override
  State<p_dmap> createState() => _p_dmapState();
}

class _p_dmapState extends State<p_dmap> {
  GoogleMapController? _mapController;

  final Set<Marker> markers = Set();
  static Position? position;
  String searchValue = '';

  static final CameraPosition _kGooglePlex = CameraPosition(
    // target: LatLng(position!.latitude, position!.longitude),
    target: LatLng(position!.latitude, position!.longitude),
    zoom: 8.4746,
  );

  get defultColor => null;

  Future<void> getMyCurrentLocation() async {
    position = await LocationHelper.getCurrentLocation()
        .whenComplete(() => setState(() {}));
  }

  String? val;
  final ScreenshotController _screenshotController = ScreenshotController();

  @override
  void initState() {
    addMarket();
    getMyCurrentLocation();
    super.initState();
  }

  Widget _customMarkerWidget(String url) {
    return SizedBox(
      width: 100, // Specify a fixed size for testing
      height: 100,
      child: Image.asset(url, fit: BoxFit.fill),
    );
  }

  _convertWidgetToBytes(String url) async {
    try {
      final imageBytes = await _screenshotController.captureFromLongWidget(
        _customMarkerWidget(url),
        pixelRatio: 1.0, // Adjust pixel ratio if necessary
      );
      return imageBytes;
    } catch (e) {
      print('Failed to capture widget: $e');
      return null; // Handle the error appropriately
    }
  }

  addMarket() async {
    for (Market market in market) {
      final customMarkerBytes =
          await _convertWidgetToBytes("assets/images/doctor.png");
      final customMarkerIcon = BitmapDescriptor.fromBytes(customMarkerBytes!);
      markers.add(
        Marker(
          markerId: MarkerId(market.id!),
          position: LatLng(market.long!, market.lat!),
          infoWindow: InfoWindow(
              title: market.title!,
              onTap: () {
                // Navigator.push(context, MaterialPageRoute(builder: (context)=> ClinicProfileMap()));
                return _showCustomInfoWindow(
                    market.title!, market.description!);
              }),
          icon: customMarkerIcon,
        ),
      );

      setState(() {});
    }
  }

  void _showCustomInfoWindow(String title, String description) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(title),
        content: SizedBox(
          height: MediaQuery.of(context).size.height * .1,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                description,
                style: const TextStyle(color: Colors.blue),
              ),
            ],
          ),
        ),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        actions: <Widget>[
          ElevatedButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('Close'),
          ),
          ElevatedButton(
            onPressed: () {
              if (title == 'Dr,Ali ahmed') {
                // Navigator.push(
                //     context,
                //     MaterialPageRoute(
                //         builder: (context) => const ClinicProfileMap()));
              } else if (title == 'El_Nobaria') {
                // Navigator.push(
                //     context,
                //     MaterialPageRoute(
                //         builder: (context) => const ClinicProfileMap2()));
              }
            },
            child: const Text('GO'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          position != null
              ? GoogleMap(
                  mapType: MapType.normal,
                  myLocationEnabled: true,
                  zoomControlsEnabled: false,
                  myLocationButtonEnabled: false,
                  initialCameraPosition: _kGooglePlex,
                  markers: markers,
                )
              : Center(
                  child: Container(
                    child: const CircularProgressIndicator(
                      color: Colors.blue,
                    ),
                  ),
                ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Expanded(
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all(width: 1, color: Colors.grey)),
                child: TextField(
                  decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15)),
                    errorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15)),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15)),
                    disabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15)),
                    focusedErrorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15)),
                    hintText: 'Search for the doctor\'s name',
                    hintStyle: TextStyle(color: defultColor),
                    prefixIcon: Icon(Icons.search, color: defultColor),
                  ),
                  onChanged: (value) {
                    setState(() {
                      searchValue = value;
                    });
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
