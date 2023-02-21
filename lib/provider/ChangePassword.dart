import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import '../Constants.dart';
import '../values/SnackBar.dart';
import '../values/values.dart';

class ChangePasswordProvider extends ChangeNotifier {
  TextEditingController oldPasswordController = TextEditingController();
  TextEditingController newPasswordController = TextEditingController();

  Future<void> changePassword(BuildContext context) async {
    // Map<String, String> headers = {'Authorization': 'Bearer $token',};
    if (oldPasswordController.text.isNotEmpty &&
        newPasswordController.text.isNotEmpty) {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      final id = prefs.getInt("memberid");
      var response = await http.patch(
          Uri.parse("${baseUrl}mobile/password/change-password/$id"),
          body: ({
            "oldPassword": oldPasswordController.text,
            "newPassword": newPasswordController.text
          }));
      if (response.statusCode == 200) {
        Customsnackbar.showSnackBar(
            context, "Password", "Changed Successfully", AppColor.purpleShade);
        newPasswordController.clear();
        oldPasswordController.clear();
      } else {
        Customsnackbar.showSnackBar(
            context, "Oops!", "Something went wrong", AppColor.purpleShade);
      }
    } else {
      Customsnackbar.showSnackBar(
          context, "Oops!", "Something went wrong", AppColor.purpleShade);
    }
  }
}
