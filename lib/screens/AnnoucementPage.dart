import 'dart:ui';
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
              getAnnoucement.isLoading
                  ? Image.asset(
                      "assets/404notfound.jpg",
                      height: 550,
                    )
                  : ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: getAnnoucement.annoucement?.length,
                      itemBuilder: (context, index) {
                        var annoucement = getAnnoucement.annoucement![index];
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Stack(
                            children: <Widget>[
                              Center(
                                child: Container(
                                  height: 200,
                                  decoration: BoxDecoration(
                                    color: AppColor.lightPinkShadeOpec,
                                    borderRadius: BorderRadius.circular(15),
                                    image: const DecorationImage(
                                      alignment: Alignment.bottomRight,
                                      fit: BoxFit.fitHeight,
                                      image: AssetImage("assets/megaphone.png"),
                                    ),
                                  ),
                                ),
                              ),
                              Center(
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(15),
                                  child: BackdropFilter(
                                    filter: ImageFilter.blur(
                                        sigmaX: 10.0, sigmaY: 10.0),
                                    child: Container(
                                      height: 200.0,
                                      width: 500.0,
                                      decoration: const BoxDecoration(
                                        color: Colors.transparent,
                                      ),
                                      child: Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: size.width * 0.03,
                                            vertical: size.height * 0.05),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              getAnnoucement
                                                  .annoucement![index].title,
                                              style: GoogleFonts.inter(
                                                fontSize: 20.0,
                                                fontWeight: FontWeight.w700,
                                                color: AppColor.darkPinkShade,
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsets.symmetric(
                                                  vertical: size.height * 0.01),
                                              child: IconButton(
                                                  onPressed: () {},
                                                  icon: const FaIcon(
                                                    FontAwesomeIcons
                                                        .chevronRight,
                                                  )),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
              Image.asset(
                "assets/404notfound.jpg",
                height: 550,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
