class CommitteeMembers {
    CommitteeMembers({
        required this.id,
        required this.name,
        required this.email,
        required this.phoneNo,
        required this.organisation,
        required this.position,
    });

    String id;
    String name;
    String email;
    String phoneNo;
    String organisation;
    String position;

    factory CommitteeMembers.fromJson(Map<String, dynamic> json) => CommitteeMembers(
        id: json["_id"],
        name: json["name"],
        email: json["email"],
        phoneNo: json["phoneNo"],
        organisation: json["organisation"],
        position: json["position"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "name": name,
        "email": email,
        "phoneNo": phoneNo,
        "organisation": organisation,
        "position": position,
    };
}
