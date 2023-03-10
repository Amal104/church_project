// To parse this JSON data, do
//
//     final memberListModel = memberListModelFromJson(jsonString);

import 'dart:convert';

List<MemberListModel> memberListModelFromJson(String str) => List<MemberListModel>.from(json.decode(str).map((x) => MemberListModel.fromJson(x)));

String memberListModelToJson(List<MemberListModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class MemberListModel {
    MemberListModel({
        required this.memberIsPriest,
        required this.memberIsHead,
        required this.edavakaRegisterNo,
        required this.memberName,
        required this.petName,
        required this.photoSlno,
        required this.gender,
        required this.membershipStatus,
        required this.houseName,
        required this.address1,
        required this.address2,
        required this.postoffice,
        required this.pincode,
        required this.prayerGroup,
        required this.designation,
        required this.organisation,
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

    bool memberIsPriest;
    bool memberIsHead;
    int edavakaRegisterNo;
    String memberName;
    String petName;
    int photoSlno;
    String gender;
    String membershipStatus;
    String houseName;
    String address1;
    String address2;
    String postoffice;
    int pincode;
    PrayerGroup prayerGroup;
    String designation;
    Organisation organisation;
    String? landline;
    String mobilePhone;
    String? phoneOffice;
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

    factory MemberListModel.fromJson(Map<String, dynamic> json) => MemberListModel(
        memberIsPriest: json["member_is_priest"],
        memberIsHead: json["member_is_head"],
        edavakaRegisterNo: json["edavaka_register_no"],
        memberName: json["member_name"],
        petName: json["pet_name"],
        photoSlno: json["photo_slno"],
        gender: json["gender"],
        membershipStatus: json["membership_status"],
        houseName: json["house_name"],
        address1: json["address1"],
        address2: json["address2"],
        postoffice: json["postoffice"],
        pincode: json["pincode"],
        prayerGroup: PrayerGroup.fromJson(json["prayer_group"]),
        designation: json["designation"],
        organisation: Organisation.fromJson(json["organisation"]),
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
        "member_is_priest": memberIsPriest,
        "member_is_head": memberIsHead,
        "edavaka_register_no": edavakaRegisterNo,
        "member_name": memberName,
        "pet_name": petName,
        "photo_slno": photoSlno,
        "gender": gender,
        "membership_status": membershipStatus,
        "house_name": houseName,
        "address1": address1,
        "address2": address2,
        "postoffice": postoffice,
        "pincode": pincode,
        "prayer_group": prayerGroup.toJson(),
        "designation": designation,
        "organisation": organisation.toJson(),
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

class Organisation {
    Organisation({
        required this.id,
        required this.organisationName,
        required this.organisationId,
        required this.hide,
        required this.v,
    });

    String id;
    String organisationName;
    int organisationId;
    bool hide;
    int v;

    factory Organisation.fromJson(Map<String, dynamic> json) => Organisation(
        id: json["_id"],
        organisationName: json["organisationName"],
        organisationId: json["organisationId"],
        hide: json["hide"],
        v: json["__v"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "organisationName": organisationName,
        "organisationId": organisationId,
        "hide": hide,
        "__v": v,
    };
}

class PrayerGroup {
    PrayerGroup({
        required this.id,
        required this.prayerGroupName,
        required this.hide,
        required this.prayerGroupId,
        required this.v,
    });

    String id;
    String prayerGroupName;
    bool hide;
    int prayerGroupId;
    int v;

    factory PrayerGroup.fromJson(Map<String, dynamic> json) => PrayerGroup(
        id: json["_id"],
        prayerGroupName: json["prayerGroupName"],
        hide: json["hide"],
        prayerGroupId: json["prayerGroupId"],
        v: json["__v"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "prayerGroupName": prayerGroupName,
        "hide": hide,
        "prayerGroupId": prayerGroupId,
        "__v": v,
    };
}
