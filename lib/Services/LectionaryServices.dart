import 'dart:convert';
import 'dart:developer';
import 'package:church/Model/LectionaryModel.dart';
import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;
import '../Constants.dart';

class LectionaryService {

  Future<Lectionary?> getLectionary() async {
    Lectionary? lectionary;
    try {
      final response = await http.get(
        Uri.parse("${baseUrl}mobile/lectionary/lectionaryUrl"),
      );
      if (response.statusCode == 200) {
        final item = json.decode(response.body);
        lectionary = Lectionary.fromJson(item);
      } else {
        print("error");
      }
    } catch (e) {
      log(e.toString());
    }
    return lectionary;
  }

}
