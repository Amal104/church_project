import 'package:church/Extensions/StringExtension.dart';
import 'package:church/provider/Location_Provider.dart';
import 'package:church/values/SnackBar.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';

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
    required this.latitude,
    required this.longitude,
    required this.marriageDate,
    required this.birthDay,
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
  final String latitude;
  final String longitude;
  final DateTime? marriageDate;
  final DateTime birthDay;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: size.height * 0.03,
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: size.width * 0.02),
          child: Row(
            // mainAxisAlignment: MainAxisAlignment.spaceAround,
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
                width: size.width * 0.1,
              ),
              SizedBox(
                width: size.width * 0.45,
                child: Text(
                  memberName.toTitleCase(),textAlign: TextAlign.right,
                  style: GoogleFonts.inter(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: size.height * 0.03,
        ),
        Expanded(
          child: ListView(
            padding: const EdgeInsets.symmetric(vertical: 0),
            children: [
              // Card(
              //   shape: RoundedRectangleBorder(
              //       borderRadius: BorderRadius.circular(12)),
              //   color: AppColor.lightGreyShade,
              //   child: Padding(
              //     padding: EdgeInsets.symmetric(horizontal: size.width * 0.02),
              //     child: ConstrainedBox(
              //       constraints: BoxConstraints(
              //         minHeight: size.height * 0.06,
              //         minWidth: size.width,
              //       ),
              //       child: Row(
              //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //         children: [
              //           Text(
              //             "Member ID",
              //             style: GoogleFonts.inter(),
              //           ),
              //           Text(
              //             memberid.toString(),
              //             style: GoogleFonts.inter(fontWeight: FontWeight.w600),
              //           ),
              //         ],
              //       ),
              //     ),
              //   ),
              // ),
              // Card(
              //   shape: RoundedRectangleBorder(
              //       borderRadius: BorderRadius.circular(12)),
              //   color: AppColor.lightGreyShade,
              //   child: Padding(
              //     padding: EdgeInsets.symmetric(horizontal: size.width * 0.02),
              //     child: ConstrainedBox(
              //       constraints: BoxConstraints(
              //         minHeight: size.height * 0.06,
              //         minWidth: size.width,
              //       ),
              //       child: Row(
              //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //         children: [
              //           Text(
              //             "Edavaka RegNo",
              //             style: GoogleFonts.inter(),
              //           ),
              //           Text(
              //             edavakaReg.toString(),
              //             style: GoogleFonts.inter(fontWeight: FontWeight.w600),
              //           ),
              //         ],
              //       ),
              //     ),
              //   ),
              // ),
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
                          gender.toCapitalized(),
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
                          "Birthday",
                          style: GoogleFonts.inter(),
                        ),
                        Text(
                          DateFormat("dd-MM-yyyy").format(birthDay),
                          style: GoogleFonts.inter(fontWeight: FontWeight.w600),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  launchUrlString("tel:$mobile");
                },
                child: Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12)),
                  color: AppColor.lightGreyShade,
                  child: Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: size.width * 0.02),
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
                          Row(
                            children: [
                              Text(
                                mobile,
                                style: GoogleFonts.inter(
                                    fontWeight: FontWeight.w600),
                              ),
                              SizedBox(
                                width: size.width * 0.01,
                              ),
                              Icon(
                                Icons.phone,
                                size: size.height * 0.025,
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  Clipboard.setData(ClipboardData(text: email));
                  Customsnackbar.showSnackBar(context, "Email",
                      "Copied successfully", AppColor.purpleShade);
                },
                child: Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12)),
                  color: AppColor.lightGreyShade,
                  child: Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: size.width * 0.02),
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
                            style:
                                GoogleFonts.inter(fontWeight: FontWeight.w600),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              if (marriageDate != null)
                Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12)),
                  color: AppColor.lightGreyShade,
                  child: Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: size.width * 0.02),
                    child: ConstrainedBox(
                      constraints: BoxConstraints(
                        minHeight: size.height * 0.06,
                        minWidth: size.width,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Marriage Date",
                            style: GoogleFonts.inter(),
                          ),
                          Text(
                            DateFormat("dd-MM-yyyy").format(marriageDate!),
                            style:
                                GoogleFonts.inter(fontWeight: FontWeight.w600),
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
                          membershipStatus.toCapitalized(),
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
                          housename.toTitleCase(),
                          style: GoogleFonts.inter(fontWeight: FontWeight.w600),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Consumer<LocationProvider>(
                builder: (context, provider, child) => InkWell(
                  onTap: () {
                    provider.openMap(latitude, longitude);
                  },
                  child: Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12)),
                    color: AppColor.lightGreyShade,
                    child: Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: size.width * 0.02),
                      child: ConstrainedBox(
                        constraints: BoxConstraints(
                          minHeight: size.height * 0.09,
                          minWidth: size.width,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
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
                                SizedBox(
                                  width: size.width * 0.65,
                                  child: Text(
                                    address1.toTitleCase(),
                                    style: GoogleFonts.inter(
                                        fontWeight: FontWeight.w600),
                                  ),
                                ),
                              ],
                            ),
                            Image.asset(
                              "assets/maplogo.png",
                              height: size.height * 0.04,
                            )
                          ],
                        ),
                      ),
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
                        SizedBox(
                          width: size.width * 0.65,
                          child: Text(
                            address2.toTitleCase(),
                            style:
                                GoogleFonts.inter(fontWeight: FontWeight.w600),
                          ),
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
                          postoffice.toCapitalized(),
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
                          prayerGroup.toCapitalized(),
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
                          designation.toCapitalized(),
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
                          organization.toTitleCase(),
                          style: GoogleFonts.inter(fontWeight: FontWeight.w600),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              if (phoneOffice != "")
                Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12)),
                  color: AppColor.lightGreyShade,
                  child: Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: size.width * 0.02),
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
                            style:
                                GoogleFonts.inter(fontWeight: FontWeight.w600),
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
                          homeParishHouseName.toTitleCase(),
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
                          homeParish.toTitleCase(),
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
                          nativePlace.toTitleCase(),
                          style: GoogleFonts.inter(fontWeight: FontWeight.w600),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              if (generalRemarks != "")
                Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12)),
                  color: AppColor.lightGreyShade,
                  child: Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: size.width * 0.02),
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
                            style:
                                GoogleFonts.inter(fontWeight: FontWeight.w600),
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
