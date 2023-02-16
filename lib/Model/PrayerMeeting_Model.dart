import 'dart:convert';

List<PrayerMeetingModel> prayerMeetingModelFromJson(String str) => List<PrayerMeetingModel>.from(json.decode(str).map((x) => PrayerMeetingModel.fromJson(x)));

String prayerMeetingModelToJson(List<PrayerMeetingModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class PrayerMeetingModel {
    PrayerMeetingModel({
        required this.group,
        required this.venue,
        required this.date,
    });

    Group group;
    String venue;
    DateTime date;

    factory PrayerMeetingModel.fromJson(Map<String, dynamic> json) => PrayerMeetingModel(
        group: Group.fromJson(json["group"]),
        venue: json["venue"],
        date: DateTime.parse(json["date"]),
    );

    Map<String, dynamic> toJson() => {
        "group": group.toJson(),
        "venue": venue,
        "date": date.toIso8601String(),
    };
}

class Group {
    Group({
        required this.id,
        required this.prayerGroupName,
        required this.v,
        required this.prayerGroupId,
    });

    String id;
    String prayerGroupName;
    int v;
    int prayerGroupId;

    factory Group.fromJson(Map<String, dynamic> json) => Group(
        id: json["_id"],
        prayerGroupName: json["prayerGroupName"],
        v: json["__v"],
        prayerGroupId: json["prayerGroupId"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "prayerGroupName": prayerGroupName,
        "__v": v,
        "prayerGroupId": prayerGroupId,
    };
}
