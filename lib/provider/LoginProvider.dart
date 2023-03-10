import 'dart:convert';
import 'package:church/Constants.dart';
import 'package:church/screens/HomePage.dart';
import 'package:church/screens/LoginScreen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../values/SnackBar.dart';
import '../values/values.dart';

class LoginProvider extends ChangeNotifier {
  final mobileConroller = TextEditingController();
  final passwordConroller = TextEditingController();

  bool ispasswordEightcharacter = false;
  bool haspasswordOneUppercase = false;
  bool haspasswordOneLowercase = false;
  bool haspasswordOneSpecialcharacter = false;
  bool haspasswordOnenumber = false;
  final formKey = GlobalKey<FormState>();

  onPasswordChanged(String password) {
    final numericRegx = RegExp(r'[0-9]');
    final uppercaseRegx = RegExp(r'(?=.*[A-Z])');
    final lowercaseRegx = RegExp(r'(?=.*[a-z])');
    final specialcharRegx = RegExp(r'(?=.*?[!@#\$&*~])');

    ispasswordEightcharacter = false;
    if (password.length >= 8) {
      ispasswordEightcharacter = true;

      haspasswordOnenumber = false;
      if (numericRegx.hasMatch(password)) {
        haspasswordOnenumber = true;
      }
      haspasswordOneUppercase = false;
      if (uppercaseRegx.hasMatch(password)) {
        haspasswordOneUppercase = true;
      }
      if (lowercaseRegx.hasMatch(password)) {
        haspasswordOneLowercase = true;
      }
      if (specialcharRegx.hasMatch(password)) {
        haspasswordOneSpecialcharacter = true;
      }
    }
    notifyListeners();
  }

  emailValidate(value) {
    if (value.isEmpty) {
      return "Please enter email";
    }
    if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w]{2,4}').hasMatch(value!)) {
      return "Enter valid email";
    } else {
      return null;
    }
  }

  onRegister() {
    if (formKey.currentState!.validate()) {
      Get.off(() => const HomePage());
    }
  }

  validatePassword(value) {
    RegExp regex =
        RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$');
    if (value.isEmpty) {
      return 'Please enter password';
    } else {
      if (!regex.hasMatch(value)) {
        return 'Enter valid password';
      } else {
        return null;
      }
    }
  }

  isValidPhone(value) {
    final phoneRegExp = RegExp(r"^[0-9]{10}$");
    if (value.isEmpty) {
      return 'Please enter phone number';
    } else {
      if (!phoneRegExp.hasMatch(value)) {
        return 'Enter valid phone number';
      }
    }
  }

  Future<void> login(BuildContext context) async {
    // final storage = FlutterSecureStorage();
    try {
      if (mobileConroller.text.isNotEmpty &&
          passwordConroller.text.isNotEmpty) {
        SharedPreferences prefs = await SharedPreferences.getInstance();
        final token = prefs.getString("logintoken");
        Map<String, String> headers = {
          'Authorization': 'Bearer $token',
        };
        var response = await http.post(Uri.parse("${baseUrl}mobile/user/login"),
            headers: headers,
            body: ({
              "phone": mobileConroller.text,
              "password": passwordConroller.text
            }));
        if (response.statusCode == 200) {
          final data = jsonDecode(response.body);
          final token = data["token"];
          final memberid = data["memberId"];

          SharedPreferences prefs = await SharedPreferences.getInstance();
          prefs.setString("logintoken", token);
          prefs.setInt("memberid", memberid);
          Customsnackbar.showSnackBar(
              context, "Yaay!", "Login Successful", AppColor.purpleShade);
          Get.off(() => const HomePage());
        } else {
          var status = response.body;
          Customsnackbar.showSnackBar(
              context, "Oops!", "$status", AppColor.purpleShade);
        }
      } else {
        Customsnackbar.showSnackBar(
            context, "Oops!", "Enter valid data", AppColor.purpleShade);
      }
    } catch (e) {
      print(e);
    }
  }

  // logout() async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   prefs.remove("logintoken");
  //   Get.off(() => const LoginScreen());
  // }
}
