import 'dart:convert';

List<AnnouncementModel> announcementModelFromJson(String str) => List<AnnouncementModel>.from(json.decode(str).map((x) => AnnouncementModel.fromJson(x)));

String announcementModelToJson(List<AnnouncementModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class AnnouncementModel {
    AnnouncementModel({
        required this.title,
        required this.body,
        required this.announcementId,
    });

    String title;
    String body;
    int announcementId;

    factory AnnouncementModel.fromJson(Map<String, dynamic> json) => AnnouncementModel(
        title: json["title"],
        body: json["body"],
        announcementId: json["announcementId"],
    );

    Map<String, dynamic> toJson() => {
        "title": title,
        "body": body,
        "announcementId": announcementId,
    };
}
