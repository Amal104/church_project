import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import '../provider/EventProvider.dart';
import '../values/values.dart';

class EventsPage extends StatefulWidget {
  const EventsPage({super.key});

  @override
  State<EventsPage> createState() => _EventsPageState();
}

class _EventsPageState extends State<EventsPage> {
  @override
  void initState() {
    super.initState();
    final getEvent = Provider.of<EventProvider>(context, listen: false);
    getEvent.getEvent();
  }

  @override
  Widget build(BuildContext context) {
    final getEvent = Provider.of<EventProvider>(context);
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppColor.solidWhite,
        // leadingWidth: size.width * 0.1,
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
                child: Text(
                  "Events",
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
              getEvent.event!.isNotEmpty
                  ? ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: getEvent.event?.length,
                      itemBuilder: (context, index) {
                        var event = getEvent.event![index];
                        var formattedDate = DateFormat("dd").format(event.date);
                        var formattedMonth =
                            DateFormat("MMM").format(event.date);
                        var formattedYear =
                            DateFormat("yyyy").format(event.date);
                        return Padding(
                          padding: EdgeInsets.symmetric(
                              vertical: size.height * 0.01,
                              horizontal: size.width * 0.03),
                          child: Center(
                            child: Container(
                              padding: EdgeInsets.symmetric(
                                  vertical: size.height * 0.028,),
                              decoration: BoxDecoration(
                                boxShadow: const [
                                  BoxShadow(
                                    // color: AppColor.grey.withOpacity(0.60),
                                  )
                                ],
                                border: Border.all(
                                    color: Colors.white.withOpacity(0.2),
                                    width: 1.0),
                                gradient: const LinearGradient(
                                  colors: [
                                    Color.fromARGB(255, 224, 224, 224),
                                    Color.fromARGB(255, 228, 186, 200),
                                    // Color.fromARGB(174, 225, 230, 233),
                                  ],
                                  // stops: const [0.0, 1.0],
                                ),
                                borderRadius: BorderRadius.circular(20),
                              ),

                              //   boxShadow: [
                              //     BoxShadow(
                              //       color: AppColor.grey.withOpacity(0.60),
                              //     )
                              //   ],
                              //   border: Border.all(
                              //       color: Colors.white.withOpacity(0.2),
                              //       width: 1.0),
                              //   gradient: const LinearGradient(
                              //     colors: [
                              //       Color.fromARGB(187, 0, 6, 71),
                              //       AppColor.purpleShade,
                              //     ],
                              //     stops: [0.0, 1.0],
                              //   ),
                              //   borderRadius: BorderRadius.circular(20),
                              // ),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        formattedDate,
                                        style: GoogleFonts.inter(
                                          color: AppColor.solidBlack,
                                          fontSize: 20,
                                        ),
                                      ),
                                      Text(
                                        formattedMonth,
                                        style: GoogleFonts.inter(
                                          color: AppColor.solidBlack,
                                          fontWeight: FontWeight.w600,
                                          fontSize: 20,
                                        ),
                                      ),
                                      Text(
                                        formattedYear,
                                        style: GoogleFonts.inter(
                                          color: AppColor.solidBlack,
                                          fontSize: 20,
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    width: size.height * 0.03,
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(
                                        width: size.width * 0.65,
                                        child: Text(
                                          event.eventTitle,
                                          textAlign: TextAlign.start,
                                          style: GoogleFonts.inter(
                                            color: AppColor.solidBlack,
                                            fontWeight: FontWeight.w600,
                                            fontSize: 20,
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        height: size.height * 0.005,
                                      ),
                                      Text(
                                        "${event.venue}\nat ${event.time}",
                                        style: GoogleFonts.inter(
                                          color: AppColor.grey,
                                          fontSize: 18,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    )
                  : Center(
                      child: Image.asset(
                        "assets/404notfound.jpg",
                        height: 200,
                      ),
                    ),
            ],
          ),
        ),
      ),
    );
  }
}
