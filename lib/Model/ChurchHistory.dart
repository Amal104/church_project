import 'dart:convert';

ChurchHistoryModel churchHistoryModelFromJson(String str) => ChurchHistoryModel.fromJson(json.decode(str));

String churchHistoryModelToJson(ChurchHistoryModel data) => json.encode(data.toJson());

class ChurchHistoryModel {
    ChurchHistoryModel({
        required this.description,
        required this.historyId,
    });

    String description;
    int historyId;

    factory ChurchHistoryModel.fromJson(Map<String, dynamic> json) => ChurchHistoryModel(
        description: json["description"],
        historyId: json["historyId"],
    );

    Map<String, dynamic> toJson() => {
        "description": description,
        "historyId": historyId,
    };
}
