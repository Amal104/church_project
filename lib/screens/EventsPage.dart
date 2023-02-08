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
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Center(
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(20),
                              child: Stack(
                                children: [
                                  BackdropFilter(
                                    filter: ImageFilter.blur(
                                      sigmaX: 7,
                                      sigmaY: 7,
                                    ),
                                    child: const SizedBox(
                                      height: 220,
                                      width: 360,
                                    ),
                                  ),
                                  Container(
                                    height: 230,
                                    width: size.width * 0.93,
                                    decoration: BoxDecoration(
                                        boxShadow: [
                                          BoxShadow(
                                            color:
                                                AppColor.grey.withOpacity(0.60),
                                          )
                                        ],
                                        border: Border.all(
                                            color:
                                                Colors.white.withOpacity(0.2),
                                            width: 1.0),
                                        gradient: LinearGradient(
                                          colors: [
                                            AppColor.grey.withOpacity(0.60),
                                            AppColor.grey600.withOpacity(0.15)
                                          ],
                                          stops: const [0.0, 1.0],
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(20)),
                                    child: Padding(
                                      padding: const EdgeInsets.all(20.0),
                                      child: Column(
                                        children: [
                                          const SizedBox(
                                            height: 10,
                                          ),
                                          SizedBox(
                                            width: size.width * 0.7,
                                            child: Text(
                                              event.eventTitle,
                                              style: const TextStyle(
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 22),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
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
