import 'package:church/Extensions/StringExtension.dart';
import 'package:flutter/gestures.dart';
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
        Expanded(
          child: ListView(
            padding: const EdgeInsets.symmetric(vertical: 0),
            children: [
              Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12)),
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
                        Text(
                          "Member ID",
                          style: GoogleFonts.inter(),
                        ),
                        Text(
                          memberid.toString(),
                          style: GoogleFonts.inter(fontWeight: FontWeight.w600),
                        ),
                      ],
                    ),
                  ),
                ),
              ),

              Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12)),
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
                        Text(
                          "Email",
                          style: GoogleFonts.inter(),
                        ),
                        Text(
                          email,
                          style: GoogleFonts.inter(fontWeight: FontWeight.w600),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12)),
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
                        Text(
                          "Edavaka RegNo",
                          style: GoogleFonts.inter(),
                        ),
                        Text(
                          edavakaReg.toString(),
                          style: GoogleFonts.inter(fontWeight: FontWeight.w600),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12)),
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
                        Text(
                          "Gender",
                          style: GoogleFonts.inter(),
                        ),
                        Text(
                          gender,
                          style: GoogleFonts.inter(fontWeight: FontWeight.w600),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12)),
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
                        Text(
                          "Membership Status",
                          style: GoogleFonts.inter(),
                        ),
                        Text(
                          membershipStatus,
                          style: GoogleFonts.inter(fontWeight: FontWeight.w600),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12)),
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
                        Text(
                          "House Name",
                          style: GoogleFonts.inter(),
                        ),
                        Text(
                          housename,
                          style: GoogleFonts.inter(fontWeight: FontWeight.w600),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12)),
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
                        Text(
                          "Present Address",
                          style: GoogleFonts.inter(),
                        ),
                        SizedBox(
                          height: size.height * 0.006,
                        ),
                        Text(
                          address1,
                          style: GoogleFonts.inter(fontWeight: FontWeight.w600),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12)),
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
                        Text(
                          "Permanent Address",
                          style: GoogleFonts.inter(),
                        ),
                        SizedBox(
                          height: size.height * 0.006,
                        ),
                        Text(
                          address2,
                          style: GoogleFonts.inter(fontWeight: FontWeight.w600),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12)),
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
                        Text(
                          "Postoffice",
                          style: GoogleFonts.inter(),
                        ),
                        Text(
                          postoffice,
                          style: GoogleFonts.inter(fontWeight: FontWeight.w600),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12)),
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
                        Text(
                          "Pincode",
                          style: GoogleFonts.inter(),
                        ),
                        Text(
                          pincode.toString(),
                          style: GoogleFonts.inter(fontWeight: FontWeight.w600),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12)),
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
                        Text(
                          "Prayer Group",
                          style: GoogleFonts.inter(),
                        ),
                        Text(
                          prayerGroup,
                          style: GoogleFonts.inter(fontWeight: FontWeight.w600),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12)),
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
                        Text(
                          "Designation",
                          style: GoogleFonts.inter(),
                        ),
                        Text(
                          designation,
                          style: GoogleFonts.inter(fontWeight: FontWeight.w600),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12)),
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
                        Text(
                          "Organisation",
                          style: GoogleFonts.inter(),
                        ),
                        Text(
                          organization,
                          style: GoogleFonts.inter(fontWeight: FontWeight.w600),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12)),
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
                        Text(
                          "Mobile",
                          style: GoogleFonts.inter(),
                        ),
                        Text(
                          mobile,
                          style: GoogleFonts.inter(fontWeight: FontWeight.w600),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12)),
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
                        Text(
                          "Tel Phone",
                          style: GoogleFonts.inter(),
                        ),
                        Text(
                          phoneOffice,
                          style: GoogleFonts.inter(fontWeight: FontWeight.w600),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              // Text(birthday),
              // Text(marriageDate),
              Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12)),
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
                        Text(
                          "HomeParish HouseName",
                          style: GoogleFonts.inter(),
                        ),
                        Text(
                          homeParishHouseName,
                          style: GoogleFonts.inter(fontWeight: FontWeight.w600),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12)),
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
                        Text(
                          "Home Parish",
                          style: GoogleFonts.inter(),
                        ),
                        Text(
                          homeParish,
                          style: GoogleFonts.inter(fontWeight: FontWeight.w600),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12)),
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
                        Text(
                          "Native Place",
                          style: GoogleFonts.inter(),
                        ),
                        Text(
                          nativePlace,
                          style: GoogleFonts.inter(fontWeight: FontWeight.w600),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12)),
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
                        Text(
                          "General Remarks",
                          style: GoogleFonts.inter(),
                        ),
                        SizedBox(
                          height: size.height * 0.006,
                        ),
                        Text(
                          generalRemarks,
                          style: GoogleFonts.inter(fontWeight: FontWeight.w600),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: size.height * 0.03,
              )
            ],
          ),
        ),
      ],
    );
  }
}
