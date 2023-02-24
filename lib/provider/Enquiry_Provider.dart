import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

import '../Constants.dart';
import '../values/SnackBar.dart';
import '../values/values.dart';

class EnquiryProvider extends ChangeNotifier {
  TextEditingController senderController = TextEditingController();
  TextEditingController msgController = TextEditingController();

  Future<void> sentResponce(BuildContext context) async {

      SharedPreferences prefs = await SharedPreferences.getInstance();
      final id = prefs.getInt("memberid");
      var response = await http.post(
          Uri.parse("${baseUrl}mobile/contact-us/details?id=$id"),
          body: ({
            "title": senderController.text,
            "message": msgController.text
          }));
          String status = response.body;
      if (response.statusCode == 200) {
        Customsnackbar.showSnackBar(
            context, "Responce", "Send Successfully", AppColor.purpleShade);
        senderController.clear();
        msgController.clear();
      } else {
        Customsnackbar.showSnackBar(
            context, "Oops!", "$status", AppColor.purpleShade);
      }
    } 
}
