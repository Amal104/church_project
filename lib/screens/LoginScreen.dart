import 'package:church/screens/HomePage.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../values/values.dart';
import '../widgets/LoginIcons.dart';
import '../widgets/UsernameField.dart';
import '../widgets/dont_have_an_account.dart';
import 'package:get/get.dart';

import 'MainPage.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _isvisible = false;
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Stack(clipBehavior: Clip.none, children: [
          ClipRRect(
            borderRadius:
                const BorderRadius.only(bottomRight: Radius.circular(150)),
            child: Image.asset(
              'assets/person-praying.png',
              height: height / 2.5,
              width: width,
              fit: BoxFit.cover,
            ),
          ),
          Container(
            height: height / 2.5,
            width: width,
            decoration: const BoxDecoration(
              color: AppColor.purpleShadeWithOpec,
              borderRadius: BorderRadius.only(
                  // bottomLeft: Radius.circular(30),
                  bottomRight: Radius.circular(150)),
            ),
          ),
          Padding(
            padding:
                EdgeInsets.only(top: height / 4),
            child: Center(
              child: Container(
                height: height / 1.5,
                width: width / 1.2,
                decoration: BoxDecoration(
                    color: AppColor.grey100,
                    borderRadius: BorderRadius.circular(40),
                    boxShadow: const [
                      Shadows.containerShadow,
                    ]),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Login',
                      style: GoogleFonts.blinker(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: AppColor.kprimary,
                        letterSpacing: 1.5,
                      ),
                    ),
                    SizedBox(
                      height: height * 0.05,
                    ),
                    const UsernameField(),
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: width * 0.10,
                          vertical: height * 0.01),
                      child: TextFormField(
                        obscureText: !_isvisible,
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                          suffixIcon: IconButton(
                              onPressed: () {
                                setState(() {
                                  _isvisible = !_isvisible;
                                });
                              },
                              icon: _isvisible
                                  ? const Icon(
                                      Icons.visibility,
                                      color: AppColor.purpleShade,
                                      size: 20,
                                    )
                                  : const Icon(
                                      Icons.visibility_off,
                                      size: 20,
                                      color: AppColor.solidBlack,
                                    )),
                          border: const OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10))),
                          prefixIcon: const Icon(
                            Icons.password,
                            size: 20,
                            color: AppColor.kprimary,
                          ),
                          label: Text("password",
                              style: GoogleFonts.blinker(
                                fontSize: 15,
                              )),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: height * 0.01,
                    ),
                    ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: AppColor.kprimary),
                        onPressed: () {
                          Get.off(
                            () => const HomePage(),
                            transition: Transition.cupertino,
                          );
                        },
                        child: Text('Login',
                            style: GoogleFonts.blinker(
                              color: AppColor.solidWhite,
                              fontSize: 15,
                              fontWeight: FontWeight.w500,
                            ))),
                    const DontHaveAnAccount(),
                    Text('OR',
                        style: GoogleFonts.blinker(
                          color: AppColor.grey600,
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                        )),
                    SizedBox(
                      height: height * 0.02,
                    ),
                    const LoginIcons()
                  ],
                ),
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
