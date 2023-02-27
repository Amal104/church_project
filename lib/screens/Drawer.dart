import 'package:cached_network_image/cached_network_image.dart';
import 'package:church/Extensions/StringExtension.dart';
import 'package:church/Model/MemberListModel.dart';
import 'package:church/Model/Profile_Model.dart';
import 'package:church/Services/Profile_Services.dart';
import 'package:church/components/AltertDialogue.dart';
import 'package:church/provider/ChangePassword.dart';
import 'package:church/provider/Location_Provider.dart';
import 'package:church/screens/ChangePassword_Screen.dart';
import 'package:church/screens/HouseLocation_Screen.dart';
import 'package:church/screens/MemberPage.dart';
import 'package:church/screens/PrayerMeeting_Screen.dart';
import 'package:church/screens/Profile_Screen.dart';
import 'package:church/screens/WorshipTime_Screen.dart';
import 'package:church/values/values.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../provider/Profile_Provider.dart';
import 'Birthdat_Anniversery_calender.dart';
import 'LoginScreen.dart';
import '../values/urls.dart';

class Drawerr extends StatefulWidget {
  const Drawerr({
    Key? key,
  }) : super(key: key);

  @override
  State<Drawerr> createState() => _DrawerrState();
}

class _DrawerrState extends State<Drawerr> {
  Future<ProfileModel?>? profile;

  @override
  void initState() {
    super.initState();
    // final getProfile = Provider.of<ProfileProvider>(context, listen: false);
    // getProfile.getProfileDetails();
    profile = ProfileService().profileDetails();
  }

  @override
  Widget build(BuildContext context) {
    // final getProfile = Provider.of<ProfileProvider>(context);
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Drawer(
      // backgroundColor: AppColor.grey100,
      child: Column(
        children: [
          Container(
            color: AppColor.grey,
            height: height * 0.36,
            width: double.infinity,
            padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: height * 0.01,
                ),
                FutureBuilder<ProfileModel?>(
                  future: profile,
                  builder: (context, snapshot) {
                    return GestureDetector(
                      onTap: () {
                        var data = snapshot.data!;
                        Get.to(
                          () => ProfileScreen(
                            profilePhoto: data.memberPhoto,
                            address1: data.address1,
                            address2: data.address2,
                            birthday: data.birthday,
                            bloodGroup: data.bloodGroup,
                            email: data.email,
                            homeParish: data.homeParish,
                            houseName: data.houseName,
                            landline: data.landline,
                            memberName: data.memberName,
                            mobilePhone: data.mobilePhone,
                            pincode: data.pincode,
                          ),
                        );
                      },
                      child: Column(
                        children: [
                          snapshot.data?.memberPhoto != null
                              ? Hero(
                                  tag: "profilephoto",
                                  child: CircleAvatar(
                                    radius: height * 0.07,
                                    backgroundImage: CachedNetworkImageProvider(
                                      snapshot.data?.memberPhoto ?? "",
                                    ),
                                  ),
                                )
                              : CircleAvatar(
                                  radius: height * 0.08,
                                  backgroundImage: const AssetImage(
                                      "assets/default_profile.png")),
                          SizedBox(
                            height: height * 0.01,
                          ),
                          Text(
                            snapshot.data?.memberName.toTitleCase() ?? "",
                            style: const TextStyle(
                                fontSize: 18.0,
                                fontWeight: FontWeight.w600,
                                color: Colors.white),
                            textAlign: TextAlign.center,
                          ),
                          SizedBox(
                            height: height * 0.003,
                          ),
                          Text(
                            snapshot.data?.houseName.toTitleCase() ?? "",
                            style: const TextStyle(
                                fontSize: 13.0,
                                fontWeight: FontWeight.w600,
                                color: AppColor.grey400),
                            textAlign: TextAlign.center,
                          ),
                          // Text(
                          //   snapshot.data?.homeParish ?? "",
                          //   style: const TextStyle(
                          //       fontSize: 13.0,
                          //       fontWeight: FontWeight.w600,
                          //       color: AppColor.grey400),
                          //   textAlign: TextAlign.center,
                          // ),
                          LottieBuilder.asset(
                            "assets/lottie/scroll.json",
                            fit: BoxFit.cover,
                            height: height * 0.060,
                          )
                        ],
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
          SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.only(
                left: width * 0.05,
                right: width * 0.05,
                top: height * 0.02,
              ),
              child: Wrap(
                runSpacing: height * 0.008,
                children: [
                  ListTile(
                    onTap: () => Get.to(
                      () => const MemberPage(),
                      transition: Transition.rightToLeft,
                    ),
                    leading: const Icon(Icons.person_outline),
                    title: Text(
                      'Members',
                      style: GoogleFonts.inter(),
                    ),
                  ),
                  ListTile(
                    onTap: () => Get.to(
                      () => const BirthdayCalender(),
                      transition: Transition.rightToLeft,
                    ),
                    leading: const Icon(Icons.celebration_outlined),
                    title: Text(
                      'Birthday',
                      style: GoogleFonts.inter(),
                    ),
                  ),
                  Consumer<LocationProvider>(
                    builder: (context, provider, child) => ListTile(
                      onTap: () async {
                        Position position = await provider.getCurrentLocation();
                        provider.lat = position.latitude.toString();
                        provider.long = position.longitude.toString();
                
                        provider.storeLocation(context);
                      },
                      leading: const Icon(Icons.location_on_outlined),
                      title: Text(
                        'House Location',
                        style: GoogleFonts.inter(),
                      ),
                    ),
                  ),
                  ListTile(
                    onTap: () => Get.to(
                      () => const WorshipTimeScreen(),
                      transition: Transition.rightToLeft,
                    ),
                    leading: const Icon(Icons.alarm),
                    title: Text(
                      'Worship Time',
                      style: GoogleFonts.inter(),
                    ),
                  ),
                  ListTile(
                    onTap: () => Get.to(
                      () => const PrayerMeetingScreen(),
                      transition: Transition.rightToLeft,
                    ),
                    leading: const Icon(Icons.groups_outlined),
                    title: Text(
                      'Prayer Meeting',
                      style: GoogleFonts.inter(),
                    ),
                  ),
                  const Divider(
                    thickness: 1,
                    color: Colors.grey,
                  ),
                  Consumer<ChangePasswordProvider>(
                    builder: (context, provider, child) => ListTile(
                      leading: const Icon(Icons.password_outlined),
                      title: Text(
                        'Change Password',
                        style: GoogleFonts.inter(),
                      ),
                      onTap: () {
                        provider.newPasswordController.clear();
                        provider.oldPasswordController.clear();
                        Get.to(
                          () => const ChangePasswordScreen(),
                          transition: Transition.rightToLeft,
                        );
                      },
                    ),
                  ),
                  ListTile(
                    leading: const Icon(Icons.logout_outlined),
                    title: Text(
                      'Logout',
                      style: GoogleFonts.inter(),
                    ),
                    onTap: () {
                      CustomAlertDialog.logOutyescancelDialog(
                          context, "Logout", "Do you want to Logout?");
                    },
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
