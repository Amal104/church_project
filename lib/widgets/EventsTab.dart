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
    var size = MediaQuery.of(context).size;
    return SliverToBoxAdapter(
      child: GestureDetector(
        onTap: () => Get.to(
          () => const EventsPage(),
          transition: Transition.rightToLeft,
        ),
        child: Stack(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: width * 0.025,
                vertical: height * 0.018,
              ),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: AppColor.lightGreyShade,
                ),
                height: height / 7,
                width: width / 1,
                child: Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                        left: size.width * 0.08,
                        right: size.width * 0.015,
                      ),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Image.asset(
                          "assets/events.png",
                          height: 70,
                        ),
                      ),
                    ),
                    Text(
                      "Upcoming\nEvents",
                      style: GoogleFonts.inter(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                        color: AppColor.grey600,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              bottom: 0,
              right: 0,
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: width * 0.025,
                  vertical: height * 0.018,
                ),
                child: Container(
                  height: height / 7,
                  width: width / 11,
                  decoration: const BoxDecoration(
                    color: AppColor.grey,
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(20),
                      bottomRight: Radius.circular(20),
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
          ],
        ),
      ),
    );
  }
}
