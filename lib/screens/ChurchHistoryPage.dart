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
                        height: height / 5,
                        width: width / 2.28,
                        decoration: BoxDecoration(
                            color: AppColor.purpleShadeWithOpec,
                            borderRadius: BorderRadius.circular(50)),
                      ),
                      Container(
                        height: height / 5,
                        width: width / 2.28,
                        decoration: BoxDecoration(
                            color: AppColor.purpleShadeWithOpec,
                            borderRadius: BorderRadius.circular(50)),
                      ),
                    ],
                  ),
                  SizedBox(height: height * 0.01,),
                  Container(
                    height: height * 0.5,
                    width: width * 0.95,
                    decoration: BoxDecoration(
                        color: AppColor.purpleShadeWithOpec,
                        borderRadius: BorderRadius.circular(50)),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
