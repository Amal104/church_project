
import 'dart:convert';

List<Announcement> announcementFromJson(String str) => List<Announcement>.from(json.decode(str).map((x) => Announcement.fromJson(x)));

String announcementToJson(List<Announcement> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Announcement {
    Announcement({
        required this.title,
        required this.body,
        required this.announcementId,
    });

    String title;
    String body;
    int announcementId;

    factory Announcement.fromJson(Map<String, dynamic> json) => Announcement(
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
