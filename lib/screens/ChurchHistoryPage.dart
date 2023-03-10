import 'dart:math';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:church/provider/Location_Provider.dart';
import 'package:church/values/AppBar.dart';
import 'package:church/values/AppTitle.dart';
import 'package:church/values/Strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import '../components/TabBarIndicator.dart';
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
      backgroundColor: AppColor.solidWhite,
      appBar: CustomAppBar.customAppBarIcon(),
      body: DefaultTabController(
        length: 3,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: width / 20,
                ),
                child: const AppTitle(
                  title: "About\nChurch",
                )),
            const SizedBox(
              height: 20.0,
            ),
            postModel.aboutChurch != null
                ? Padding(
                    padding: EdgeInsets.symmetric(horizontal: width / 30),
                    child: Column(
                      children: [
                        SizedBox(
                          height: height * 0.07,
                          width: width,
                          child: TabBar(
                              padding: EdgeInsets.symmetric(
                                  vertical: height * 0.007),
                              unselectedLabelColor: AppColor.grey400,
                              indicator:
                                  const DotIndicator(color: AppColor.grey800),
                              tabs: const [
                                Tab(
                                  text: "About",
                                ),
                                Tab(
                                  text: "History",
                                ),
                                Tab(
                                  text: "Gallery",
                                ),
                              ]),
                        ),
                        SizedBox(
                          height: height * 0.01,
                        ),
                        SizedBox(
                          height: height * 0.69,
                          width: width,
                          child: TabBarView(
                            children: <Widget>[
                              SingleChildScrollView(
                                child: Consumer<LocationProvider>(
                                  builder: (context, provider, child) =>
                                      InkWell(
                                    onTap: () {
                                      provider.openMap(
                                        postModel.aboutChurch?.latitude ?? "",
                                        postModel.aboutChurch?.longitude ?? "",
                                      );
                                    },
                                    child: Column(
                                      children: [
                                        Container(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: width / 20,
                                              vertical: height / 30),
                                          decoration: BoxDecoration(
                                              color: AppColor.lightGreyShade,
                                              borderRadius:
                                                  BorderRadius.circular(15)),
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              postModel.loading
                                                  ? const Center(
                                                      child:
                                                          CircularProgressIndicator(
                                                        color: AppColor
                                                            .darkpurpleShadev2,
                                                      ),
                                                    )
                                                  : Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        Text(
                                                          postModel.aboutChurch
                                                                  ?.parishName ??
                                                              "",
                                                          style:
                                                              GoogleFonts.inter(
                                                            fontSize: 16,
                                                            fontWeight:
                                                                FontWeight.w400,
                                                            color:
                                                                AppColor.grey,
                                                          ),
                                                        ),
                                                        Image.asset(
                                                          "assets/maplogo.png",
                                                          height: height * 0.04,
                                                        )
                                                      ],
                                                    ),
                                              SizedBox(
                                                height: height * 0.01,
                                              ),
                                              postModel.loading
                                                  ? const Center(
                                                      child:
                                                          CircularProgressIndicator(
                                                        color: AppColor
                                                            .darkpurpleShadev2,
                                                      ),
                                                    )
                                                  : Text(
                                                      postModel.aboutChurch
                                                              ?.address ??
                                                          "",
                                                      style: GoogleFonts.inter(
                                                        fontSize: 16,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        color: AppColor.grey,
                                                      ),
                                                    ),
                                            ],
                                          ),
                                        ),
                                        SizedBox(
                                          height: height * 0.015,
                                        ),
                                        Container(
                                          decoration: BoxDecoration(
                                            color: AppColor.purpleShadeWithOpec,
                                            borderRadius:
                                                BorderRadius.circular(15),
                                          ),
                                          padding: EdgeInsets.symmetric(
                                            horizontal: width / 20,
                                            vertical: height / 30,
                                          ),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceAround,
                                            children: [
                                              Text(
                                                "Vicar",
                                                style: GoogleFonts.inter(
                                                  fontSize: 15,
                                                  color:
                                                      AppColor.darkpurpleShade,
                                                ),
                                              ),
                                              Text(
                                                "-",
                                                style: GoogleFonts.inter(
                                                  fontSize: 15,
                                                  color:
                                                      AppColor.darkpurpleShade,
                                                ),
                                              ),
                                              SizedBox(
                                                width: width * 0.30,
                                                child: Text(
                                                  postModel.aboutChurch
                                                          ?.vicarName ??
                                                      "",
                                                  style: GoogleFonts.inter(
                                                    fontSize: 16,
                                                    fontWeight: FontWeight.w600,
                                                    color: AppColor
                                                        .darkpurpleShade,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        SizedBox(
                                          height: height * 0.015,
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Container(
                                              decoration: BoxDecoration(
                                                color: AppColor
                                                    .lightPinkShade,
                                                borderRadius:
                                                    BorderRadius.circular(15),
                                              ),
                                              padding: EdgeInsets.symmetric(
                                                horizontal: width / 23,
                                                vertical: height / 30,
                                              ),
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    "Assi Vicar -",
                                                    style: GoogleFonts.inter(
                                                      fontSize: 15,
                                                      color: AppColor
                                                          .darkPinkShade,
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    height: height * 0.005,
                                                  ),
                                                  SizedBox(
                                                    width: width * 0.35,
                                                    child: Text(
                                                      postModel.aboutChurch
                                                              ?.asstVicarName ??
                                                          "",
                                                      style: GoogleFonts.inter(
                                                        fontSize: 16,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        color: AppColor
                                                            .darkPinkShade,
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Container(
                                              decoration: BoxDecoration(
                                                color: AppColor
                                                    .lightPinkShade,
                                                borderRadius:
                                                    BorderRadius.circular(15),
                                              ),
                                              padding: EdgeInsets.symmetric(
                                                horizontal: width / 23,
                                                vertical: height / 30,
                                              ),
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    "Sexton -",
                                                    style: GoogleFonts.inter(
                                                      fontSize: 15,
                                                      color: AppColor
                                                          .darkPinkShade,
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    height: height * 0.005,
                                                  ),
                                                  SizedBox(
                                                    width: width * 0.38,
                                                    child: Text(
                                                      postModel.aboutChurch
                                                              ?.sextonName ??
                                                          "",
                                                      style: GoogleFonts.inter(
                                                        fontSize: 16,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        color: AppColor
                                                            .darkPinkShade,
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              SingleChildScrollView(
                                child: Container(
                                  padding: EdgeInsets.symmetric(
                                    horizontal: width / 30,
                                    vertical: height / 35,
                                  ),
                                  width: width * 0.95,
                                  decoration: BoxDecoration(
                                      color: AppColor.lightGreyShade,
                                      borderRadius: BorderRadius.circular(20)),
                                  child: Html(
                                    data:
                                        postModel.churchHistory?.description ??
                                            "",
                                  ),
                                ),
                              ),
                              SingleChildScrollView(
                                child: postModel.aboutChurch != null
                                    ? Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          SizedBox(
                                            height: height * 0.01,
                                          ),
                                          Card(
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(15),
                                            ),
                                            elevation: 3,
                                            child: ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(15),
                                              child: CachedNetworkImage(
                                                imageUrl: postModel.aboutChurch
                                                        ?.parishPhoto ??
                                                    "",
                                                errorWidget:
                                                    (context, url, error) =>
                                                        Image.asset(
                                                  "assets/404notfound.jpg",
                                                  height: height * 0.2,
                                                ),
                                                placeholder: (context, url) =>
                                                    const CircularProgressIndicator(),
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            height: height * 0.01,
                                          ),
                                          Align(
                                            alignment: Alignment.centerRight,
                                            child: Text(
                                              "- Parish",
                                              style: GoogleFonts.inter(
                                                fontSize: 18.0,
                                                fontWeight: FontWeight.bold,
                                                color:
                                                    AppColor.darkpurpleShadev2,
                                              ),
                                            ),
                                          ),
                                          Divider(
                                            height: height * 0.02,
                                            color: AppColor.solidBlack,
                                            thickness: 0.5,
                                          ),
                                          SizedBox(
                                            height: height * 0.01,
                                          ),
                                          Card(
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(15),
                                            ),
                                            elevation: 3,
                                            child: ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(15),
                                              child: CachedNetworkImage(
                                                imageUrl: postModel.aboutChurch
                                                        ?.metropolitianImage ??
                                                    "",
                                                errorWidget:
                                                    (context, url, error) =>
                                                        Image.asset(
                                                  "assets/404notfound.jpg",
                                                  height: height * 0.2,
                                                ),
                                                placeholder: (context, url) =>
                                                    const CircularProgressIndicator(),
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            height: height * 0.01,
                                          ),
                                          Align(
                                            alignment: Alignment.centerRight,
                                            child: Text(
                                              "- Metropolitan",
                                              style: GoogleFonts.inter(
                                                fontSize: 18.0,
                                                fontWeight: FontWeight.bold,
                                                color:
                                                    AppColor.darkpurpleShadev2,
                                              ),
                                            ),
                                          ),
                                          Divider(
                                            height: height * 0.02,
                                            color: AppColor.solidBlack,
                                            thickness: 0.5,
                                          ),
                                          SizedBox(
                                            height: height * 0.01,
                                          ),
                                          Card(
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(15),
                                            ),
                                            elevation: 3,
                                            child: ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(15),
                                              child: CachedNetworkImage(
                                                imageUrl: postModel.aboutChurch
                                                        ?.diocesanBishopImage ??
                                                    "",
                                                errorWidget:
                                                    (context, url, error) =>
                                                        Image.asset(
                                                  "assets/404notfound.jpg",
                                                  height: height * 0.2,
                                                ),
                                                placeholder: (context, url) =>
                                                    const CircularProgressIndicator(),
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            height: height * 0.01,
                                          ),
                                          Align(
                                            alignment: Alignment.centerRight,
                                            child: Text(
                                              "- DiocesanBishop",
                                              style: GoogleFonts.inter(
                                                fontSize: 18.0,
                                                fontWeight: FontWeight.bold,
                                                color:
                                                    AppColor.darkpurpleShadev2,
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            height: height * 0.02,
                                          ),
                                        ],
                                      )
                                    : Image.asset(
                                        "assets/404notfound.jpg",
                                        height: height * 0.2,
                                      ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  )
                : SizedBox(
                    height: height,
                    child: Padding(
                      padding: EdgeInsets.only(bottom: height * 0.3),
                      child: const Center(
                        child: CircularProgressIndicator(),
                      ),
                    ),
                  ),
          ],
        ),
      ),
    );
  }
}
