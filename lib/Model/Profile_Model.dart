import 'dart:convert';

ProfileModel profileModelFromJson(String str) => ProfileModel.fromJson(json.decode(str));

String profileModelToJson(ProfileModel data) => json.encode(data.toJson());

class ProfileModel {
    ProfileModel({
        required this.memberName,
        required this.houseName,
        required this.address1,
        required this.address2,
        required this.pincode,
        required this.landline,
        required this.mobilePhone,
        required this.email,
        required this.bloodGroup,
        required this.birthday,
        required this.homeParish,
        required this.memberPhoto,
    });

    String memberName;
    String houseName;
    String address1;
    String address2;
    int pincode;
    String landline;
    String mobilePhone;
    String email;
    String bloodGroup;
    DateTime birthday;
    String homeParish;
    String memberPhoto;

    factory ProfileModel.fromJson(Map<String, dynamic> json) => ProfileModel(
        memberName: json["member_name"],
        houseName: json["house_name"],
        address1: json["address1"],
        address2: json["address2"],
        pincode: json["pincode"],
        landline: json["landline"],
        mobilePhone: json["mobile_phone"],
        email: json["email"],
        bloodGroup: json["blood_group"],
        birthday: DateTime.parse(json["birthday"]),
        homeParish: json["home_parish"],
        memberPhoto: json["member_photo"],
    );

    Map<String, dynamic> toJson() => {
        "member_name": memberName,
        "house_name": houseName,
        "address1": address1,
        "address2": address2,
        "pincode": pincode,
        "landline": landline,
        "mobile_phone": mobilePhone,
        "email": email,
        "blood_group": bloodGroup,
        "birthday": birthday.toIso8601String(),
        "home_parish": homeParish,
        "member_photo": memberPhoto,
    };
}
