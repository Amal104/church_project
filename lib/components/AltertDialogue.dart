import 'package:church/screens/LoginScreen.dart';
import 'package:church/values/urls.dart';
import 'package:church/values/values.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../provider/LoginProvider.dart';

class CustomAlertDialog {
  static passwordReqDialogue(BuildContext context) {
    return showDialog(
      context: context,
      builder: (context) {
        return CupertinoAlertDialog(
          content: SizedBox(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                        right: MediaQuery.of(context).size.width * 0.025,
                      ),
                      child: Container(
                        height: MediaQuery.of(context).size.height * 0.05,
                        width: MediaQuery.of(context).size.width * 0.025,
                        decoration: const BoxDecoration(
                          color: AppColor.kprimary,
                          shape: BoxShape.circle,
                        ),
                      ),
                    ),
                    Text("Must be at least 8 characters\nin length",
                        textAlign: TextAlign.left,
                        style: GoogleFonts.blinker(
                          fontSize: 15,
                        )),
                  ],
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.01,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                        right: MediaQuery.of(context).size.width * 0.025,
                      ),
                      child: Container(
                        height: MediaQuery.of(context).size.height * 0.05,
                        width: MediaQuery.of(context).size.width * 0.025,
                        decoration: const BoxDecoration(
                          color: AppColor.kprimary,
                          shape: BoxShape.circle,
                        ),
                      ),
                    ),
                    Text("should contain at least one\nupper case",
                        textAlign: TextAlign.left,
                        style: GoogleFonts.blinker(
                          fontSize: 15,
                        )),
                  ],
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.01,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                        right: MediaQuery.of(context).size.width * 0.025,
                      ),
                      child: Container(
                        height: MediaQuery.of(context).size.height * 0.05,
                        width: MediaQuery.of(context).size.width * 0.025,
                        decoration: const BoxDecoration(
                          color: AppColor.kprimary,
                          shape: BoxShape.circle,
                        ),
                      ),
                    ),
                    Text("should contain at least one\nlower case",
                        textAlign: TextAlign.left,
                        style: GoogleFonts.blinker(
                          fontSize: 15,
                        )),
                  ],
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.01,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                        right: MediaQuery.of(context).size.width * 0.025,
                      ),
                      child: Container(
                        height: MediaQuery.of(context).size.height * 0.05,
                        width: MediaQuery.of(context).size.width * 0.025,
                        decoration: const BoxDecoration(
                          color: AppColor.kprimary,
                          shape: BoxShape.circle,
                        ),
                      ),
                    ),
                    Text("should contain at least one digit",
                        textAlign: TextAlign.left,
                        style: GoogleFonts.blinker(
                          fontSize: 15,
                        )),
                  ],
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.01,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                        right: MediaQuery.of(context).size.width * 0.025,
                      ),
                      child: Container(
                        height: MediaQuery.of(context).size.height * 0.05,
                        width: MediaQuery.of(context).size.width * 0.025,
                        decoration: const BoxDecoration(
                          color: AppColor.kprimary,
                          shape: BoxShape.circle,
                        ),
                      ),
                    ),
                    Text("should contain at least one\nSpecial character",
                        textAlign: TextAlign.left,
                        style: GoogleFonts.blinker(
                          fontSize: 15,
                        )),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  static logOutyescancelDialog(
      BuildContext context, String title, String content) {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            actionsAlignment: MainAxisAlignment.end,
            // icon:const CircleAvatar(
            //   backgroundImage: NetworkImage(
            //     AppUrls.user,
            //   ),
            // ),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            title: Text(
              title,
              style: GoogleFonts.inter(
                fontSize: 20.0,
                fontWeight: FontWeight.w600,
              ),
            ),
            content: Text(
              content,
              style: GoogleFonts.inter(
                fontSize: 15.0,
              ),
            ),
            actions: [
              TextButton(
                onPressed: () async {
                  SharedPreferences prefs =
                      await SharedPreferences.getInstance();
                  prefs.remove("logintoken");
                  Get.off(() => const LoginScreen());
                },
                child: const Text(
                  'Yes',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: AppColor.grey,
                  ),
                ),
              ),
              TextButton(
                onPressed: () {
                  Get.back();
                },
                child: const Text(
                  'Cancel',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: AppColor.grey,
                  ),
                ),
              )
            ],
          );
        });
  }
}
