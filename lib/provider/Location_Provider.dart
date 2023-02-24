import 'package:church/components/AltertDialogue.dart';
import 'package:church/values/values.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

import '../Constants.dart';
import '../values/SnackBar.dart';


class LocationProvider extends ChangeNotifier{

  String lat = "";
  String long = "";

  Future<Position> getCurrentLocation() async {
    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();

    if (!serviceEnabled) {
      await Geolocator.requestPermission();
    }

    LocationPermission permission = await Geolocator.checkPermission();

    if (permission == LocationPermission.denied) {
      if(permission == LocationPermission.denied){
        await Geolocator.requestPermission();
      }
      return Future.error("Location permissions are denied");
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error("Location permissions are permanently denied");
    }

    var position = await Geolocator.getCurrentPosition();

    print(position);

    return await Geolocator.getCurrentPosition();
  }


  Future<void> storeLocation(BuildContext context) async {
    
      SharedPreferences prefs = await SharedPreferences.getInstance();
      final id = prefs.getInt("memberid");
      var response = await http.patch(
          Uri.parse("${baseUrl}mobile/profile/profile-info/$id"),
          body: ({
            "latitude": lat,
            "longitude": long
          }));
      if (response.statusCode == 200) {
        // CustomAlertDialog.logOutyescancelDialog();
        // Customsnackbar.showSnackBar(
        //     context, "Location", "Access Sucessfully", AppColor.purpleShade);
        print("Mission Success");
      } else {
        // Customsnackbar.showSnackBar(
        //     context, "Oops!", "Something went wrong", AppColor.purpleShade);
        print("Oombi");
      }
  }

}


