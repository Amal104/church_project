import 'dart:ui';
import 'package:church/widgets/AnnoucementDetails.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import '../provider/AnnoucementProvider.dart';
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
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
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
                  horizontal: MediaQuery.of(context).size.width / 25,
                ),
                child: Text(
                  "Annoucement",
                  style: GoogleFonts.inter(
                    fontSize: 25.0,
                    fontWeight: FontWeight.bold,
                    color: AppColor.grey600,
                    letterSpacing: 1.0,
                  ),
                ),
              ),
              SizedBox(
                height: size.height * 0.02,
              ),
              getAnnoucement.annoucement?.length == null
                  ? Image.asset(
                      "assets/404error.jpg",
                      height: 550,
                    )
                  : ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: getAnnoucement.annoucement?.length,
                      itemBuilder: (context, index) {
                        var annoucement = getAnnoucement.annoucement![index];
                        return
                            // child: Padding(
                            //   padding: const EdgeInsets.all(8.0),
                            //   child: Stack(
                            //     children: <Widget>[
                            //       Center(
                            //         child: Container(
                            //           height: 200,
                            //           decoration: BoxDecoration(
                            //             color: AppColor.lightPinkShadeOpec,
                            //             borderRadius: BorderRadius.circular(15),
                            //             image: const DecorationImage(
                            //               alignment: Alignment.bottomRight,
                            //               fit: BoxFit.fitHeight,
                            //               image:
                            //                   AssetImage("assets/megaphone.png"),
                            //             ),
                            //           ),
                            //         ),
                            //       ),
                            //       Center(
                            //         child: ClipRRect(
                            //           borderRadius: BorderRadius.circular(15),
                            //           child: BackdropFilter(
                            //             filter: ImageFilter.blur(
                            //                 sigmaX: 10.0, sigmaY: 10.0),
                            //             child: Container(
                            //               height: 200.0,
                            //               width: 500.0,
                            //               decoration: const BoxDecoration(
                            //                 color: Colors.transparent,
                            //               ),
                            //               child: Padding(
                            //                 padding: EdgeInsets.only(
                            //                     left: size.width * 0.05,
                            //                     top: size.height * 0.035),
                            //                 child: Text(
                            //                   getAnnoucement
                            //                       .annoucement![index].title,
                            //                   maxLines: 2,
                            //                   style: GoogleFonts.inter(
                            //                     fontSize: 20.0,
                            //                     fontWeight: FontWeight.w700,
                            //                     color: AppColor.darkPinkShade,
                            //                   ),
                            //                 ),
                            //               ),
                            //             ),
                            //           ),
                            //         ),
                            //       ),
                            //       Positioned(
                            //         bottom: 10,
                            //         left: 5,
                            //         child: IconButton(
                            //             onPressed: () {},
                            //             icon: const FaIcon(
                            //               FontAwesomeIcons.chevronRight,
                            //             )),
                            //       )
                            //     ],
                            //   ),
                            Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: size.width * 0.035,
                              vertical: size.height * 0.01),
                          child: Card(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20)),
                            color: AppColor.lightGreyShade,
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: size.width * 0.03),
                              child: Column(
                                children: [
                                  SizedBox(
                                    height: size.height * 0.02,
                                  ),
                                  Text(
                                    annoucement.title,
                                    textAlign: TextAlign.center,
                                    style: GoogleFonts.inter(
                                      fontSize: 18.0,
                                      fontWeight: FontWeight.w600,
                                      color: AppColor.grey800,
                                      letterSpacing: 0.5,
                                    ),
                                  ),
                                  SizedBox(
                                    height: size.height * 0.03,
                                  ),
                                  Text(
                                    annoucement.body,
                                    textAlign: TextAlign.justify,
                                    style: GoogleFonts.inter(
                                      fontSize: 15.0,
                                      color: AppColor.grey800,
                                    ),
                                  ),
                                  SizedBox(
                                    height: size.height * 0.02,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    ),
            ],
          ),
        ),
      ),
    );
  }
}
