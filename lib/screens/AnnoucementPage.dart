import 'dart:ui';
import 'package:church/widgets/AnnoucementDetails.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import '../provider/AnnoucementProvider.dart';
import '../values/AppTitle.dart';
import '../values/values.dart';

class AnnouncementPage extends StatefulWidget {
  const AnnouncementPage({super.key});

  @override
  State<AnnouncementPage> createState() => _AnnouncementPageState();
}

class _AnnouncementPageState extends State<AnnouncementPage> {
  @override
  void initState() {
    super.initState();
    final getAnnoucement =
        Provider.of<AnnouncementProvider>(context, listen: false);
    getAnnoucement.getAnnoucement();
  }

  @override
  Widget build(BuildContext context) {
    final getAnnoucement = Provider.of<AnnouncementProvider>(context);
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: AppColor.solidWhite,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppColor.solidWhite,
        leadingWidth: size.width * 0.13,
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
                  horizontal: MediaQuery.of(context).size.width / 20,
                ),
                child: const AppTitle(title: "Annoucements"),
              ),
              SizedBox(
                height: size.height * 0.02,
              ),
              getAnnoucement.annoucement?.length == null
                  ? const Center(child: CircularProgressIndicator(),)
                  : ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: getAnnoucement.annoucement?.length,
                      itemBuilder: (context, index) {
                        var annoucement = getAnnoucement.annoucement![index];
                        return Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: size.width * 0.040,
                              vertical: size.height * 0.007),
                          child: Container(
                            decoration: BoxDecoration(
                              // color: AppColor.lightGreyShade,
                              boxShadow: const [
                                // BoxShadow(
                                //   // color: AppColor.grey.withOpacity(0),
                                // )
                              ],
                              border: Border.all(
                                  color: Colors.white.withOpacity(0.2),
                                  width: 1.0),
                              gradient: const LinearGradient(
                                colors: [
                                  Color.fromARGB(255, 224, 224, 224),
                                  Color.fromARGB(255, 228, 186, 200),
                                ],
                                // stops: const [0.0, 1.0],
                              ),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child:
                                // Padding(
                                //   padding: EdgeInsets.symmetric(
                                //     horizontal: size.width * 0.01,
                                //     vertical: size.height * 0.01,
                                //   ),
                                //   child: ListTile(
                                //     leading: Opacity(
                                //       opacity: 0.50,
                                //       child: Image.asset(
                                //         "assets/megaphonee.png",
                                //         height: 50,
                                //         width: 50,
                                //       ),
                                //     ),
                                //     title: Text(
                                //       annoucement.title,
                                //       style: GoogleFonts.inter(
                                //         fontSize: 15.0,
                                //         fontWeight: FontWeight.w600,
                                //       ),
                                //     ),
                                //     subtitle: Text(
                                //       annoucement.body,
                                //       style: GoogleFonts.inter(
                                //         fontSize: 15.0,
                                //       ),
                                //       maxLines: 1,
                                //     ),
                                //     trailing: const FaIcon(
                                //       FontAwesomeIcons.chevronRight,
                                //     ),
                                //   ),
                                // ),

                                GestureDetector(
                              onTap: () => Get.to(
                                () => AnnoucementDetails(
                                  title: annoucement.title,
                                  body: annoucement.body,
                                  item: annoucement,
                                ),
                                // transition: Transition.cupertino,
                              ),
                              child: Stack(
                                children: <Widget>[
                                  Container(
                                    height: size.height * 0.14,
                                    width: size.width * 0.93,
                                    decoration: BoxDecoration(
                                      boxShadow: const [
                                        // BoxShadow(
                                        //   // color: AppColor.grey.withOpacity(0),
                                        // )
                                      ],
                                      border: Border.all(
                                          color: Colors.white.withOpacity(0.2),
                                          width: 1.0,),
                                      gradient: const LinearGradient(
                                        colors: [
                                          Color.fromARGB(255, 235, 235, 235),
                                          Color.fromARGB(255, 236, 188, 204),
                                        ],
                                        // stops: const [0.0, 1.0],
                                      ),
                                      borderRadius: BorderRadius.circular(20),
                                      color: AppColor.lightPinkShadeOpec,
                                    ),
                                  ),
                                  Positioned(
                                    bottom: size.height * -0.015,
                                    left: size.width * -0.055,
                                    child: ClipRRect(
                                      borderRadius: const BorderRadius.only(
                                        bottomLeft: Radius.circular(80),
                                      ),
                                      child: Opacity(
                                        opacity: 0.40,
                                        child: Image.asset(
                                          "assets/megaphonee.png",
                                          height: 100,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Center(
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(20),
                                      child: BackdropFilter(
                                        filter: ImageFilter.blur(
                                          sigmaX: 3.0,
                                          sigmaY: 3.0,
                                        ),
                                        child: Container(
                                          height: size.height * 0.14,
                                          width: size.width * 0.93,
                                          decoration: const BoxDecoration(
                                            color: Colors.transparent,
                                          ),
                                          child: Row(
                                            // mainAxisAlignment:
                                            //     MainAxisAlignment.spaceEvenly,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              SizedBox(
                                                width: size.width * 0.23,
                                              ),
                                              Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Align(
                                                    alignment:
                                                        Alignment.centerLeft,
                                                    child: SizedBox(
                                                      width: size.width * 0.55,
                                                      child: Text(
                                                        annoucement.title,
                                                        maxLines: 2,
                                                        style:
                                                            GoogleFonts.inter(
                                                          fontSize: 18.0,
                                                          fontWeight:
                                                              FontWeight.w700,
                                                          color: AppColor
                                                              .grey800,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  Align(
                                                    alignment:
                                                        Alignment.centerLeft,
                                                    child: SizedBox(
                                                      width: size.width * 0.40,
                                                      child: Text(
                                                        annoucement.body,
                                                        maxLines: 1,
                                                        style:
                                                            GoogleFonts.inter(
                                                          fontSize: 15.0,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          color:
                                                              AppColor.grey600,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              const FaIcon(
                                                FontAwesomeIcons.chevronRight,
                                                color: AppColor.grey600,
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                    SizedBox(height: size.height*0.09,),
            ],
          ),
        ),
      ),
    );
  }
}

