// To parse this JSON data, do
//
//     final flashNewsModel = flashNewsModelFromJson(jsonString);

import 'dart:convert';

List<FlashNewsModel> flashNewsModelFromJson(String str) => List<FlashNewsModel>.from(json.decode(str).map((x) => FlashNewsModel.fromJson(x)));

String flashNewsModelToJson(List<FlashNewsModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class FlashNewsModel {
    FlashNewsModel({
        required this.txt,
    });

    String txt;

    factory FlashNewsModel.fromJson(Map<String, dynamic> json) => FlashNewsModel(
        txt: json["txt"],
    );

    Map<String, dynamic> toJson() => {
        "txt": txt,
    };
}
