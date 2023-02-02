import 'package:church/screens/FlashNewsPage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../values/Strings.dart';
import '../values/values.dart';

class FlashNews extends StatelessWidget {
  const FlashNews({
    Key? key,
    required this.width,
    required this.height,
  }) : super(key: key);

  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: GestureDetector(
        onTap: () => Get.to(
          () => const FlashNewsPage(),
          transition: Transition.rightToLeft,
        ),
        child: Stack(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: width * 0.025,
              ),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: AppColor.lightGreyShade,
                ),
                height: height / 10,
                width: width / 1,
              ),
            ),
            // Text(
            //   "Upcoming\nEvents",
            //   style: GoogleFonts.blinker(
            //     fontSize: 23.0,
            //     fontWeight: FontWeight.bold,
            //     color: AppColor.grey600,
            //   ),
            // ),
            // Align(
            //   alignment: Alignment.centerLeft,
            //   child: Image.asset(
            //     "assets/events.png",
            //     height: 100,
            //   ),
            // ),
            Positioned(
              bottom: 0,
              right: 0,
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: width * 0.025,
                  // vertical: height  * 0.018,
                ),
                child: Container(
                  height: height / 10,
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
          ],
        ),
      ),
    );
  }
}
