import 'package:church/Constants.dart';
import 'package:dio/dio.dart';

import '../Model/FlashNewsModel.dart';

class FlashNewsService {
  Future<List<FlashNewsModel>?> getFlashNews() async {
    try {
      var response =
          await Dio().get('${baseUrl}mobile/flash-news/list');
      var json = response.data;
      List<FlashNewsModel>? data = List<FlashNewsModel>.from(
          json.map((x) => FlashNewsModel.fromJson(x)));
      print(data);
      return data;
    } catch (e) {
      print(e);
    }
  }
}
