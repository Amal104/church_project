import 'dart:convert';

List<WorshipTimeModel> worshipTimeModelFromJson(String str) => List<WorshipTimeModel>.from(json.decode(str).map((x) => WorshipTimeModel.fromJson(x)));

String worshipTimeModelToJson(List<WorshipTimeModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class WorshipTimeModel {
    WorshipTimeModel({
        required this.time,
        required this.day,
        required this.title,
        required this.worshipTimeId,
    });

    String time;
    String day;
    String title;
    int worshipTimeId;

    factory WorshipTimeModel.fromJson(Map<String, dynamic> json) => WorshipTimeModel(
        time: json["time"],
        day: json["day"],
        title: json["title"],
        worshipTimeId: json["worshipTimeId"],
    );

    Map<String, dynamic> toJson() => {
        "time": time,
        "day": day,
        "title": title,
        "worshipTimeId": worshipTimeId,
    };
}
