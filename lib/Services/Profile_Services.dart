
import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../Constants.dart';
import '../Model/Profile_Model.dart';
import 'package:http/http.dart' as http;

class ProfileService {
  
  Future<ProfileModel?> profileDetails() async {
    ProfileModel? result;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final id = prefs.getInt("memberid");
    try {
      final response = await http.get(
        Uri.parse("${baseUrl}mobile/profile/profile-info/$id"),
      );
      if (response.statusCode == 200) {
        final item = json.decode(response.body);
        result = ProfileModel.fromJson(item);
      } else if(response.statusCode == 500) {
        prefs.remove("logintoken");
      }
    } catch (e) {
      log(e.toString());
    }
    return result;
  }
}
