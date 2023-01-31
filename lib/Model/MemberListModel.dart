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
        required this.organization,
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
    Organization organization;
    String landline;
    String mobilePhone;
    String phoneOffice;
    String email;
    String bloodGroup;
    DateTime birthday;
    DateTime marriageDate;
    String homeParishHouseName;
    String homeParish;
    String nativePlace;
    String memberPhoto;
    String latitude;
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
        organization: Organization.fromJson(json["organization"]),
        landline: json["landline"],
        mobilePhone: json["mobile_phone"],
        phoneOffice: json["phone_office"],
        email: json["email"],
        bloodGroup: json["blood_group"],
        birthday: DateTime.parse(json["birthday"]),
        marriageDate: DateTime.parse(json["marriage_date"]),
        homeParishHouseName: json["home_parish_house_name"],
        homeParish: json["home_parish"],
        nativePlace: json["native_place"],
        memberPhoto: json["member_photo"],
        latitude: json["latitude"],
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
        "organization": organization.toJson(),
        "landline": landline,
        "mobile_phone": mobilePhone,
        "phone_office": phoneOffice,
        "email": email,
        "blood_group": bloodGroup,
        "birthday": birthday.toIso8601String(),
        "marriage_date": marriageDate.toIso8601String(),
        "home_parish_house_name": homeParishHouseName,
        "home_parish": homeParish,
        "native_place": nativePlace,
        "member_photo": memberPhoto,
        "latitude": latitude,
        "general_remarks": generalRemarks,
        "memberId": memberId,
    };
}

class Organization {
    Organization({
        required this.id,
        required this.organisationName,
        required this.v,
        required this.organisationId,
    });

    String id;
    String organisationName;
    int v;
    int organisationId;

    factory Organization.fromJson(Map<String, dynamic> json) => Organization(
        id: json["_id"],
        organisationName: json["organisationName"],
        v: json["__v"],
        organisationId: json["organisationId"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "organisationName": organisationName,
        "__v": v,
        "organisationId": organisationId,
    };
}

class PrayerGroup {
    PrayerGroup({
        required this.id,
        required this.prayerGroupName,
        required this.v,
        required this.prayerGroupId,
    });

    String id;
    String prayerGroupName;
    int v;
    int prayerGroupId;

    factory PrayerGroup.fromJson(Map<String, dynamic> json) => PrayerGroup(
        id: json["_id"],
        prayerGroupName: json["prayerGroupName"],
        v: json["__v"],
        prayerGroupId: json["prayerGroupId"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "prayerGroupName": prayerGroupName,
        "__v": v,
        "prayerGroupId": prayerGroupId,
    };
}
