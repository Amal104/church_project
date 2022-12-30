import 'package:church/screens/EventsPage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../values/values.dart';

class EventsTab extends StatelessWidget {
  const EventsTab({
    Key? key,
    required this.width,
    required this.height,
  }) : super(key: key);

  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: SizedBox(
        child: Stack(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: width * 0.025,
                vertical: height  * 0.018,
              ),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: AppColor.lightGreyShade,
                ),
                height: height / 5,
                width: width / 1,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: width * 0.45, top: height * 0.07),
              child: Text(
                "Upcoming\nEvents",
                style: GoogleFonts.blinker(
                  fontSize: 23.0,
                  fontWeight: FontWeight.bold,
                  color: AppColor.grey600,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                top: height * 0.040,
                left: width * 0.1,
              ),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Image.asset(
                  "assets/events.png",
                  height: 100,
                ),
              ),
            ),
            Positioned(
              bottom: 0,
              right: 0,
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: width * 0.029,
                  vertical: height  * 0.018,
                ),
                child: GestureDetector(
                  onTap: () => Get.to(
                    () => const EventsPage(),
                    transition: Transition.rightToLeft,
                  ),
                  child: Container(
                    height: height / 5,
                    width: width / 11,
                    decoration: const BoxDecoration(
                      color: AppColor.grey,
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(30),
                        bottomRight: Radius.circular(30),
                      ),
                    ),
                    child: const Icon(
                      Icons.chevron_right,
                      size: 40,
                      color: AppColor.lightGreyShade,
                    ),
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
