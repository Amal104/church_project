// To parse this JSON data, do
//
//     final vicarMessageModel = vicarMessageModelFromJson(jsonString);

import 'dart:convert';

VicarMessageModel vicarMessageModelFromJson(String str) => VicarMessageModel.fromJson(json.decode(str));

String vicarMessageModelToJson(VicarMessageModel data) => json.encode(data.toJson());

class VicarMessageModel {
    VicarMessageModel({
        required this.vicar,
        required this.asstVicar,
    });

    Vicar vicar;
    Vicar asstVicar;

    factory VicarMessageModel.fromJson(Map<String, dynamic> json) => VicarMessageModel(
        vicar: Vicar.fromJson(json["vicar"]),
        asstVicar: Vicar.fromJson(json["asstVicar"]),
    );

    Map<String, dynamic> toJson() => {
        "vicar": vicar.toJson(),
        "asstVicar": asstVicar.toJson(),
    };
}

class Vicar {
    Vicar({
        required this.name,
        required this.message,
        required this.photo,
    });

    String name;
    String message;
    String photo;

    factory Vicar.fromJson(Map<String, dynamic> json) => Vicar(
        name: json["name"],
        message: json["message"],
        photo: json["photo"],
    );

    Map<String, dynamic> toJson() => {
        "name": name,
        "message": message,
        "photo": photo,
    };
}
