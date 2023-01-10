import 'package:church/values/Strings.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../values/values.dart';

class ChurchHistory extends StatelessWidget {
  const ChurchHistory({super.key});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
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
                  horizontal: width / 25,
                ),
                child: Text(
                  "History of\nChurch",
                  style: GoogleFonts.inter(
                    fontSize: 25.0,
                    fontWeight: FontWeight.bold,
                    color: AppColor.grey600,
                    letterSpacing: 1.0,
                  ),
                ),
              ),
              const SizedBox(
                height: 20.0,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: width / 30),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: width / 12),
                          height: height / 4,
                          width: width / 2.28,
                          decoration: BoxDecoration(
                              color: AppColor.lightGreyShade,
                              borderRadius: BorderRadius.circular(50)),
                          child: Center(
                            child: Text(
                              "Founded\n\nc. AD 593;\n1430 years ago",
                              style: GoogleFonts.inter(
                                fontSize: 19,
                                fontWeight: FontWeight.w600,
                                color: AppColor.darkpurpleShadev2,
                              ),
                            ),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: width / 26),
                          height: height / 4,
                          width: width / 2.28,
                          decoration: BoxDecoration(
                              color: AppColor.lightGreyShade,
                              borderRadius: BorderRadius.circular(50)),
                          child: Center(
                              child: Text(
                            "Denomination\n\nSyro-Malabar Catholic Church",
                            style: GoogleFonts.inter(
                              fontSize: 19,
                              fontWeight: FontWeight.w600,
                              color: AppColor.darkPinkShade,
                            ),
                          )),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: height * 0.01,
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: width / 30,
                        vertical: height / 20,
                      ),
                      width: width * 0.95,
                      decoration: BoxDecoration(
                          color: AppColor.lightGreyShade,
                          borderRadius: BorderRadius.circular(50)),
                      child: Text(
                        AppStrings.achansMessage,
                        textAlign: TextAlign.center,
                        style: GoogleFonts.inter(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          color: AppColor.grey800,
                          height: 1.5,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 100.0,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
