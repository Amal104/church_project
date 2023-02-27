import 'package:church/components/AltertDialogue.dart';
import 'package:church/values/values.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:lottie/lottie.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'package:url_launcher/url_launcher_string.dart';

import '../Constants.dart';
import '../values/SnackBar.dart';

class LocationProvider extends ChangeNotifier {
  String lat = "";
  String long = "";

  Future<Position> getCurrentLocation() async {
    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();

    if (!serviceEnabled) {
      await Geolocator.requestPermission();
    }

    LocationPermission permission = await Geolocator.checkPermission();

    if (permission == LocationPermission.denied) {
      if (permission == LocationPermission.denied) {
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
        body: ({"latitude": lat, "longitude": long}));
    if (response.statusCode == 200) {
      // CustomAlertDialog.logOutyescancelDialog();
      showCupertinoDialog(
          context: context,
          builder: (context) {
            Future.delayed(const Duration(seconds: 2), () {
              Navigator.of(context).pop(true);
            });
            return CupertinoAlertDialog(
              content: Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                    color: AppColor.purpleShade,
                    borderRadius: BorderRadius.circular(10)),
                child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Location",
                          style: TextStyle(fontWeight: FontWeight.values[3]),
                        ),
                        Text(
                          "updated sucessfully",
                          style: const TextStyle(
                              fontWeight: FontWeight.bold, letterSpacing: 2),
                        ),
                      ],
                    )),
              ),
            );
          });
      print("Success");
    } else {
      showCupertinoDialog(
          context: context,
          builder: (context) {
            Future.delayed(const Duration(seconds: 2), () {
              Navigator.of(context).pop(true);
            });
            return CupertinoAlertDialog(
              content: Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                    color: AppColor.purpleShade,
                    borderRadius: BorderRadius.circular(10)),
                child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Location",
                          style: TextStyle(fontWeight: FontWeight.values[3]),
                        ),
                        Text(
                          "updation failed",
                          style: const TextStyle(
                              fontWeight: FontWeight.bold, letterSpacing: 2),
                        ),
                      ],
                    )),
              ),
            );
          });
      print("Failed");
    }
  }

  Future<void> openMap(String lat, String long) async {
    String googleURL =
        "https://www.google.com/maps/search/?api=1&query=$lat,$long";
    await canLaunchUrlString(googleURL)
        ? await launchUrlString(
            googleURL,
            mode: LaunchMode.externalApplication,
          )
        : throw "Could not launch location";
  }
}
