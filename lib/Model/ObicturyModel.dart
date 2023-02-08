// To parse this JSON data, do
//
//     final obicturyModel = obicturyModelFromJson(jsonString);

import 'dart:convert';

List<ObicturyModel> obicturyModelFromJson(String str) => List<ObicturyModel>.from(json.decode(str).map((x) => ObicturyModel.fromJson(x)));

String obicturyModelToJson(List<ObicturyModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ObicturyModel {
    ObicturyModel({
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

    factory ObicturyModel.fromJson(Map<String, dynamic> json) => ObicturyModel(
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
