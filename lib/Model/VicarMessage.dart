class VicarMessageModel {
    VicarMessageModel({
        required this.id,
        required this.name,
        required this.message,
    });

    String name;
    String id;
    String message;

    factory VicarMessageModel.fromJson(Map<String, dynamic> json) => VicarMessageModel(
        id: json["_id"],
        name: json["name"] ?? "",
        message: json["message"] ?? "",
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "name": name,
        "message": message,
    };
}
