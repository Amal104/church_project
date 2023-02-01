import 'package:flutter/material.dart';

class MemberDetails extends StatelessWidget {
  const MemberDetails(
      {super.key,
      required this.memberid,
      required this.email,
      required this.edavakaReg,
      required this.gender,
      required this.membershipStatus,
      required this.housename,
      required this.address1,
      required this.address2,
      required this.postoffice,
      required this.pincode,
      required this.prayerGroup,
      required this.designation,
      required this.organization,
      required this.mobile,
      required this.phoneOffice,
      required this.birthday,
      required this.marriageDate,
      required this.homeParishHouseName,
      required this.homeParish,
      required this.nativePlace,
      required this.generalRemarks,
      required this.memberName});

  final String memberName;
  final int memberid;
  final String email;
  final int edavakaReg;
  final String gender;
  final String membershipStatus;
  final String housename;
  final String address1;
  final String address2;
  final String postoffice;
  final int pincode;
  final String prayerGroup;
  final String designation;
  final String organization;
  final String mobile;
  final String phoneOffice;
  final DateTime birthday;
  final DateTime marriageDate;
  final String homeParishHouseName;
  final String homeParish;
  final String nativePlace;
  final String generalRemarks;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(memberName),
            SizedBox(
              height: size.height * 0.05,
            ),
            Text(memberid.toString()),
            Text(email),
            Text(edavakaReg.toString()),
            Text(gender),
            Text(membershipStatus),
            Text(housename),
            Text(address1),
            Text(address2),
            Text(postoffice),
            Text(pincode.toString()),
            Text(prayerGroup),
            Text(designation),
            Text(organization),
            Text(mobile),
            Text(phoneOffice),
            // Text(birthday),
            // Text(marriageDate),
            Text(homeParishHouseName),
            Text(homeParish),
            Text(nativePlace),
            Text(generalRemarks),
          ],
        ),
      ),
    );
  }
}
