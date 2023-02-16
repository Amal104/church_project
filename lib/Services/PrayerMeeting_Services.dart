import 'dart:developer';
import 'package:dio/dio.dart';
import '../Constants.dart';
import '../Model/PrayerMeeting_Model.dart';

class PrayerMeetingService {
  Future<List<PrayerMeetingModel>?> getPrayerMeeting() async {
    try {
      var response =
          await Dio().get('${baseUrl}mobile/prayer-meeting/list');
      var json = response.data;
      List<PrayerMeetingModel>? data = List<PrayerMeetingModel>.from(
          json.map((x) => PrayerMeetingModel.fromJson(x)));
      print(data);
      return data;
    } catch (e) {
      log(e.toString());
    }
  }
}