import 'package:church/provider/PrayerMeeting_Provider.dart';
import 'package:church/values/AppTitle.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import '../values/AppBar.dart';
import '../values/values.dart';

class PrayerMeetingScreen extends StatefulWidget {
  const PrayerMeetingScreen({super.key});

  @override
  State<PrayerMeetingScreen> createState() => _PrayerMeetingScreenState();
}

class _PrayerMeetingScreenState extends State<PrayerMeetingScreen> {
  @override
  void initState() {
    super.initState();
    final prayerMeeting =
        Provider.of<PrayerMeetingProvider>(context, listen: false);
    prayerMeeting.getPrayerMeeting();
  }

  @override
  Widget build(BuildContext context) {
    final getPrayerMeeting = Provider.of<PrayerMeetingProvider>(context);
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: AppColor.solidWhite,
      appBar: CustomAppBar.customAppBarIcon(),
      body: SingleChildScrollView(
        child: SafeArea(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: MediaQuery.of(context).size.width / 20,
              ),
              child: const AppTitle(title: "Prayer Meeting")
            ),
            SizedBox(
              height: size.height * 0.02,
            ),
            getPrayerMeeting.prayermeeting!.isNotEmpty
                ? ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: getPrayerMeeting.prayermeeting?.length,
                    itemBuilder: (context, index) {
                      var prayer = getPrayerMeeting.prayermeeting![index];
                      var formattedDate = DateFormat("dd").format(prayer.date);
                      var formattedMonth = DateFormat("MMM").format(prayer.date);
                      var formattedYear = DateFormat("yyyy").format(prayer.date);
                      return Padding(
                        padding: EdgeInsets.symmetric(
                            vertical: size.height * 0.005,
                            horizontal: size.width * 0.03),
                        child: Center(
                          child: Card(
                            elevation: 3,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20)
                              ),
                            child: Container(
                              padding: EdgeInsets.symmetric(
                                vertical: size.height * 0.015,
                              ),
                              decoration: BoxDecoration(
                                border: Border.all(
                                    color: Colors.white.withOpacity(0.2),
                                    width: 1.0),
                                gradient: const LinearGradient(
                                  colors: [
                                    Color.fromARGB(255, 237, 237, 237),
                                    Color.fromARGB(255, 236, 188, 204),
                                  ],
                                  // stops: const [0.0, 1.0],
                                ),
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        formattedDate,
                                        style: GoogleFonts.inter(
                                          color: AppColor.grey600,
                                          fontSize: 18,
                                        ),
                                      ),
                                      Text(
                                        formattedMonth,
                                        style: GoogleFonts.inter(
                                          color: AppColor.solidBlack,
                                          fontWeight: FontWeight.w600,
                                          fontSize: 18,
                                        ),
                                      ),
                                      Text(
                                        formattedYear,
                                        style: GoogleFonts.inter(
                                          color: AppColor.grey600,
                                          fontSize: 18,
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    width: size.height * 0.03,
                                  ),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(
                                        width: size.width * 0.65,
                                        child: Text(
                                          prayer.group.prayerGroupName,
                                          textAlign: TextAlign.start,
                                          style: GoogleFonts.inter(
                                            color: AppColor.solidBlack,
                                            fontWeight: FontWeight.w600,
                                            fontSize: 18,
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        height: size.height * 0.005,
                                      ),
                                      Text(
                                        prayer.venue,
                                        style: GoogleFonts.inter(
                                          color: AppColor.grey600,
                                          fontSize: 16,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  )
                : SizedBox(
                    height: size.height,
                    width: size.width,
                    child: const Center(child: CircularProgressIndicator()),
                  ),
          ],
        )),
      ),
    );
  }
}
