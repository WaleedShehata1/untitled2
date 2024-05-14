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

class p_amap extends StatefulWidget {
  const p_amap({super.key});

  @override
  State<p_amap> createState() => _p_amapState();
}

class _p_amapState extends State<p_amap> {
  GoogleMapController? _mapController;

  final Set<Marker> markers = Set();
  static Position? position;
  static final CameraPosition _kGooglePlex = CameraPosition(
    // target: LatLng(position!.latitude, position!.longitude),
    target: LatLng(31.346952, 30.536145),
    zoom: 8.4746,
  );

  Future<void> getMyCurrentLocation() async {
    position = await LocationHelper.getCurrentLocation()
        .whenComplete(() => setState(() {}));
  }

  String? val;
  final ScreenshotController _screenshotController = ScreenshotController();

  @override
  void initState() {
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

  addMarketAssistant() async {
    for (Market market in marketHospital) {
      final customMarkerBytes =
          await _convertWidgetToBytes("assets/images/secretary.png");
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
              Row(
                  // mainAxisAlignment:
                  // MainAxisAlignment.end,
                  children: []),
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
        // fit: StackFit.expand,
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
          // Padding(
          //   padding: const EdgeInsets.all(15.0),
          //   child: SearchLocationWidget(
          //     mapController: _mapController,
          //     pickedAddress: 'ابحث عن أقرب طوارئ/دكتور/مستشفي لك',
          //     isEnabled: null,
          //     fromDialog: false,
          //     hint: 'l,ru;',
          //   ),
          // ),
          Positioned(
            bottom: 50,
            left: 50,
            child: Container(
              height: 110,
              width: 200,
              decoration: BoxDecoration(
                  color: Colors.white.withOpacity(.5),
                  borderRadius: BorderRadius.circular(16),
                  border: const Border(
                    bottom: BorderSide(color: Colors.blue, width: 2),
                    top: BorderSide(color: Colors.blue, width: 2),
                    right: BorderSide(color: Colors.blue, width: 2),
                    left: BorderSide(color: Colors.blue, width: 2),
                  )),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 7),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Radio(
                              value: 'Doctor',
                              activeColor: Colors.cyan,
                              groupValue: val,
                              onChanged: (value) async {
                                setState(() {
                                  val = value;
                                  markers.clear();
                                });
                                await addMarket();
                              },
                            ),
                            const Text('Doctor')
                          ],
                        ),
                        Row(
                          children: [
                            Radio(
                              value: 'Assistant',
                              activeColor: Colors.cyan,
                              groupValue: val,
                              onChanged: (value) async {
                                setState(() {
                                  val = value;
                                  markers.clear();
                                });
                                await addMarketAssistant();
                              },
                            ),
                            const Text('Assistant')
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
