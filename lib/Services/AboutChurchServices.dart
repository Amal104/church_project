import 'dart:convert';
import 'dart:developer';
import 'package:dio/dio.dart';
import '../Constants.dart';
import '../Model/AboutChurch.dart';
import 'package:http/http.dart' as http;

import '../Model/ChurchHistory.dart';

class AboutChurchService {
  Future<AboutChurch?> aboutChurch() async {
    AboutChurch? result;
    try {
      Map<String, String> headers = {"mobile": "application/json"};
      final response = await http.get(
        Uri.parse(
          "${baseUrl}mobile/about-church/get-about-church",
        ),
        headers: headers,
      );
      if (response.statusCode == 200) {
        final item = json.decode(response.body);
        result = AboutChurch.fromJson(item);
      } else {
        print("error");
      }
    } catch (e) {
      log(e.toString());
    }
    return result;
  }

  Future<ChurchHistoryModel?> churchHistory() async {
    ChurchHistoryModel? history;
    try {
      Map<String, String> headers = {"mobile": "application/json"};
      final response = await http.get(
        Uri.parse(
          "${baseUrl}mobile/history/get-history",
        ),
        headers: headers,
      );
      if (response.statusCode == 200) {
        final item = json.decode(response.body);
        history = ChurchHistoryModel.fromJson(item);
      } else {
        print("error");
      }
    } catch (e) {
      log(e.toString());
    }
    return history;
  }

}
