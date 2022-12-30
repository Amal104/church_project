import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:marquee/marquee.dart';
import '../values/Strings.dart';
import '../values/values.dart';

class HomePageQuote extends StatelessWidget {
  const HomePageQuote({
    Key? key,
    required this.width,
    required this.height,
  }) : super(key: key);

  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: EdgeInsets.only(
          left: width * 0.025,
          right: width * 0.025,
          top: height * 0.022,
          bottom: height * 0.01,
        ),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 10.0),
          decoration:  BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: AppColor.lightGreyShade,
          ),
          // height: height / 12,
          child:
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //   children: const [
              //     FaIcon(
              //       FontAwesomeIcons.quoteLeft,
              //       color: AppColor.grey600,
              //     ),
              Text(
            "\" ${AppStrings.bibleQuote} \"",
            style: GoogleFonts.inter(
              fontSize: 14.0,
              color: AppColor.grey,
              fontWeight: FontWeight.w500,
              // letterSpacing: 0.5
            ),
            textAlign: TextAlign.center,
            maxLines: 3,
          ),
          //   FaIcon(
          //     FontAwesomeIcons.quoteRight,
          //     color: AppColor.grey600,
          //   ),
          // ],
        ),
      ),
    );
  }
}
