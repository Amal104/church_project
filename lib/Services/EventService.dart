
import 'package:dio/dio.dart';

import '../Model/EventModel.dart';

class EventService {
  Future<List<EventModel>?> getEvent() async {
    try {
      var response = await Dio().get(
        'http://192.168.29.11:5000/mobile/event/get-event',
        options: Options(
          headers: {"mobile": "application/json"},
        ),
      );
      var json = response.data;
      List<EventModel>? data = List<EventModel>.from(
          json.map((x) => EventModel.fromJson(x)));
      print(data);
      return data;
    } catch (e) {
      print(e);
    }
    return null;
  }
}
