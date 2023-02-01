import 'dart:convert';

List<FlashNewsModel> flashNewsModelFromJson(String str) => List<FlashNewsModel>.from(json.decode(str).map((x) => FlashNewsModel.fromJson(x)));

String flashNewsModelToJson(List<FlashNewsModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class FlashNewsModel {
    FlashNewsModel({
        required this.id,
        required this.txt,
        required this.createdAt,
        required this.updatedAt,
        required this.flashNewsId,
    });

    String id;
    String txt;
    DateTime createdAt;
    DateTime updatedAt;
    int flashNewsId;

    factory FlashNewsModel.fromJson(Map<String, dynamic> json) => FlashNewsModel(
        id: json["_id"],
        txt: json["txt"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        flashNewsId: json["flashNewsId"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "txt": txt,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "flashNewsId": flashNewsId,
    };
}
