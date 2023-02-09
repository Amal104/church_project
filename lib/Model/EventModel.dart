// To parse this JSON data, do
//
//     final eventModel = eventModelFromJson(jsonString);

import 'dart:convert';

List<EventModel> eventModelFromJson(String str) => List<EventModel>.from(json.decode(str).map((x) => EventModel.fromJson(x)));

String eventModelToJson(List<EventModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class EventModel {
    EventModel({
        required this.eventTitle,
        required this.venue,
        required this.time,
        required this.date,
        required this.eventId,
    });

    String eventTitle;
    String venue;
    String time;
    DateTime date;
    int eventId;

    factory EventModel.fromJson(Map<String, dynamic> json) => EventModel(
        eventTitle: json["eventTitle"],
        venue: json["venue"],
        time: json["time"],
        date: DateTime.parse(json["date"]),
        eventId: json["eventId"],
    );

    Map<String, dynamic> toJson() => {
        "eventTitle": eventTitle,
        "venue": venue,
        "time": time,
        "date": date.toIso8601String(),
        "eventId": eventId,
    };
}
