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
    var size = MediaQuery.of(context).size;
    return SliverToBoxAdapter(
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: width * 0.025,
        ),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: AppColor.lightGreyShade,
          ),
          height: height / 12,
          width: width / 1,
        ),
      ),
    );
  }
}
