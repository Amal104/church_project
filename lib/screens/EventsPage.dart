import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
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
              getEvent.event?.length != 0
                  ? ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: getEvent.event?.length,
                      itemBuilder: (context, index) {
                        var event = getEvent.event![index];
                        return Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: size.height * 0.02,
                              vertical: size.width * 0.03),
                          child: Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: size.height * 0.02,
                                  vertical: size.width * 0.03),
                              decoration: BoxDecoration(
                                color: AppColor.lightGreyShade,
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Column(
                                children: [
                                  Text(event.eventTitle),
                                  SizedBox(
                                    height: size.height * 0.02,
                                  ),
                                  Text(event.date),
                                  SizedBox(
                                    height: size.height * 0.02,
                                  ),
                                ],
                              )),
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
