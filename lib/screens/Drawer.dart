import 'package:cached_network_image/cached_network_image.dart';
import 'package:church/components/AltertDialogue.dart';
import 'package:church/values/values.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'LoginScreen.dart';
import '../values/urls.dart';

class Drawerr extends StatelessWidget {
  const Drawerr({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Drawer(
      backgroundColor: AppColor.grey100,
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
                CachedNetworkImage(
                  imageUrl: AppUrls.user,
                  imageBuilder: (context, imageProvider) => Container(
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
                const Text(
                  'Devoloper Akash',
                  style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.w600,
                      color: Colors.white),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(
                  height: 5.0,
                ),
                const Text(
                  'Senior Devoloper\ntaSki technologies',
                  style: TextStyle(
                      fontSize: 15.0,
                      fontWeight: FontWeight.w600,
                      color: Colors.white54),
                  textAlign: TextAlign.center,
                )
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.all(24),
            child: Wrap(
              runSpacing: 16,
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
                // ListTile(
                //   leading: const Icon(Icons.message_outlined),
                //   title: const Text('Achens Message'),
                //   onTap: () {
                //     Get.to(() => const AchansMessagePage(),
                //         transition: Transition.rightToLeft);
                //   },
                // ),
                 ListTile(
                  leading: const Icon(Icons.notifications_outlined),
                  title: Text('Notifications',style: GoogleFonts.inter(),),
                ),
                const Divider(
                  thickness: 1,
                  color: Colors.black26,
                ),
                ListTile(
                  leading: const Icon(Icons.logout_outlined),
                  title: Text('Logout',style: GoogleFonts.inter(),),
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
