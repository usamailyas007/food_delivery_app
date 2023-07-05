
import 'package:flutter/material.dart';
import 'package:food_app/providers/checkout_provider.dart';
import 'package:location/location.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';

import '../../config/colors.dart';

class CustomGoogleMap extends StatefulWidget {
  const CustomGoogleMap({Key? key}) : super(key: key);

  @override
  State<CustomGoogleMap> createState() => _CustomGoogleMapState();
}

class _CustomGoogleMapState extends State<CustomGoogleMap> {
  LatLng _initialCameraPosition = LatLng(20.5937, 78.9629);
  late GoogleMapController controller;
  Location _location = Location();

  void _onMapCreated(GoogleMapController _value) {
    controller = _value;
    _location.onLocationChanged.listen((event) {
      controller.animateCamera(
          CameraUpdate.newCameraPosition(
              CameraPosition(target: LatLng(event.latitude!, event.longitude!),
              zoom: 16
              ))
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    CheckoutProvider checkoutProvider = Provider.of(context);
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: textColor),
        backgroundColor: primaryColor,
        centerTitle: true,
        title: Text(
          'Google Map',
          style: TextStyle(fontSize: 18, color: textColor),
        ),
      ),
      body: Container(
        height: MediaQuery
            .of(context)
            .size
            .height,
        width: MediaQuery
            .of(context)
            .size
            .width,
        child: Stack(
          children: [
            GoogleMap(
              initialCameraPosition:
              CameraPosition(target: _initialCameraPosition),
              mapType: MapType.normal,
              myLocationEnabled: true,
              onMapCreated: _onMapCreated,
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: InkWell(
                onTap: () async {
                  await _location.getLocation().then((value) {
                    setState(() {
                      // checkoutProvider.setLocation = value;
                    });
                    Navigator.pop(context);
                  });
                },
                child: Container(
                  margin: EdgeInsets.only(left: 10,right: 60,bottom: 25,top: 25),
                  height: 60,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: primaryColor,
                    borderRadius: BorderRadius.circular(30)
                  ),
                  child: Center(
                    child: Text(
                      'Set Location',
                      style: TextStyle(color: textColor,fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
