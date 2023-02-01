import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
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
          padding: const EdgeInsets.symmetric(
            horizontal: 10,
            vertical: 10.0,
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: AppColor.solidWhite,
            boxShadow: const [
              BoxShadow(
                color: AppColor.lightGreyShadev2,
                spreadRadius: 4,
                blurRadius: 10,
              ),
              BoxShadow(
                color: AppColor.lightGreyShadev2,
                spreadRadius: -4,
                blurRadius: 5,
              ),
            ],
          ),
          child: Text(
            "Flash News",
            style: GoogleFonts.inter(
              fontSize: 18.0,
              color: AppColor.grey600,
              fontWeight: FontWeight.bold,
              // letterSpacing: 0.5
            ),
            textAlign: TextAlign.center,
            maxLines: 3,
          ),
        ),
      ),
    );
  }
}
