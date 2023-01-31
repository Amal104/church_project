import 'dart:convert';

List<EventModel> eventModelFromJson(String str) => List<EventModel>.from(json.decode(str).map((x) => EventModel.fromJson(x)));

String eventModelToJson(List<EventModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class EventModel {
    EventModel({
        required this.eventTitle,
        required this.date,
        required this.eventId,
    });

    String eventTitle;
    String date;
    int eventId;

    factory EventModel.fromJson(Map<String, dynamic> json) => EventModel(
        eventTitle: json["eventTitle"],
        date: json["date"],
        eventId: json["eventId"],
    );

    Map<String, dynamic> toJson() => {
        "eventTitle": eventTitle,
        "date": date,
        "eventId": eventId,
    };
}
