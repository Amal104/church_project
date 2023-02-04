import 'dart:async';
import 'package:church/screens/HomePage.dart';
import 'package:church/screens/LoginScreen.dart';
import 'package:church/values/Strings.dart';
import 'package:church/values/values.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

// final storage = FlutterSecureStorage();

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    tokencheck();
    super.initState();
  }

  tokencheck() async {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      final token = prefs.getString("logintoken");
      if (token != null) {
        Timer(const Duration(seconds: 4), (() {
          Get.off(
            () => const HomePage(),
            transition: Transition.upToDown,
          );
        }));
      }else{
        Timer(const Duration(seconds: 4), (() {
          Get.off(
            () => const LoginScreen(),
            transition: Transition.upToDown,
          );
        }));
      }
    }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Stack(
        children: [
          LottieBuilder.asset(
            'assets/splash/purple_splash.json',
            fit: BoxFit.cover,
            height: height,
            width: width,
          ),
          Center(
            child: Text(
              AppStrings.churchName,
              textAlign: TextAlign.center,
              style: GoogleFonts.poppins(
                fontSize: 25.0,
                fontWeight: FontWeight.w700,
                color: AppColor.solidWhite,
                // letterSpacing: 2.0,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
