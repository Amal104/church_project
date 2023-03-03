import 'dart:convert';

List<DownloadModel> downloadModelFromJson(String str) => List<DownloadModel>.from(json.decode(str).map((x) => DownloadModel.fromJson(x)));

String downloadModelToJson(List<DownloadModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class DownloadModel {
    DownloadModel({
        required this.title,
        required this.upload,
        required this.downloadId,
    });

    String title;
    String upload;
    int downloadId;

    factory DownloadModel.fromJson(Map<String, dynamic> json) => DownloadModel(
        title: json["title"],
        upload: json["upload"],
        downloadId: json["downloadId"],
    );

    Map<String, dynamic> toJson() => {
        "title": title,
        "upload": upload,
        "downloadId": downloadId,
    };
}
