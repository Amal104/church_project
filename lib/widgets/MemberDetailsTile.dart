import 'package:church/Extensions/StringExtension.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../values/values.dart';

class MemberDetailsTile extends StatelessWidget {
  const MemberDetailsTile({
    super.key,
    required this.size,
    required this.memberName,
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
    required this.homeParishHouseName,
    required this.homeParish,
    required this.nativePlace,
    required this.generalRemarks,
  });

  final Size size;
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
  final String homeParishHouseName;
  final String homeParish;
  final String nativePlace;
  final String generalRemarks;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          height: size.height * 0.03,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Member Name",
              style: GoogleFonts.inter(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
                color: AppColor.grey600,
              ),
            ),
            SizedBox(
              width: size.width * 0.2,
            ),
            Text(
              memberName.toTitleCase(),
              style: GoogleFonts.inter(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        SizedBox(
          height: size.height * 0.03,
        ),
        Card(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          color: AppColor.lightGreyShade,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: size.width * 0.02),
            child: ConstrainedBox(
              constraints: BoxConstraints(
                minHeight: size.height * 0.06,
                minWidth: size.width,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Member ID"),
                  Text(memberid.toString()),
                ],
              ),
            ),
          ),
        ),
        Card(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          color: AppColor.lightGreyShade,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: size.width * 0.02),
            child: ConstrainedBox(
              constraints: BoxConstraints(
                minHeight: size.height * 0.06,
                minWidth: size.width,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Email"),
                  Text(email),
                ],
              ),
            ),
          ),
        ),
        Card(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          color: AppColor.lightGreyShade,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: size.width * 0.02),
            child: ConstrainedBox(
              constraints: BoxConstraints(
                minHeight: size.height * 0.06,
                minWidth: size.width,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Edavaka RegNo"),
                  Text(edavakaReg.toString()),
                ],
              ),
            ),
          ),
        ),
        Card(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          color: AppColor.lightGreyShade,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: size.width * 0.02),
            child: ConstrainedBox(
              constraints: BoxConstraints(
                minHeight: size.height * 0.06,
                minWidth: size.width,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Gender"),
                  Text(gender),
                ],
              ),
            ),
          ),
        ),
        Card(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          color: AppColor.lightGreyShade,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: size.width * 0.02),
            child: ConstrainedBox(
              constraints: BoxConstraints(
                minHeight: size.height * 0.06,
                minWidth: size.width,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Membership Status"),
                  Text(membershipStatus),
                ],
              ),
            ),
          ),
        ),
        Card(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          color: AppColor.lightGreyShade,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: size.width * 0.02),
            child: ConstrainedBox(
              constraints: BoxConstraints(
                minHeight: size.height * 0.06,
                minWidth: size.width,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("House Name"),
                  Text(housename),
                ],
              ),
            ),
          ),
        ),
        Card(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          color: AppColor.lightGreyShade,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: size.width * 0.02),
            child: ConstrainedBox(
              constraints: BoxConstraints(
                minHeight: size.height * 0.09,
                minWidth: size.width,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Present Address"),
                  Text(address1),
                ],
              ),
            ),
          ),
        ),
        Card(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          color: AppColor.lightGreyShade,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: size.width * 0.02),
            child: ConstrainedBox(
              constraints: BoxConstraints(
                minHeight: size.height * 0.09,
                minWidth: size.width,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Permanent Address"),
                  Text(address2),
                ],
              ),
            ),
          ),
        ),
        Card(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          color: AppColor.lightGreyShade,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: size.width * 0.02),
            child: ConstrainedBox(
              constraints: BoxConstraints(
                minHeight: size.height * 0.06,
                minWidth: size.width,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Postoffice"),
                  Text(postoffice),
                ],
              ),
            ),
          ),
        ),
        Card(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          color: AppColor.lightGreyShade,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: size.width * 0.02),
            child: ConstrainedBox(
              constraints: BoxConstraints(
                minHeight: size.height * 0.06,
                minWidth: size.width,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Pincode"),
                  Text(pincode.toString()),
                ],
              ),
            ),
          ),
        ),
        Card(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          color: AppColor.lightGreyShade,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: size.width * 0.02),
            child: ConstrainedBox(
              constraints: BoxConstraints(
                minHeight: size.height * 0.06,
                minWidth: size.width,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Prayer Group"),
                  Text(prayerGroup),
                ],
              ),
            ),
          ),
        ),
        Card(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          color: AppColor.lightGreyShade,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: size.width * 0.02),
            child: ConstrainedBox(
              constraints: BoxConstraints(
                minHeight: size.height * 0.06,
                minWidth: size.width,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Designation"),
                  Text(designation),
                ],
              ),
            ),
          ),
        ),
        Card(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          color: AppColor.lightGreyShade,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: size.width * 0.02),
            child: ConstrainedBox(
              constraints: BoxConstraints(
                minHeight: size.height * 0.06,
                minWidth: size.width,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Organisation"),
                  Text(organization),
                ],
              ),
            ),
          ),
        ),
        Card(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          color: AppColor.lightGreyShade,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: size.width * 0.02),
            child: ConstrainedBox(
              constraints: BoxConstraints(
                minHeight: size.height * 0.06,
                minWidth: size.width,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Mobile"),
                  Text(mobile),
                ],
              ),
            ),
          ),
        ),
        Card(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          color: AppColor.lightGreyShade,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: size.width * 0.02),
            child: ConstrainedBox(
              constraints: BoxConstraints(
                minHeight: size.height * 0.06,
                minWidth: size.width,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Tel Phone"),
                  Text(phoneOffice),
                ],
              ),
            ),
          ),
        ),
        // Text(birthday),
        // Text(marriageDate),
        Card(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          color: AppColor.lightGreyShade,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: size.width * 0.02),
            child: ConstrainedBox(
              constraints: BoxConstraints(
                minHeight: size.height * 0.06,
                minWidth: size.width,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("HomeParish HouseName"),
                  Text(homeParishHouseName),
                ],
              ),
            ),
          ),
        ),
        Card(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          color: AppColor.lightGreyShade,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: size.width * 0.02),
            child: ConstrainedBox(
              constraints: BoxConstraints(
                minHeight: size.height * 0.06,
                minWidth: size.width,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Home Parish"),
                  Text(homeParish),
                ],
              ),
            ),
          ),
        ),
        Card(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          color: AppColor.lightGreyShade,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: size.width * 0.02),
            child: ConstrainedBox(
              constraints: BoxConstraints(
                minHeight: size.height * 0.06,
                minWidth: size.width,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Native Place"),
                  Text(nativePlace),
                ],
              ),
            ),
          ),
        ),
        Card(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          color: AppColor.lightGreyShade,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: size.width * 0.02),
            child: ConstrainedBox(
              constraints: BoxConstraints(
                minHeight: size.height * 0.06,
                minWidth: size.width,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("General Remarks"),
                  SizedBox(
                    height: size.height * 0.005,
                  ),
                  Text(generalRemarks),
                ],
              ),
            ),
          ),
        ),
        SizedBox(height: size.height * 0.05,)
      ],
    );
  }
}
