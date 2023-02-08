import 'dart:convert';
import 'dart:developer';

import 'package:church/Constants.dart';
import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;
import '../Model/FlashNewsModel.dart';

class FlashNewsService {
  // Future<List<FlashNewsModel>?> getFlashNews() async {
  //   try {
  //     var response = await Dio().get('${baseUrl}mobile/flash-news/list',
  //         options: Options(
  //           headers: <String, dynamic>{
  //             'key': 'application/json',
  //           },
  //         ));
  //     var json = response.data;
  //     List<FlashNewsModel>? data = List<FlashNewsModel>.from(
  //         json.map((x) => FlashNewsModel.fromJson(x)));
  //     print(data);
  //     return data;
  //   } catch (e) {
  //     print(e);
  //   }
  // }


  Future<FlashNewsModel?> asiVicarMessage() async {
    FlashNewsModel? result;
    try {
      final response = await http.get(
        Uri.parse("${baseUrl}mobile/flash-news/list"),
      );
      if (response.statusCode == 200) {
        final item = json.decode(response.body);
        result = FlashNewsModel.fromJson(item);
      } else {
        print("error");
      }
    } catch (e) {
      log(e.toString());
    }
    return result;
  }


}
