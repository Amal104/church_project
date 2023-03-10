import 'package:church/Extensions/StringExtension.dart';
import 'package:church/Services/FlashNewsService.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:marquee/marquee.dart';
import '../Constants.dart';
import '../Model/FlashNewsModel.dart';
import '../values/values.dart';

class FlashNews extends StatefulWidget {
  const FlashNews({
    Key? key,
    required this.width,
    required this.height,
  }) : super(key: key);

  final double width;
  final double height;

  @override
  State<FlashNews> createState() => _FlashNewsState();
}

class _FlashNewsState extends State<FlashNews> {
  late Future<List<FlashNewsModel>?> users;
  @override
  void initState() {
    super.initState();
    users = FlashNewsService().fetchUsers();
  }

  
  @override
  Widget build(BuildContext context) {
    // final getFlashNews = Provider.of<FlashNewsProvider>(context);
    var size = MediaQuery.of(context).size;
    return SliverToBoxAdapter(
        child: Padding(
      padding: EdgeInsets.symmetric(
        horizontal: widget.width * 0.025,
      ),
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: widget.width * 0.020,
        ),
        height: size.height * 0.07,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: AppColor.lightGreyShade,
        ),
        child: FutureBuilder<List<FlashNewsModel>?>(
          future: users,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Marquee(
                text: "${snapshot.data![0].txt.toCapitalized()}  |   ${snapshot.data![1].txt.toCapitalized()} | ",
                style: GoogleFonts.inter(
                  fontWeight: FontWeight.w500,
                ),
              );
            } else if (snapshot.hasError) {
              return const Center(child: CircularProgressIndicator());
            }
            return const Center(child: CircularProgressIndicator());
          },
        ),
      ),
    ));
  }
}
