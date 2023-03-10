import 'package:church/screens/CommitteMembersPage.dart';
import 'package:church/screens/LectionaryScreen.dart';
import 'package:church/screens/Lectionary_title.dart';
import 'package:church/screens/ObicturyPage.dart';
import 'package:church/screens/VicarsMessage.dart';
import 'package:church/screens/ChurchHistoryPage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../screens/AnnoucementPage.dart';
import '../screens/MemberPage.dart';
import '../values/values.dart';

class HomePageGrid extends StatelessWidget {
  const HomePageGrid({
    Key? key,
    required this.width,
    required this.height,
  }) : super(key: key);

  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return SliverGrid.count(
      mainAxisSpacing: 5,
      crossAxisCount: 3,
      children: <Widget>[
        Padding(
          padding: EdgeInsets.fromLTRB(
            width * 0.018,
            height / 100,
            width * 0.018,
            0,
          ),
          child: GestureDetector(
            onTap: () => Get.to(
              () => const ChurchHistory(),
              transition: Transition.rightToLeft,
            ),
            child: Stack(
              children: [
                GestureDetector(
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: AppColor.lightPinkShade,
                    ),
                    height: height / 1.5,
                    width: width / 1.5,
                  ),
                ),
                Padding(
                  padding:
                      EdgeInsets.only(right: width * 0.02, top: height * 0.01),
                  child: Align(
                    alignment: Alignment.topCenter,
                    child: Image.asset(
                      "assets/church-ilustration.png",
                      height: size.height * 0.072,
                    ),
                  ),
                ),
                Positioned(
                  bottom: size.height * 0.018,
                  left: size.width * 0.04,
                  child: Text(
                    "About\nChurch",
                    style: GoogleFonts.inter(
                      fontWeight: FontWeight.bold,
                      color: AppColor.darkPinkShade,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.fromLTRB(
              width * 0.018, height / 100, width * 0.018, 0),
          child: GestureDetector(
             onTap: () => Get.to(
              () => const VicarsMessage(),
              transition: Transition.rightToLeft,
            ),
            child: Stack(
              children: [
                Container(
                  height: height / 1.5,
                  width: width / 1.5,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: AppColor.lightGreyShade,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: height * 0.010),
                  child: Align(
                    alignment: Alignment.topCenter,
                    child: Image.asset(
                      "assets/chat.png",
                      height: size.height * 0.072,
                    ),
                  ),
                ),
                Positioned(
                  bottom: size.height * 0.018,
                  left: size.width * 0.04,
                  child: Text(
                    "Vicar's\nMessage",
                    style: GoogleFonts.inter(
                      fontWeight: FontWeight.bold,
                      color: AppColor.grey600,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.fromLTRB(
            width * 0.018,
            height * 0.010,
            width * 0.018,
            0,
          ),
          child: GestureDetector(
             onTap: () => Get.to(
              () => const MemberPage(),
              transition: Transition.rightToLeft,
            ),
            child: Stack(
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: AppColor.purpleShadeWithOpec,
                  ),
                  height: height / 1.5,
                  width: width / 1.5,
                ),
                Positioned(
                  bottom: size.height * 0.018,
                  left: size.width * 0.04,
                  child: Text(
                    "Members\nDetails",
                    style: GoogleFonts.inter(
                      fontWeight: FontWeight.bold,
                      color: AppColor.darkpurpleShade,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: height * 0.01),
                  child: Align(
                    alignment: Alignment.topCenter,
                    child: Image.asset(
                      "assets/committeemember.png",
                      height: size.height * 0.072,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.fromLTRB(
              width * 0.018, height * 0.010, width * 0.018, 0),
          child: GestureDetector(
             onTap: () => Get.to(
              () => const LectionaryTItle(),
              transition: Transition.rightToLeft,
            ),
            child: Stack(
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: AppColor.purpleShadeWithOpec,
                  ),
                  height: height / 1.5,
                  width: width / 1.5,
                ),
                Positioned(
                  bottom: size.height * 0.018,
                  left: size.width * 0.04,
                  child: Text(
                    "Readings\nLectionary",
                    style: GoogleFonts.inter(
                      fontWeight: FontWeight.bold,
                      color: AppColor.darkpurpleShade,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: height * 0.010),
                  child: Align(
                    alignment: Alignment.topCenter,
                    child: Image.asset(
                      "assets/Lectionary.png",
                      height: size.height * 0.072,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.fromLTRB(
            width * 0.018,
            height * 0.010,
            width * 0.018,
            0,
          ),
          child: GestureDetector(
             onTap: () => Get.to(
              () => const ObicturyPage(),
              transition: Transition.rightToLeft,
            ),
            child: Stack(
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: AppColor.lightGreyShade,
                  ),
                  height: height / 1.5,
                  width: width / 1.5,
                ),
                Positioned(
                  bottom: size.height * 0.035,
                  left: size.width * 0.053,
                  child: Text(
                    "Obictury",
                    style: GoogleFonts.inter(
                      fontWeight: FontWeight.bold,
                      color: AppColor.grey600,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    top: height * 0.01,
                    right: width * 0.01,
                  ),
                  child: Align(
                    alignment: Alignment.topCenter,
                    child: Image.asset(
                      "assets/coffin.png",
                      height: size.height * 0.072,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.fromLTRB(
            width * 0.018,
            height * 0.010,
            width * 0.018,
            0,
          ),
          child: GestureDetector(
             onTap: () => Get.to(
              () => const AnnouncementPage(),
              transition: Transition.rightToLeft,
            ),
            child: Stack(
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: AppColor.lightPinkShade,
                  ),
                  height: height / 1.5,
                  width: width / 1.5,
                ),
                Positioned(
                  left: 25,
                  child: Image.asset(
                    "assets/megaphone.png",
                    height: size.height * 0.078,
                  ),
                ),
                Positioned(
                  bottom: size.height * 0.018,
                  left: size.width * 0.04,
                  child: Text(
                    "Announce\nments",
                    style: GoogleFonts.inter(
                      fontWeight: FontWeight.bold,
                      color: AppColor.darkPinkShade,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
