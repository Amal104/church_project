import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:church/Extensions/StringExtension.dart';
import 'package:church/Services/Birthday_Anniversary_Services.dart';
import 'package:church/provider/Birthday_Anniversary_Provider.dart';
import 'package:church/screens/Birthday_Details.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:table_calendar/table_calendar.dart';
import '../components/TabBarIndicator.dart';
import '../values/AppBar.dart';
import '../values/AppTitle.dart';
import '../values/values.dart';
import 'Anniversary_Details.dart';

class BirthdayCalender extends StatefulWidget {
  const BirthdayCalender({super.key});

  @override
  State<BirthdayCalender> createState() => _BirthdayCalenderState();
}

class _BirthdayCalenderState extends State<BirthdayCalender> {
  void _ondaySelected(DateTime day, DateTime focusedday) {
    setState(() {
      today.value = day;
      final postModel =
          Provider.of<BirthdayAnniversaryProvider>(context, listen: false);
      postModel.getEvent(today.value);
    });
  }

  @override
  void initState() {
    super.initState();
    final postModel =
        Provider.of<BirthdayAnniversaryProvider>(context, listen: false);
    postModel.getEvent(today.value);
  }

  ValueNotifier<DateTime> today = ValueNotifier(DateTime.now());
  @override
  Widget build(BuildContext context) {
    final postModel = Provider.of<BirthdayAnniversaryProvider>(context);
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: AppColor.solidWhite,
      appBar: CustomAppBar.customAppBarIcon(),
      body: DefaultTabController(
        length: 2,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: MediaQuery.of(context).size.width / 20,
                  ),
                  child: const AppTitle(title: "Birthday")),
              SizedBox(
                height: size.height * 0.02,
              ),
              TableCalendar(
                focusedDay: today.value,
                firstDay: DateTime.utc(2010, 10, 1),
                lastDay: DateTime.utc(2040, 10, 20),
                headerStyle: const HeaderStyle(
                  titleCentered: true,
                  formatButtonVisible: false,
                ),
                rowHeight: size.height * 0.045,
                availableGestures: AvailableGestures.all,
                selectedDayPredicate: (day) {
                  return isSameDay(day, today.value);
                },
                onDaySelected: _ondaySelected,
              ),
              SizedBox(
                height: size.height * 0.02,
              ),
              SizedBox(
                height: size.height * 0.07,
                width: size.width,
                child: TabBar(
                    padding:
                        EdgeInsets.symmetric(vertical: size.height * 0.007),
                    unselectedLabelColor: AppColor.grey400,
                    indicator: const DotIndicator(color: AppColor.grey800),
                    tabs: const [
                      Tab(
                        text: "Birthday",
                      ),
                      Tab(
                        text: "Anniversary",
                      ),
                    ]),
              ),
              SizedBox(
                height: size.height * 0.40,
                width: size.width,
                child: TabBarView(children: [
                  postModel.loading
                      ? const Center(
                          child: CircularProgressIndicator(),
                        )
                      : ListView.builder(
                          shrinkWrap: true,
                          itemCount: postModel.event!.birthdays.length,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: size.width * 0.040,
                                  vertical: size.height * 0.005),
                              child: Card(
                                elevation: 5,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20)),
                                child: Container(
                                  decoration: BoxDecoration(
                                    gradient: const LinearGradient(
                                      colors: [
                                        Color.fromARGB(255, 224, 224, 224),
                                        Color.fromARGB(255, 228, 186, 200),
                                      ],
                                    ),
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  child: GestureDetector(
                                    onTap: () => Get.to(() => BirthdayDetails(
                                        memberid: postModel
                                            .event!.birthdays[index].memberId,
                                        email: postModel
                                            .event!.birthdays[index].email,
                                        edavakaReg: postModel.event!
                                            .birthdays[index].edavakaRegisterNo,
                                        gender: postModel
                                            .event!.birthdays[index].gender,
                                        membershipStatus: postModel.event!
                                            .birthdays[index].membershipStatus,
                                        housename: postModel
                                            .event!.birthdays[index].houseName,
                                        address1: postModel
                                            .event!.birthdays[index].address1,
                                        address2: postModel
                                            .event!.birthdays[index].address2,
                                        postoffice: postModel
                                            .event!.birthdays[index].postoffice,
                                        pincode: postModel
                                            .event!.birthdays[index].pincode,
                                        // prayerGroup: postModel.event!.birthdays[index].prayerGroup,
                                        designation: postModel.event!
                                            .birthdays[index].designation,
                                        // organization: postModel.event!.birthdays[index].organisation,
                                        mobile: postModel.event!
                                            .birthdays[index].mobilePhone,
                                        phoneOffice: postModel.event!
                                            .birthdays[index].phoneOffice,
                                        birthday: postModel
                                            .event!.birthdays[index].birthday,
                                        marriageDate: postModel.event!
                                            .birthdays[index].marriageDate,
                                        homeParishHouseName: postModel
                                            .event!
                                            .birthdays[index]
                                            .homeParishHouseName,
                                        homeParish: postModel
                                            .event!.birthdays[index].homeParish,
                                        nativePlace: postModel.event!
                                            .birthdays[index].nativePlace,
                                        generalRemarks: postModel.event!
                                            .birthdays[index].generalRemarks,
                                        memberName: postModel
                                            .event!.birthdays[index].memberName,
                                        photo: postModel.event!.birthdays[index]
                                            .memberPhoto,
                                        item: postModel.event!.birthdays[index],
                                        latitude: postModel
                                            .event!.birthdays[index].latitude,
                                        longitude: postModel.event!
                                            .birthdays[index].longitude)),
                                    child: Stack(
                                      children: <Widget>[
                                        Container(
                                          height: size.height * 0.14,
                                          width: size.width * 0.93,
                                          decoration: BoxDecoration(
                                            gradient: const LinearGradient(
                                              colors: [
                                                Color.fromARGB(
                                                    255, 235, 235, 235),
                                                Color.fromARGB(
                                                    255, 236, 188, 204),
                                              ],
                                              // stops: const [0.0, 1.0],
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(20),
                                            // color: AppColor.lightPinkShadeOpec,
                                          ),
                                        ),
                                        Center(
                                          child: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(20),
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
                                                      width: size.width * 0.03,
                                                    ),
                                                    Hero(
                                                      tag: postModel.event!
                                                          .birthdays[index],
                                                      child: CircleAvatar(
                                                        radius:
                                                            size.height * 0.04,
                                                        backgroundImage:
                                                            CachedNetworkImageProvider(
                                                                postModel
                                                                    .event!
                                                                    .birthdays[
                                                                        index]
                                                                    .memberPhoto),
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      width: size.width * 0.05,
                                                    ),
                                                    Column(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Align(
                                                          alignment: Alignment
                                                              .centerLeft,
                                                          child: SizedBox(
                                                            width: size.width *
                                                                0.55,
                                                            child: Text(
                                                              postModel
                                                                  .event!
                                                                  .birthdays[
                                                                      index]
                                                                  .memberName
                                                                  .toCapitalized(),
                                                              maxLines: 2,
                                                              style: GoogleFonts
                                                                  .inter(
                                                                fontSize: 18.0,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w700,
                                                                color: AppColor
                                                                    .grey800,
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                        Align(
                                                          alignment: Alignment
                                                              .centerLeft,
                                                          child: SizedBox(
                                                            width: size.width *
                                                                0.40,
                                                            child: Text(
                                                              "Happy Birthday🎉",
                                                              maxLines: 1,
                                                              style: GoogleFonts
                                                                  .inter(
                                                                fontSize: 15.0,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500,
                                                                color: AppColor
                                                                    .grey600,
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                    const FaIcon(
                                                      FontAwesomeIcons
                                                          .chevronRight,
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
                              ),
                            );
                          },
                        ),
                  postModel.loading
                      ? const Center(
                          child: CircularProgressIndicator(),
                        )
                      : ListView.builder(
                          shrinkWrap: true,
                          itemCount: postModel.event!.anniversarys.length,
                          itemBuilder: (context, index) {
                            var data = postModel.event!.anniversarys[index];
                            return Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: size.width * 0.040,
                                  vertical: size.height * 0.005),
                              child: GestureDetector(
                                onTap: () {
                                  Get.to(() => AnniversaryDetails(
                                        memberid: data.memberId,
                                        email: data.email,
                                        edavakaReg: data.edavakaRegisterNo,
                                        gender: data.gender,
                                        membershipStatus: data.membershipStatus,
                                        housename: data.houseName,
                                        address1: data.address1,
                                        address2: data.address2,
                                        postoffice: data.postoffice,
                                        pincode: data.pincode,
                                        designation: data.designation,
                                        mobile: data.mobilePhone,
                                        phoneOffice: data.phoneOffice,
                                        birthday: data.birthday,
                                        marriageDate: data.marriageDate,
                                        homeParishHouseName:
                                            data.homeParishHouseName,
                                        homeParish: data.homeParish,
                                        nativePlace: data.nativePlace,
                                        generalRemarks: data.generalRemarks,
                                        memberName: data.memberName,
                                        photo: data.memberPhoto,
                                        item: data,
                                        latitude: data.latitude,
                                        longitude: data.longitude,
                                      ));
                                },
                                child: Card(
                                  elevation: 5,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20)),
                                  child: Container(
                                    decoration: BoxDecoration(
                                      gradient: const LinearGradient(
                                        colors: [
                                          Color.fromARGB(255, 224, 224, 224),
                                          Color.fromARGB(255, 228, 186, 200),
                                        ],
                                      ),
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    child: GestureDetector(
                                      child: Stack(
                                        children: <Widget>[
                                          Container(
                                            height: size.height * 0.14,
                                            width: size.width * 0.93,
                                            decoration: BoxDecoration(
                                              gradient: const LinearGradient(
                                                colors: [
                                                  Color.fromARGB(
                                                      255, 235, 235, 235),
                                                  Color.fromARGB(
                                                      255, 236, 188, 204),
                                                ],
                                                // stops: const [0.0, 1.0],
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(20),
                                              // color: AppColor.lightPinkShadeOpec,
                                            ),
                                          ),
                                          Center(
                                            child: ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(20),
                                              child: BackdropFilter(
                                                filter: ImageFilter.blur(
                                                  sigmaX: 3.0,
                                                  sigmaY: 3.0,
                                                ),
                                                child: Container(
                                                  height: size.height * 0.14,
                                                  width: size.width * 0.93,
                                                  decoration:
                                                      const BoxDecoration(
                                                    color: Colors.transparent,
                                                  ),
                                                  child: Row(
                                                    // mainAxisAlignment:
                                                    //     MainAxisAlignment.spaceEvenly,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .center,
                                                    children: [
                                                      SizedBox(
                                                        width:
                                                            size.width * 0.03,
                                                      ),
                                                      CircleAvatar(
                                                        radius:
                                                            size.height * 0.04,
                                                        backgroundImage:
                                                            CachedNetworkImageProvider(
                                                                postModel
                                                                    .event!
                                                                    .anniversarys[
                                                                        index]
                                                                    .memberPhoto),
                                                      ),
                                                      SizedBox(
                                                        width:
                                                            size.width * 0.05,
                                                      ),
                                                      Column(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          Align(
                                                            alignment: Alignment
                                                                .centerLeft,
                                                            child: SizedBox(
                                                              width:
                                                                  size.width *
                                                                      0.55,
                                                              child: Text(
                                                                postModel
                                                                    .event!
                                                                    .anniversarys[
                                                                        index]
                                                                    .memberName
                                                                    .toCapitalized(),
                                                                maxLines: 2,
                                                                style:
                                                                    GoogleFonts
                                                                        .inter(
                                                                  fontSize:
                                                                      18.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w700,
                                                                  color: AppColor
                                                                      .grey800,
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                          Align(
                                                            alignment: Alignment
                                                                .centerLeft,
                                                            child: SizedBox(
                                                              width:
                                                                  size.width *
                                                                      0.40,
                                                              child: Text(
                                                                "Happy Wedding Anniversary🎉",
                                                                style:
                                                                    GoogleFonts
                                                                        .inter(
                                                                  fontSize:
                                                                      15.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500,
                                                                  color: AppColor
                                                                      .grey600,
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                      const FaIcon(
                                                        FontAwesomeIcons
                                                            .chevronRight,
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
                                ),
                              ),
                            );
                          },
                        ),
                ]),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
