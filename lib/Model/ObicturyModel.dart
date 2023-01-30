
import 'dart:convert';

List<ObicturyModel> obicturyModelFromJson(String str) => List<ObicturyModel>.from(json.decode(str).map((x) => ObicturyModel.fromJson(x)));

String obicturyModelToJson(List<ObicturyModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ObicturyModel {
    ObicturyModel({
        required this.id,
        required this.date,
        required this.member,
        required this.description,
        required this.obituaryId,
    });

    String id;
    String date;
    String member;
    String description;
    int obituaryId;

    factory ObicturyModel.fromJson(Map<String, dynamic> json) => ObicturyModel(
        id: json["_id"],
        date: json["date"],
        member: json["member"],
        description: json["description"],
        obituaryId: json["obituaryId"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "date": date,
        "member": member,
        "description": description,
        "obituaryId": obituaryId,
    };
}
