import 'package:cached_network_image/cached_network_image.dart';
import 'package:church/Extensions/StringExtension.dart';
import 'package:church/Model/MemberListModel.dart';
import 'package:church/Model/Profile_Model.dart';
import 'package:church/Services/Profile_Services.dart';
import 'package:church/components/AltertDialogue.dart';
import 'package:church/screens/MemberPage.dart';
import 'package:church/screens/PrayerMeeting_Screen.dart';
import 'package:church/screens/Profile_Screen.dart';
import 'package:church/screens/WorshipTime_Screen.dart';
import 'package:church/values/values.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../provider/Profile_Provider.dart';
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
            height: 300,
            width: double.infinity,
            padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 20.0,
                ),
                FutureBuilder<ProfileModel?>(
                  future: profile,
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return GestureDetector(
                        onTap: () {
                          Get.to(
                            () => const ProfileScreen(),
                            transition: Transition.upToDown,
                          );
                        },
                        child: Column(
                          children: [
                            CachedNetworkImage(
                              imageUrl: snapshot.data?.memberPhoto ?? "",
                              imageBuilder: (context, imageProvider) =>
                                  Container(
                                width: width * 0.5,
                                height: height * 0.15,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  image: DecorationImage(
                                      image: imageProvider, fit: BoxFit.cover),
                                ),
                              ),
                              placeholder: (context, url) =>
                                  const CircularProgressIndicator(),
                              errorWidget: (context, url, error) => const Icon(
                                Icons.error_outline,
                                size: 60,
                              ),
                            ),
                            const SizedBox(
                              height: 15.0,
                            ),
                            Text(
                              snapshot.data?.memberName.toTitleCase() ?? "",
                              style: const TextStyle(
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.white),
                              textAlign: TextAlign.center,
                            ),
                            const SizedBox(
                              height: 5.0,
                            ),
                            Text(
                              snapshot.data?.houseName.toTitleCase() ?? "",
                              style: const TextStyle(
                                  fontSize: 15.0,
                                  fontWeight: FontWeight.w600,
                                  color: AppColor.grey400),
                              textAlign: TextAlign.center,
                            ),
                            Text(
                              snapshot.data?.homeParish ?? "",
                              style: const TextStyle(
                                  fontSize: 15.0,
                                  fontWeight: FontWeight.w600,
                                  color: AppColor.grey400),
                              textAlign: TextAlign.center,
                            ),
                            SizedBox(
                              height: height * 0.008,
                            ),
                            const FaIcon(
                              FontAwesomeIcons.chevronDown,
                              size: 20,
                              color: AppColor.grey600,
                            )
                          ],
                        ),
                      );
                    }
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  },
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.all(24),
            child: Wrap(
              runSpacing: 15,
              children: [
                ListTile(
                  leading: const Icon(Icons.home_outlined),
                  title: Text(
                    'Home',
                    style: GoogleFonts.inter(
                      color: AppColor.grey,
                    ),
                  ),
                  onTap: () {
                    Get.back();
                  },
                ),
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
          )
        ],
      ),
    );
  }
}
