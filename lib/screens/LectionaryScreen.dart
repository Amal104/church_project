import 'package:church/Model/LectionaryModel.dart';
import 'package:church/components/TabBarIndicator.dart';
import 'package:church/provider/LectionaryProvider.dart';
import 'package:church/values/AppTitle.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../Constants.dart';
import '../Services/LectionaryServices.dart';
import '../values/values.dart';

class LectionaryScreen extends StatefulWidget {
  const LectionaryScreen(
      {super.key,
      required this.title,
      required this.date,
      required this.length});

  final String title;
  final List<LectionaryReading> date;
  final int length;
  // final String readingTitle;

  @override
  State<LectionaryScreen> createState() => LectionaryScreenState();
}

class LectionaryScreenState extends State<LectionaryScreen>
    with TickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
    // final lectionary = Provider.of<LectionaryProvider>(context, listen: false);
    // lectionary.getLectionaryData();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: AppColor.solidWhite,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppColor.solidWhite,
        leadingWidth: size.width * 0.12,
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: const FaIcon(
            FontAwesomeIcons.chevronLeft,
            color: AppColor.grey400,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: MediaQuery.of(context).size.width / 25,
                  ),
                  child: const AppTitle(title: "Lectionary")),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: size.width * 0.03,
                  vertical: size.height * 0.03,
                ),
                child: FutureBuilder<Lectionary?>(
                    future: LectionaryService().getLectionary(),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        TabController tabcontroller = TabController(
                            length: widget.date.length, vsync: this);
                        return Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: size.width * 0.03),
                          child: Column(
                            children: [
                              SizedBox(
                                height: size.height * 0.02,
                              ),
                              Text(
                                widget.title,
                                style: GoogleFonts.inter(
                                  fontSize: 17.0,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              SizedBox(
                                height: size.height * 0.02,
                              ),
                              SizedBox(
                                width: size.width,
                                height: size.height * 0.07,
                                child: TabBar(
                                  unselectedLabelColor: AppColor.grey400,
                                  indicator: const DotIndicator(
                                      color: AppColor.grey800),
                                  isScrollable: true,
                                  controller: tabcontroller,
                                  tabs: List<Widget>.generate(
                                    widget.date.length,
                                    (index) {
                                      String input = widget.date[index].date;
                                      return Tab(
                                        child: Text(input),
                                      );
                                    },
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: size.width,
                                height: size.height * 0.5,
                                child: TabBarView(
                                  controller: tabcontroller,
                                  children: List.generate(
                                    widget.date.length,
                                    (index) {
                                      return Padding(
                                        padding: EdgeInsets.symmetric(
                                            vertical: size.height * 0.03),
                                        child: Column(
                                          children: [
                                            Card(
                                              color: AppColor.lightGreyShade,
                                              elevation: 3,
                                              shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          20)),
                                              child: Padding(
                                                padding: EdgeInsets.symmetric(
                                                    vertical:
                                                        size.height * 0.02,
                                                    horizontal:
                                                        size.width * 0.04),
                                                child: Text(
                                                  widget.date[index].title,
                                                  textAlign: TextAlign.center,
                                                  style: GoogleFonts.inter(
                                                    fontSize: 15.0,
                                                    fontWeight: FontWeight.w600,
                                                  ),
                                                ),
                                              ),
                                            ),
                                            SizedBox(
                                              height: size.height * 0.05,
                                            ),
                                            Text("Lesson",style: GoogleFonts.inter(
                                              fontSize: 15,
                                              fontWeight: FontWeight.w500,
                                            ),),
                                            SizedBox(
                                              height: size.height * 0.01,
                                            ),
                                            ListView.builder(
                                              shrinkWrap: true,
                                              itemCount: widget
                                                  .date[index].lesson.length,
                                              itemBuilder:
                                                  (context, int innerIndex) {
                                                return Align(
                                                  alignment: Alignment.center,
                                                  child: Text(widget.date[index]
                                                      .lesson[innerIndex],style: GoogleFonts.inter(
                                                        color: AppColor.darkpurpleShadev2
                                                      ),),
                                                );
                                              },
                                            ),
                                            SizedBox(
                                              height: size.height * 0.01,
                                            ),
                                            const Text("Epistle Gospel"),
                                            SizedBox(
                                              height: size.height * 0.01,
                                            ),
                                            ListView.builder(
                                              shrinkWrap: true,
                                              itemCount: widget.date[index]
                                                  .epistleGospel.length,
                                              itemBuilder:
                                                  (context, int innerIndex) {
                                                return Align(
                                                  alignment: Alignment.center,
                                                  child: Text(widget.date[index]
                                                          .epistleGospel[
                                                      innerIndex]),
                                                );
                                              },
                                            ),
                                            SizedBox(
                                              height: size.height * 0.01,
                                            ),
                                            const Text("Evening Reading"),
                                            SizedBox(
                                              height: size.height * 0.01,
                                            ),
                                            ListView.builder(
                                              shrinkWrap: true,
                                              itemCount: widget.date[index]
                                                  .eveningReading.length,
                                              itemBuilder:
                                                  (context, int innerIndex) {
                                                return Align(
                                                  alignment: Alignment.center,
                                                  child: Text(widget.date[index]
                                                          .eveningReading[
                                                      innerIndex]),
                                                );
                                              },
                                            ),
                                          ],
                                        ),
                                      );
                                    },
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
                      } else if (snapshot.hasError) {
                        return Text("${snapshot.error}");
                      }
                      return const Center(child: CircularProgressIndicator());
                    }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
