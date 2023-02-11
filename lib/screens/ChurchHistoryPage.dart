import 'package:church/values/Strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import '../provider/AboutChurchProvider.dart';
import '../values/values.dart';

class ChurchHistory extends StatefulWidget {
  const ChurchHistory({super.key});

  @override
  State<ChurchHistory> createState() => _ChurchHistoryState();
}

class _ChurchHistoryState extends State<ChurchHistory> {
  @override
  void initState() {
    super.initState();
    final aboutChurch =
        Provider.of<AboutChurchProvider>(context, listen: false);
    aboutChurch.getAboutChurch();
    final history = Provider.of<AboutChurchProvider>(context, listen: false);
    history.getChurchHistory();
  }

  @override
  Widget build(BuildContext context) {
    final postModel = Provider.of<AboutChurchProvider>(context);
    final history = Provider.of<AboutChurchProvider>(context);
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
                  "About Church",
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
              postModel.aboutChurch != null
                  ? Padding(
                      padding: EdgeInsets.symmetric(horizontal: width / 30),
                      child: Column(
                        children: [
                          // Row(
                          //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          //   children: [
                          Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: width / 20, vertical: height / 30),
                            // height: height / 5,
                            // width: width / 1,
                            decoration: BoxDecoration(
                                color: AppColor.lightGreyShade,
                                borderRadius: BorderRadius.circular(50)),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                postModel.loading
                                    ? const Center(
                                        child: CircularProgressIndicator(
                                          color: AppColor.darkpurpleShadev2,
                                        ),
                                      )
                                    : Text(
                                        postModel.aboutChurch?.parishName ?? "",
                                        style: GoogleFonts.inter(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w600,
                                          color: AppColor.darkpurpleShadev2,
                                        ),
                                      ),
                                SizedBox(
                                  height: height * 0.03,
                                ),
                                postModel.loading
                                    ? const Center(
                                        child: CircularProgressIndicator(
                                          color: AppColor.darkpurpleShadev2,
                                        ),
                                      )
                                    : Text(
                                        postModel.aboutChurch?.address ?? "",
                                        style: GoogleFonts.inter(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w600,
                                          color: AppColor.darkpurpleShadev2,
                                        ),
                                      ),
                              ],
                            ),
                          ),
                          // Container(
                          //   padding: EdgeInsets.symmetric(horizontal: width / 20),
                          //   height: height / 4,
                          //   width: width / 2.28,
                          //   decoration: BoxDecoration(
                          //       color: AppColor.lightGreyShade,
                          //       borderRadius: BorderRadius.circular(50)),
                          //   child: Column(
                          //     mainAxisAlignment: MainAxisAlignment.center,
                          //     crossAxisAlignment: CrossAxisAlignment.start,
                          //     children: [
                          //       Text(
                          //         "Address",
                          //         style: GoogleFonts.inter(
                          //           fontSize: 19,
                          //           fontWeight: FontWeight.w600,
                          //           color: AppColor.darkPinkShade,
                          //         ),
                          //       ),
                          //       SizedBox(
                          //         height: height * 0.03,
                          //       ),
                          //       Text(
                          //         postModel.aboutChurch?.address ?? "",
                          //         style: GoogleFonts.inter(
                          //           fontSize: 18,
                          //           fontWeight: FontWeight.w600,
                          //           color: AppColor.darkPinkShade,
                          //         ),
                          //       ),
                          //     ],
                          //   ),
                          // ),
                          //   ],
                          // ),
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
                            child: Html(
                              data: postModel.churchHistory?.description ?? "",
                            ),
                          ),
                        ],
                      ),
                    )
                  : SizedBox(
                    height: height,
                    child: Padding(
                      padding:  EdgeInsets.only(bottom: height * 0.3),
                      child: const Center(
                          child: CircularProgressIndicator(),
                        ),
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
