// ignore_for_file: unused_import, camel_case_types

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:untitled/shared/componente.dart';
// import 'package:location/location.dart';

import '../../shared/text_Form_Field.dart';
import '../p_ahome/location_service.dart';

class p_dmap extends StatefulWidget {
  const p_dmap({super.key});

  @override
  State<p_dmap> createState() => _p_dmapState();
}

class _p_dmapState extends State<p_dmap> {
  late CameraPosition initialCameraPostion;

  // late LocationService locationService;
  @override
  void initState() {
    initialCameraPostion = const CameraPosition(
        zoom: 17, target: LatLng(31.187084851056554, 29.928110526889437));
    // locationService = LocationService();
    // updateMyLocation();
    super.initState();
  }

  TextEditingController search = TextEditingController();
  GoogleMapController? googleMapController;

  Set<Marker> markers = {};
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        body: Container(
          padding: EdgeInsetsDirectional.only(top: 40),
          width: double.infinity,
          color: defultColor2,
          child: Column(
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.7,
                height: 50,
                child: DefaultFormField(
                  controller: search,
                  onChanged: (v) {
                    setState(() {});
                  },
                  fillColor: Colors.white,
                  radius: 20,
                  prefixIcon: Icon(
                    Icons.search,
                    size: 24,
                  ),
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Expanded(
                child: GoogleMap(
                  markers: markers,
                  zoomControlsEnabled: false,
                  onMapCreated: (controller) {
                    googleMapController = controller;
                    // initMapStyle();
                  },
                  initialCameraPosition: initialCameraPostion,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // void initMapStyle() async {
  //   var nightMapStyle = await DefaultAssetBundle.of(context)
  //       .loadString('assets/map_syles/night_map_style.json');

  //   googleMapController!.setMapStyle(nightMapStyle);
  // }

  // void updateMyLocation() async {
  //   await locationService.checkAndRequestLocationService();
  //   var hasPermission =
  //       await locationService.checkAndRequestLocationPermission();
  //   if (hasPermission) {
  //     locationService.getRealTimeLocationData((locationData) {
  //       setMyLocationMarker(locationData);
  //       setMyCameraPosition(locationData);
  //     });
  //   } else {}
  // }

  // void setMyCameraPosition(LocationData locationData) {
  //   var camerPosition = CameraPosition(
  //       target: LatLng(locationData.latitude!, locationData.longitude!),
  //       zoom: 15);

  //   googleMapController
  //       ?.animateCamera(CameraUpdate.newCameraPosition(camerPosition));
  // }

  // void setMyLocationMarker(LocationData locationData) {
  //   var myLocationMarker = Marker(
  //       markerId: const MarkerId('my_location_marker'),
  //       position: LatLng(locationData.latitude!, locationData.longitude!));

  //   markers.add(myLocationMarker);
  //   setState(() {});
  // }
}


// inquire about location service
// request permission
// get location
// display