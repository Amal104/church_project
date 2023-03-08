// To parse this JSON data, do
//
//     final birthdayAnniversaryModel = birthdayAnniversaryModelFromJson(jsonString);

import 'dart:convert';

BirthdayAnniversaryModel birthdayAnniversaryModelFromJson(String str) => BirthdayAnniversaryModel.fromJson(json.decode(str));

String birthdayAnniversaryModelToJson(BirthdayAnniversaryModel data) => json.encode(data.toJson());

class BirthdayAnniversaryModel {
    BirthdayAnniversaryModel({
        required this.birthdays,
        required this.anniversarys,
    });

    List<Anniversary> birthdays;
    List<Anniversary> anniversarys;

    factory BirthdayAnniversaryModel.fromJson(Map<String, dynamic> json) => BirthdayAnniversaryModel(
        birthdays: List<Anniversary>.from(json["birthdays"].map((x) => Anniversary.fromJson(x))),
        anniversarys: List<Anniversary>.from(json["anniversarys"].map((x) => Anniversary.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "birthdays": List<dynamic>.from(birthdays.map((x) => x.toJson())),
        "anniversarys": List<dynamic>.from(anniversarys.map((x) => x.toJson())),
    };
}

class Anniversary {
    Anniversary({
        required this.id,
        required this.memberIsPriest,
        required this.memberIsHead,
        required this.edavakaRegisterNo,
        required this.memberName,
        required this.petName,
        required this.photoSlno,
        required this.gender,
        required this.dateOfJoining,
        required this.membershipStatus,
        required this.houseName,
        required this.address1,
        required this.address2,
        required this.postoffice,
        required this.pincode,
        required this.votingRight,
        required this.designation,
        required this.landline,
        required this.mobilePhone,
        required this.phoneOffice,
        required this.email,
        required this.bloodGroup,
        required this.birthday,
        required this.marriageDate,
        required this.homeParishHouseName,
        required this.homeParish,
        required this.nativePlace,
        required this.memberPhoto,
        required this.latitude,
        required this.longitude,
        required this.generalRemarks,
        required this.memberId,
    });

    String id;
    bool memberIsPriest;
    bool memberIsHead;
    int edavakaRegisterNo;
    String memberName;
    String petName;
    int photoSlno;
    String gender;
    DateTime dateOfJoining;
    String membershipStatus;
    String houseName;
    String address1;
    String address2;
    String postoffice;
    int pincode;
    bool votingRight;
    String designation;
    String landline;
    String mobilePhone;
    String phoneOffice;
    String email;
    String bloodGroup;
    DateTime birthday;
    DateTime? marriageDate;
    String homeParishHouseName;
    String homeParish;
    String nativePlace;
    String memberPhoto;
    String latitude;
    String longitude;
    String generalRemarks;
    int memberId;

    factory Anniversary.fromJson(Map<String, dynamic> json) => Anniversary(
        id: json["_id"],
        memberIsPriest: json["member_is_priest"],
        memberIsHead: json["member_is_head"],
        edavakaRegisterNo: json["edavaka_register_no"],
        memberName: json["member_name"],
        petName: json["pet_name"],
        photoSlno: json["photo_slno"],
        gender: json["gender"],
        dateOfJoining: DateTime.parse(json["Date_of_joining"]),
        membershipStatus: json["membership_status"],
        houseName: json["house_name"],
        address1: json["address1"],
        address2: json["address2"],
        postoffice: json["postoffice"],
        pincode: json["pincode"],
        votingRight: json["voting_right"],
        designation: json["designation"],
        landline: json["landline"],
        mobilePhone: json["mobile_phone"],
        phoneOffice: json["phone_office"],
        email: json["email"],
        bloodGroup: json["blood_group"],
        birthday: DateTime.parse(json["birthday"]),
        marriageDate: json["marriage_date"] == null ? null : DateTime.parse(json["marriage_date"]),
        homeParishHouseName: json["home_parish_house_name"],
        homeParish: json["home_parish"],
        nativePlace: json["native_place"],
        memberPhoto: json["member_photo"],
        latitude: json["latitude"],
        longitude: json["longitude"],
        generalRemarks: json["general_remarks"],
        memberId: json["memberId"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "member_is_priest": memberIsPriest,
        "member_is_head": memberIsHead,
        "edavaka_register_no": edavakaRegisterNo,
        "member_name": memberName,
        "pet_name": petName,
        "photo_slno": photoSlno,
        "gender": gender,
        "Date_of_joining": dateOfJoining.toIso8601String(),
        "membership_status": membershipStatus,
        "house_name": houseName,
        "address1": address1,
        "address2": address2,
        "postoffice": postoffice,
        "pincode": pincode,
        "voting_right": votingRight,
        "designation": designation,
        "landline": landline,
        "mobile_phone": mobilePhone,
        "phone_office": phoneOffice,
        "email": email,
        "blood_group": bloodGroup,
        "birthday": birthday.toIso8601String(),
        "marriage_date": marriageDate?.toIso8601String(),
        "home_parish_house_name": homeParishHouseName,
        "home_parish": homeParish,
        "native_place": nativePlace,
        "member_photo": memberPhoto,
        "latitude": latitude,
        "longitude": longitude,
        "general_remarks": generalRemarks,
        "memberId": memberId,
    };
}
