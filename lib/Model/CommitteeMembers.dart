// To parse this JSON data, do
//
//     final committeeMembers = committeeMembersFromJson(jsonString);

import 'dart:convert';

List<CommitteeMembers> committeeMembersFromJson(String str) => List<CommitteeMembers>.from(json.decode(str).map((x) => CommitteeMembers.fromJson(x)));

String committeeMembersToJson(List<CommitteeMembers> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class CommitteeMembers {
    CommitteeMembers({
        required this.id,
        required this.name,
        required this.email,
        required this.phoneNo,
        required this.organisation,
        required this.position,
        required this.committeMemberPhoto,
        required this.committeMemberId,
    });

    String id;
    String name;
    String email;
    String phoneNo;
    Organisation organisation;
    Position position;
    String committeMemberPhoto;
    int committeMemberId;

    factory CommitteeMembers.fromJson(Map<String, dynamic> json) => CommitteeMembers(
        id: json["_id"],
        name: json["name"],
        email: json["email"],
        phoneNo: json["phoneNo"],
        organisation: Organisation.fromJson(json["organisation"]),
        position: Position.fromJson(json["position"]),
        committeMemberPhoto: json["committeMemberPhoto"],
        committeMemberId: json["committeMemberId"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "name": name,
        "email": email,
        "phoneNo": phoneNo,
        "organisation": organisation.toJson(),
        "position": position.toJson(),
        "committeMemberPhoto": committeMemberPhoto,
        "committeMemberId": committeMemberId,
    };
}

class Organisation {
    Organisation({
        required this.id,
        required this.organisationName,
        required this.v,
        required this.organisationId,
    });

    String id;
    String organisationName;
    int v;
    int organisationId;

    factory Organisation.fromJson(Map<String, dynamic> json) => Organisation(
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

class Position {
    Position({
        required this.id,
        required this.positionName,
        required this.positionId,
        required this.v,
    });

    String id;
    String positionName;
    int positionId;
    int v;

    factory Position.fromJson(Map<String, dynamic> json) => Position(
        id: json["_id"],
        positionName: json["positionName"],
        positionId: json["positionId"],
        v: json["__v"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "positionName": positionName,
        "positionId": positionId,
        "__v": v,
    };
}
