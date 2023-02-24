import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:geolocator/geolocator.dart';

import '../values/AppBar.dart';
import '../values/AppTitle.dart';
import '../values/values.dart';

class LocationScreen extends StatefulWidget {
  const LocationScreen({super.key});

  @override
  State<LocationScreen> createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  late String lat;
  late String long;
  String location = "";

  @override
  void initState() {
    super.initState();
    // _getCurrentLocation();
  }

  

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: AppColor.solidWhite,
      appBar: CustomAppBar.customAppBarIcon(),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: MediaQuery.of(context).size.width / 20,
                  ),
                  child: const AppTitle(title: "Obituary")),
              SizedBox(
                height: size.height * 0.02,
              ),
              SizedBox(
                height: size.height * 0.8,
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      location != "" ?
                      Text(location) : const Center(child: CircularProgressIndicator(),),
                      ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppColor.purpleShade,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          onPressed: () {
                            // _getCurrentLocation().then((value) {
                            //   lat = value.latitude.toString();
                            //   long = value.longitude.toString();
                            //   setState(() {
                            //     location = "Latitude : $lat\nLongitude : $long";
                            //   });
                            // });
                          },
                          child: Text("Get Location")),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: size.height * 0.06,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
