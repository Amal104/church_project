import 'dart:async';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:church/Constants.dart';
import 'package:church/Extensions/StringExtension.dart';
import 'package:church/screens/MemberDetails.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import '../provider/MemberProvider.dart';
import '../values/values.dart';

class MemberPage extends StatefulWidget {
  const MemberPage({super.key});

  @override
  State<MemberPage> createState() => _MemberPageState();
}

class Debouncer {
  int? milliseconds;
  VoidCallback? action;
  Timer? timer;

  run(VoidCallback action) {
    if (null != timer) {
      timer!.cancel();
    }
    timer = Timer(
      const Duration(milliseconds: Duration.millisecondsPerSecond),
      action,
    );
  }
}

class _MemberPageState extends State<MemberPage> {
  @override
  void initState() {
    super.initState();
    final getmember = Provider.of<MemberProvider>(context, listen: false);
    getmember.searchMember();
  }

  @override
  Widget build(BuildContext context) {
    final getmember = Provider.of<MemberProvider>(context);
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            IconButton(
              onPressed: () {
                Get.back();
              },
              icon: const FaIcon(
                FontAwesomeIcons.chevronLeft,
                color: AppColor.grey400,
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: MediaQuery.of(context).size.width / 25,
              ),
              child: Text(
                "Members Details",
                style: GoogleFonts.inter(
                  fontSize: 25.0,
                  fontWeight: FontWeight.bold,
                  color: AppColor.grey600,
                  letterSpacing: 1.0,
                ),
              ),
            ),
            SizedBox(
              height: size.height * 0.02,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: size.width * 0.04),
              child: TextField(
                onChanged: (value) => getmember.search(value),
                decoration: InputDecoration(
                  filled: true,
                  fillColor: AppColor.lightGreyShade,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: BorderSide.none,
                  ),
                  hintText: "Search Member",
                  prefixIcon: const Icon(Icons.search,size: 30,),
                  prefixIconColor: AppColor.grey600
                ),
              ),
            ),
            SizedBox(
              height: size.height * 0.02,
            ),
            getmember.memberLists?.length != null
                ? Expanded(
                  child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: getmember.memberLists?.length,
                      itemBuilder: (context, index) {
                        var member = getmember.memberLists![index];
                        return Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: size.height * 0.015,
                              vertical: size.width * 0.010),
                          child: Card(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15)),
                            color: AppColor.lightGreyShade,
                            child: ListTile(
                              onTap: () {
                                Get.to(
                                  () => MemberDetails(
                                    memberid: member.memberId,
                                    email: member.email,
                                    edavakaReg: member.edavakaRegisterNo,
                                    gender: member.gender,
                                    membershipStatus: member.membershipStatus,
                                    housename: member.houseName,
                                    address1: member.address1,
                                    address2: member.address2,
                                    postoffice: member.postoffice,
                                    pincode: member.pincode,
                                    prayerGroup:
                                        member.prayerGroup.prayerGroupName,
                                    designation: member.designation,
                                    organization:
                                        member.organisation.organisationName,
                                    mobile: member.mobilePhone,
                                    phoneOffice: member.phoneOffice,
                                    birthday: member.birthday,
                                    marriageDate: member.marriageDate,
                                    homeParishHouseName:
                                        member.homeParishHouseName,
                                    homeParish: member.homeParish,
                                    nativePlace: member.nativePlace,
                                    generalRemarks: member.generalRemarks,
                                    memberName: member.memberName,
                                    photo: member.memberPhoto,
                                    item: member,
                                  ),
                                  // transition: Transition.rightToLeft,
                                );
                              },
                              // tileColor: AppColor.lightGreyShade,
                              leading: Hero(
                                tag: member,
                                child: CircleAvatar(
                                  radius: 26,
                                  backgroundImage:
                                      CachedNetworkImageProvider(member.memberPhoto),
                                ),
                              ),
                              title: Text(member.memberName.toCapitalized()),
                              subtitle: Text(member.homeParish),
                              trailing:
                                  const FaIcon(FontAwesomeIcons.chevronRight),
                            ),
                          ),
                        );
                      },
                    ),
                )
                : Image.asset(
                    "assets/404error.jpg",
                    height: 550,
                  ),
          ],
        ),
      ),
    );
  }
}
