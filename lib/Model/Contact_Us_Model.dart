// To parse this JSON data, do
//
//     final contactUsModel = contactUsModelFromJson(jsonString);

import 'dart:convert';

ContactUsModel contactUsModelFromJson(String str) => ContactUsModel.fromJson(json.decode(str));

String contactUsModelToJson(ContactUsModel data) => json.encode(data.toJson());

class ContactUsModel {
    ContactUsModel({
        required this.address,
        required this.email,
        required this.website,
        required this.mobile1,
        required this.mobile2,
        required this.landline1,
        required this.landline2,
        required this.parishName,
    });

    String address;
    String email;
    String website;
    String mobile1;
    String mobile2;
    String landline1;
    String landline2;
    String parishName;

    factory ContactUsModel.fromJson(Map<String, dynamic> json) => ContactUsModel(
        address: json["address"],
        email: json["email"],
        website: json["website"],
        mobile1: json["mobile1"],
        mobile2: json["mobile2"],
        landline1: json["landline1"],
        landline2: json["landline2"],
        parishName: json["parishName"],
    );

    Map<String, dynamic> toJson() => {
        "address": address,
        "email": email,
        "website": website,
        "mobile1": mobile1,
        "mobile2": mobile2,
        "landline1": landline1,
        "landline2": landline2,
        "parishName":parishName,
    };
}
