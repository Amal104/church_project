import 'dart:developer';

import 'package:dio/dio.dart';

import '../Constants.dart';
import '../Model/WorshipTime_Model.dart';

class WorshipTimeService {
  Future<List<WorshipTimeModel>?> getWorshipTime() async {
    try {
      var response =
          await Dio().get('${baseUrl}mobile/worship-time/list');
      var json = response.data;
      List<WorshipTimeModel>? data = List<WorshipTimeModel>.from(
          json.map((x) => WorshipTimeModel.fromJson(x)));
      print(data);
      return data;
    } catch (e) {
      log(e.toString());
    }
  }
}