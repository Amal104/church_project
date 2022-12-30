
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../screens/EnquiryPage.dart';
import '../values/values.dart';

class EnquiryTab extends StatelessWidget {
  const EnquiryTab({
    Key? key,
    required this.height,
    required this.width,
  }) : super(key: key);

  final double height;
  final double width;

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: EdgeInsets.only(top: height * 0.03),
        child: Container(
          height: height * 0.25,
          color: AppColor.lightGreyShade,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () => Get.to(
                  () => const EnquiryPage(),
                  transition: Transition.rightToLeft,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "For Assistance & Enquiries\nFind us here!",
                      style: GoogleFonts.inter(
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold,
                          color: AppColor.darkpurpleShadev2),
                    ),
                    SizedBox(
                      width: width * 0.05,
                    ),
                    Container(
                      height: height * 0.05,
                      width: width * 0.10,
                      decoration: BoxDecoration(
                          color: AppColor.darkpurpleShadev2,
                          borderRadius: BorderRadius.circular(12)),
                      child: const Icon(
                        Icons.chevron_right,
                        size: 40,
                        color: AppColor.lightGreyShade,
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
