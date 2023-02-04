import 'package:cached_network_image/cached_network_image.dart';
import 'package:church/Model/MemberListModel.dart';
import 'package:church/values/values.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

import '../widgets/MemberDetailsTile.dart';

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
      required this.memberName,
      required this.photo,
      required this.item});

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
  final String photo;
  final MemberListModel item;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: SizedBox(
        width: size.width,
        height: size.height,
        child: Stack(
          clipBehavior: Clip.none,
          fit: StackFit.loose,
          children: [
            Hero(
              tag: item,
              child: CachedNetworkImage(
                imageUrl: photo,
                height: size.height * 0.4,
                width: size.width,
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: size.height * 0.065),
              child: IconButton(
                  onPressed: () => Get.back(),
                  icon: const FaIcon(
                    FontAwesomeIcons.chevronLeft,
                    color: AppColor.solidBlack,
                  )),
            ),
            Positioned(
              bottom: 0,
              child: Container(
                padding: EdgeInsets.symmetric(
                  horizontal: size.width * 0.025,
                  vertical: size.height * 0.02,
                ),
                width: size.width,
                height: size.height * 0.64,
                decoration: const BoxDecoration(
                  color: AppColor.solidWhite,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                ),
                child: SingleChildScrollView(
                  child: MemberDetailsTile(
                    size: size,
                    memberName: memberName,
                    memberid: memberid,
                    email: email,
                    edavakaReg: edavakaReg,
                    gender: gender,
                    membershipStatus: membershipStatus,
                    housename: housename,
                    address1: address1,
                    address2: address2,
                    postoffice: postoffice,
                    pincode: pincode,
                    prayerGroup: prayerGroup,
                    designation: designation,
                    organization: organization,
                    mobile: mobile,
                    phoneOffice: phoneOffice,
                    homeParishHouseName: homeParishHouseName,
                    homeParish: homeParish,
                    nativePlace: nativePlace,
                    generalRemarks: generalRemarks,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
