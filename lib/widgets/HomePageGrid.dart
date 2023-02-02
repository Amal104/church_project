import 'package:church/screens/CommitteMembersPage.dart';
import 'package:church/screens/LectionaryPage.dart';
import 'package:church/screens/ObicturyPage.dart';
import 'package:church/screens/VicarsMessage.dart';
import 'package:church/screens/ChurchHistoryPage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../screens/AnnoucementPage.dart';
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
    return SliverGrid.count(
      mainAxisSpacing: 5,
      crossAxisCount: 3,
      children: <Widget>[
        Padding(
          padding: EdgeInsets.fromLTRB(
            width * 0.025,
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
                      borderRadius: BorderRadius.circular(30),
                      color: AppColor.lightPinkShade,
                    ),
                    height: height / 1.5,
                    width: width / 1.5,
                  ),
                ),
                Padding(
                  padding:
                      EdgeInsets.only(right: width * 0.04, top: height * 0.01),
                  child: Align(
                    alignment: Alignment.topCenter,
                    child: Image.asset(
                      "assets/church-ilustration.png",
                      height: 60,
                    ),
                  ),
                ),
                // Positioned(
                //   bottom: 15,
                //   right: 15,
                //   child: GestureDetector(
                //     onTap: () => Get.to(
                //       () => const ChurchHistory(),
                //       transition: Transition.rightToLeft,
                //     ),
                //     child: Container(
                //       height: height * 0.05,
                //       width: width * 0.10,
                //       decoration: BoxDecoration(
                //           color: AppColor.grey,
                //           borderRadius: BorderRadius.circular(12)),
                //       child: const Icon(
                //         Icons.chevron_right,
                //         size: 40,
                //         color: AppColor.lightGreyShade,
                //       ),
                //     ),
                //   ),
                // ),
                Positioned(
                  bottom: 15.0,
                  left: 15.0,
                  child: Text(
                    "About\nChurch",
                    style: GoogleFonts.inter(
                      fontSize: 16.0,
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
              width * 0.018, height / 100, width * 0.025, 0),
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
                    borderRadius: BorderRadius.circular(30),
                    color: AppColor.lightGreyShade,
                  ),
                ),
                // Positioned(
                //   bottom: 15,
                //   right: 15,
                //   child: GestureDetector(
                //     onTap: () => Get.to(
                //       () => const VicarsMessage(),
                //       transition: Transition.rightToLeft,
                //     ),
                //     child: Container(
                //       height: height * 0.05,
                //       width: width * 0.10,
                //       decoration: BoxDecoration(
                //           color: AppColor.grey,
                //           borderRadius: BorderRadius.circular(12)),
                //       child: const Icon(
                //         Icons.chevron_right,
                //         size: 40,
                //         color: AppColor.lightGreyShade,
                //       ),
                //     ),
                //   ),
                // ),
                Padding(
                  padding: EdgeInsets.only(top: height * 0.010),
                  child: Align(
                    alignment: Alignment.topCenter,
                    child: Image.asset(
                      "assets/chat.png",
                      height: 60,
                    ),
                  ),
                ),
                Positioned(
                  bottom: 15.0,
                  left: 15.0,
                  child: Text(
                    "Vicar's\nMessage",
                    style: GoogleFonts.inter(
                      fontSize: 16.0,
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
              width * 0.018, height * 0.010, width * 0.025, 0),
          child: GestureDetector(
             onTap: () => Get.to(
              () => const LectionaryPage(),
              transition: Transition.rightToLeft,
            ),
            child: Stack(
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: AppColor.purpleShadeWithOpec,
                  ),
                  height: height / 1.5,
                  width: width / 1.5,
                ),
                Positioned(
                  bottom: 15.0,
                  left: 15.0,
                  child: Text(
                    "Readings\nLectionary",
                    style: GoogleFonts.inter(
                      fontSize: 16.0,
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
                      height: 60,
                    ),
                  ),
                ),
                // Positioned(
                //   bottom: 15,
                //   right: 15,
                //   child: GestureDetector(
                //     onTap: () => Get.to(
                //       () => const LectionaryPage(),
                //       transition: Transition.rightToLeft,
                //     ),
                //     child: Container(
                //       height: height * 0.05,
                //       width: width * 0.10,
                //       decoration: BoxDecoration(
                //           color: AppColor.grey,
                //           borderRadius: BorderRadius.circular(12)),
                //       child: const Icon(
                //         Icons.chevron_right,
                //         size: 40,
                //         color: AppColor.lightGreyShade,
                //       ),
                //     ),
                //   ),
                // ),
              ],
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.fromLTRB(
            width * 0.025,
            height * 0.010,
            width * 0.018,
            0,
          ),
          child: GestureDetector(
             onTap: () => Get.to(
              () => const CommitteeMemberPage(),
              transition: Transition.rightToLeft,
            ),
            child: Stack(
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: AppColor.mintGreenShadewithOpec,
                  ),
                  height: height / 1.5,
                  width: width / 1.5,
                ),
                Positioned(
                  bottom: 15.0,
                  left: 15.0,
                  child: Text(
                    "Committee\nMembers",
                    style: GoogleFonts.inter(
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                      color: AppColor.darkmintGreenShade,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: height * 0),
                  child: Align(
                    alignment: Alignment.topCenter,
                    child: Image.asset(
                      "assets/committee.png",
                      height: 60,
                    ),
                  ),
                ),
                // Positioned(
                //   bottom: 15,
                //   right: 15,
                //   child: GestureDetector(
                //     onTap: () => Get.to(
                //       () => const CommitteeMemberPage(),
                //       transition: Transition.rightToLeft,
                //     ),
                //     child: Container(
                //      height: height * 0.05,
                //       width: width * 0.10,
                //       decoration: BoxDecoration(
                //           color: AppColor.grey,
                //           borderRadius: BorderRadius.circular(12)),
                //       child: const Icon(
                //         Icons.chevron_right,
                //         size: 40,
                //         color: AppColor.lightGreyShade,
                //       ),
                //     ),
                //   ),
                // ),
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
                    borderRadius: BorderRadius.circular(30),
                    color: AppColor.lightGreyShade,
                  ),
                  height: height / 1.5,
                  width: width / 1.5,
                ),
                Positioned(
                  bottom: 26.0,
                  left: 15.0,
                  child: Text(
                    "Obictury",
                    style: GoogleFonts.inter(
                      fontSize: 16.0,
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
                      height: 60,
                    ),
                  ),
                ),
                // Positioned(
                //   bottom: 15,
                //   right: 15,
                //   child: GestureDetector(
                //     onTap: () => Get.to(
                //       () => const ObicturyPage(),
                //       transition: Transition.rightToLeft,
                //     ),
                //     child: Container(
                //       height: height * 0.05,
                //       width: width * 0.10,
                //       decoration: BoxDecoration(
                //           color: AppColor.grey,
                //           borderRadius: BorderRadius.circular(12)),
                //       child: const Icon(
                //         Icons.chevron_right,
                //         size: 40,
                //         color: AppColor.lightGreyShade,
                //       ),
                //     ),
                //   ),
                // ),
              ],
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.fromLTRB(
            width * 0.018,
            height * 0.010,
            width * 0.025,
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
                    borderRadius: BorderRadius.circular(30),
                    color: AppColor.lightPinkShade,
                  ),
                  height: height / 1.5,
                  width: width / 1.5,
                ),
                Positioned(
                  left: 25,
                  child: Image.asset(
                    "assets/megaphone.png",
                    height: 65,
                  ),
                ),
                // Positioned(
                //   bottom: 15,
                //   right: 15,
                //   child: GestureDetector(
                //     onTap: () => Get.to(
                //       () => const AnnouncementPage(),
                //       transition: Transition.rightToLeft,
                //     ),
                //     child: Container(
                //       height: height * 0.05,
                //       width: width * 0.10,
                //       decoration: BoxDecoration(
                //           color: AppColor.grey,
                //           borderRadius: BorderRadius.circular(12)),
                //       child: const Icon(
                //         Icons.chevron_right,
                //         size: 40,
                //         color: AppColor.lightGreyShade,
                //       ),
                //     ),
                //   ),
                // ),
                Positioned(
                  bottom: 15.0,
                  left: 15.0,
                  child: Text(
                    "Announce\nments",
                    style: GoogleFonts.inter(
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                      color: AppColor.darkPinkShade,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        // Padding(
        //   padding: EdgeInsets.fromLTRB(
        //       width * 0.025, height / 100, width * 0.018, 0),
        //   child: Stack(
        //     children: [
        //       Container(
        //         decoration: BoxDecoration(
        //           borderRadius: BorderRadius.circular(30),
        //           color: AppColor.mintGreenShadewithOpec,
        //         ),
        //         height: height / 1.5,
        //         width: width / 1.5,
        //       ),
        //       Positioned(
        //         bottom: 25.0,
        //         left: 15.0,
        //         child: Text(
        //           "Obictury",
        //           style: GoogleFonts.blinker(
        //             fontSize: 20.0,
        //             fontWeight: FontWeight.bold,
        //             color: AppColor.darkmintGreenShade,
        //           ),
        //         ),
        //       ),
        //       // Align(
        //       //   alignment: Alignment.topCenter,
        //       //   child: Image.asset("assets/committee.png",height: 118,),
        //       // ),
        //       Positioned(
        //         bottom: 15,
        //         right: 15,
        //         child: Container(
        //           height: 40,
        //           width: 40,
        //           decoration: BoxDecoration(
        //               color: AppColor.grey,
        //               borderRadius: BorderRadius.circular(12)),
        //           child: const Icon(
        //             Icons.chevron_right,
        //             size: 40,
        //             color: AppColor.lightGreyShade,
        //           ),
        //         ),
        //       ),
        //     ],
        //   ),
        // ),
      ],
    );
  }
}
