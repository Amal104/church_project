import 'dart:convert';

AboutChurch aboutChurchFromJson(String str) => AboutChurch.fromJson(json.decode(str));

String aboutChurchToJson(AboutChurch data) => json.encode(data.toJson());

class AboutChurch {
    AboutChurch({
        required this.parishName,
        required this.parishPhoto,
        required this.address,
        required this.email,
        required this.website,
        required this.mobile1,
        required this.mobile2,
        required this.landline1,
        required this.landline2,
        required this.metropolitan,
        required this.metropolitianImage,
        required this.diocesanBishop,
        required this.diocesanBishopImage,
        required this.vicarName,
        required this.asstVicarName,
        required this.sextonName,
        required this.latitude,
        required this.longitude,
        required this.parishId,
    });

    String parishName;
    String parishPhoto;
    String address;
    String email;
    String website;
    String mobile1;
    String mobile2;
    String landline1;
    String landline2;
    String metropolitan;
    String metropolitianImage;
    String diocesanBishop;
    String diocesanBishopImage;
    String vicarName;
    String asstVicarName;
    String sextonName;
    String latitude;
    String longitude;
    int parishId;

    factory AboutChurch.fromJson(Map<String, dynamic> json) => AboutChurch(
        parishName: json["parishName"],
        parishPhoto: json["parishPhoto"],
        address: json["address"],
        email: json["email"],
        website: json["website"],
        mobile1: json["mobile1"],
        mobile2: json["mobile2"],
        landline1: json["landline1"],
        landline2: json["landline2"],
        metropolitan: json["metropolitan"],
        metropolitianImage: json["metropolitianImage"],
        diocesanBishop: json["diocesanBishop"],
        diocesanBishopImage: json["diocesanBishopImage"],
        vicarName: json["vicarName"],
        asstVicarName: json["asstVicarName"],
        sextonName: json["sextonName"],
        latitude: json["latitude"],
        longitude: json["longitude"],
        parishId: json["parishId"],
    );

    Map<String, dynamic> toJson() => {
        "parishName": parishName,
        "parishPhoto": parishPhoto,
        "address": address,
        "email": email,
        "website": website,
        "mobile1": mobile1,
        "mobile2": mobile2,
        "landline1": landline1,
        "landline2": landline2,
        "metropolitan": metropolitan,
        "metropolitianImage": metropolitianImage,
        "diocesanBishop": diocesanBishop,
        "diocesanBishopImage": diocesanBishopImage,
        "vicarName": vicarName,
        "asstVicarName": asstVicarName,
        "sextonName": sextonName,
        "latitude": latitude,
        "longitude": longitude,
        "parishId": parishId,
    };
}
