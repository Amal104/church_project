// To parse this JSON data, do
//
//     final obicturyModel = obicturyModelFromJson(jsonString);

import 'dart:convert';

List<ObituaryModel> obicturyModelFromJson(String str) => List<ObituaryModel>.from(json.decode(str).map((x) => ObituaryModel.fromJson(x)));

String obicturyModelToJson(List<ObituaryModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ObituaryModel {
    ObituaryModel({
        required this.id,
        required this.date,
        required this.member,
        required this.description,
        required this.memeberPhoto,
        required this.obituaryId,
    });

    String id;
    DateTime date;
    String member;
    String description;
    String memeberPhoto;
    int obituaryId;

    factory ObituaryModel.fromJson(Map<String, dynamic> json) => ObituaryModel(
        id: json["_id"],
        date: DateTime.parse(json["date"]),
        member: json["member"],
        description: json["description"],
        memeberPhoto: json["memeberPhoto"],
        obituaryId: json["obituaryId"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "date": date.toIso8601String(),
        "member": member,
        "description": description,
        "memeberPhoto": memeberPhoto,
        "obituaryId": obituaryId,
    };
}
