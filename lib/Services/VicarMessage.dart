import 'dart:convert';
import 'dart:developer';
import 'package:church/Constants.dart';
import 'package:church/Model/VicarMessage.dart';
import 'package:http/http.dart' as http;

class VicarMessageService {
  
  Future<VicarMessageModel?> vicarMessage() async {
    VicarMessageModel? result;
    try {
      final response = await http.get(
        Uri.parse("http://192.168.29.11:5000/user-achens-message/get-vicar-message"),
      );
      if (response.statusCode == 200) {
        final item = json.decode(response.body);
        result = VicarMessageModel.fromJson(item);
      } else {
        print("error");
      }
    } catch (e) {
      log(e.toString());
    }
    return result;
  }

  Future<VicarMessageModel?> asiVicarMessage() async {
    VicarMessageModel? result;
    try {
      final response = await http.get(
        Uri.parse("http://192.168.29.11:5000/user-achens-message/get-asst-vicar-message"),
      );
      if (response.statusCode == 200) {
        final item = json.decode(response.body);
        result = VicarMessageModel.fromJson(item);
      } else {
        print("error");
      }
    } catch (e) {
      log(e.toString());
    }
    return result;
  }
}
