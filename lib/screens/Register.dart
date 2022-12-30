import 'package:church/components/AltertDialogue.dart';
import 'package:church/screens/LoginScreen.dart';
import 'package:church/values/values.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../provider/LoginProvider.dart';
import '../widgets/EightCharacter.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  // final formKey = GlobalKey<FormState>();
  // bool _isvisible = false;
  // bool _isvisible2 = false;
  // final _usernameConroller = TextEditingController();
  // final _emailConroller = TextEditingController();
  // final _passwordConroller = TextEditingController();
  // bool _ispasswordEightcharacter = false;
  // bool _haspasswordOnenumber = false;
  // onPasswordChanged(String password) {
  //   setState(() {
  //     final numericRegx = RegExp(r'[0-9]');

  //     _ispasswordEightcharacter = false;
  //     if (password.length >= 8) {
  //       _ispasswordEightcharacter = true;

  //       _haspasswordOnenumber = false;
  //       if (numericRegx.hasMatch(password)) {
  //         _haspasswordOnenumber = true;
  //       }
  //     }
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(clipBehavior: Clip.none, children: [
          ClipRRect(
            borderRadius: const BorderRadius.only(
                // bottomLeft: Radius.circular(30),
                bottomRight: Radius.circular(150)),
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
              padding: EdgeInsets.only(top: height / 4),
              child: Align(
                alignment: Alignment.center,
                child: Consumer<LoginProvider>(
                  builder: (context, provider, child) {
                    return Container(
                      height: height / 1.5,
                      width: width / 1.2,
                      decoration: BoxDecoration(
                          color: AppColor.grey100,
                          borderRadius: BorderRadius.circular(40),
                          boxShadow: const [
                            Shadows.containerShadow,
                          ]),
                      child: Form(
                        key: provider.formKey,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Register',
                              style: GoogleFonts.blinker(
                                fontSize: 25,
                                fontWeight: FontWeight.bold,
                                color: AppColor.kprimary,
                                letterSpacing: 1.5,
                              ),
                            ),
                            SizedBox(
                              height: height * 0.04,
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: width * 0.10),
                              child: TextFormField(
                                controller: provider.usernameConroller,
                                keyboardType: TextInputType.text,
                                decoration: InputDecoration(
                                  border: const OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10)),
                                  ),
                                  prefixIcon: const Icon(
                                    Icons.phone,
                                    size: 20,
                                    color: AppColor.kprimary,
                                  ),
                                  label: Text("Phone",
                                      style: GoogleFonts.blinker(
                                        fontSize: 15,
                                      )),
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(
                                horizontal: width * 0.10,
                                vertical: height * 0.01,
                              ),
                              child: TextFormField(
                                controller: provider.emailConroller,
                                validator: (value) =>
                                    provider.emailValidate(value),
                                keyboardType: TextInputType.text,
                                decoration: InputDecoration(
                                  border: const OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10)),
                                  ),
                                  prefixIcon: const Icon(
                                    Icons.email,
                                    size: 20,
                                    color: AppColor.kprimary,
                                  ),
                                  label: Text("email",
                                      style: GoogleFonts.blinker(
                                        fontSize: 15,
                                      )),
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(
                                horizontal: width * 0.10,
                              ),
                              child: TextFormField(
                                validator: (value) =>
                                    provider.validatePassword(value),
                                onChanged: (password) =>
                                    provider.onPasswordChanged(password),
                                obscureText: provider.isvisible == false,
                                keyboardType: TextInputType.text,
                                decoration: InputDecoration(
                                  suffixIcon: IconButton(
                                      onPressed: () {
                                        setState(() {
                                          provider.isvisible =
                                              provider.isvisible == false;
                                        });
                                      },
                                      icon: provider.isvisible
                                          ? const Icon(
                                              Icons.visibility,
                                              size: 20,
                                              color: AppColor.purpleShade,
                                            )
                                          : const Icon(
                                              Icons.visibility_off,
                                              size: 20,
                                              color: AppColor.solidBlack,
                                            )),
                                  border: const OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(10))),
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
                              height: height * 0.02,
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: width * 0.10),
                              child: Align(
                                  alignment: Alignment.centerLeft,
                                  child: GestureDetector(
                                    onTap: () {
                                      CustomAlertDialog.passwordReqDialogue(context);
                                    },
                                    child: Text("*Password Requirement",
                                        style: GoogleFonts.blinker(
                                          fontSize: 15,
                                        )),
                                  )),
                            ),
                            // Row(
                            //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            //   children: [
                            //     EightCharacter(width: width, height: height, provider: provider),
                            //     Row(
                            //       children: [
                            //         AnimatedContainer(
                            //           duration:
                            //               const Duration(milliseconds: 200),
                            //           width: width * 0.05,
                            //           height: height * 0.025,
                            //           decoration: BoxDecoration(
                            //               color:
                            //                   provider.haspasswordOneUppercase
                            //                       ? AppColor.kprimary
                            //                       : Colors.transparent,
                            //               border: provider
                            //                       .haspasswordOneUppercase
                            //                   ? Border.all(
                            //                       color: AppColor.kprimary)
                            //                   : Border.all(
                            //                       color: AppColor.kprimary),
                            //               borderRadius:
                            //                   BorderRadius.circular(50)),
                            //           child: Center(
                            //               child: Icon(
                            //             Icons.check,
                            //             size: 15,
                            //             color: Colors.grey[200],
                            //           )),
                            //         ),
                            //         SizedBox(width: width * 0.02),
                            //         Text("1 Upper Case",
                            //           style: GoogleFonts.blinker(
                            //             fontSize: 15,
                            //           )),
                            //         SizedBox(width: width * 0.11),
                            //       ],
                            //     ),
                            //   ],
                            // ),
                            // const SizedBox(height: 10),
                            // Row(
                            //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            //   children: [
                            //     Row(
                            //       children: [
                            //         Padding(
                            //           padding: EdgeInsets.only(left: width * 0.10),
                            //           child: AnimatedContainer(
                            //             duration:
                            //                 const Duration(milliseconds: 200),
                            //             width: width * 0.05,
                            //             height: height * 0.025,
                            //             decoration: BoxDecoration(
                            //                 color: provider.haspasswordOnenumber
                            //                     ? AppColor.kprimary
                            //                     : Colors.transparent,
                            //                 border: provider
                            //                         .haspasswordOnenumber
                            //                     ? Border.all(
                            //                         color: AppColor.kprimary)
                            //                     : Border.all(
                            //                         color: AppColor.kprimary),
                            //                 borderRadius:
                            //                     BorderRadius.circular(50)),
                            //             child: Center(
                            //                 child: Icon(
                            //               Icons.check,
                            //               size: 15,
                            //               color: Colors.grey[200],
                            //             )),
                            //           ),
                            //         ),
                            //         SizedBox(width: width * 0.02),
                            //         Text("1 Digit",
                            //           style: GoogleFonts.blinker(
                            //             fontSize: 15,
                            //           )),
                            //       ],
                            //     ),
                            //     Row(
                            //       children: [
                            //         Padding(
                            //           padding:
                            //               EdgeInsets.only(left: width * 0.10),
                            //           child: AnimatedContainer(
                            //             duration:
                            //                 const Duration(milliseconds: 200),
                            //             width: width * 0.05,
                            //             height: height * 0.025,
                            //             decoration: BoxDecoration(
                            //                 color: provider
                            //                         .haspasswordOneSpecialcharacter
                            //                     ? AppColor.kprimary
                            //                     : Colors.transparent,
                            //                 border: provider
                            //                         .haspasswordOneSpecialcharacter
                            //                     ? Border.all(
                            //                         color: AppColor.kprimary)
                            //                     : Border.all(
                            //                         color: AppColor.kprimary),
                            //                 borderRadius:
                            //                     BorderRadius.circular(50)),
                            //             child: Center(
                            //                 child: Icon(
                            //               Icons.check,
                            //               size: 15,
                            //               color: Colors.grey[200],
                            //             )),
                            //           ),
                            //         ),
                            //         SizedBox(width: width * 0.02),
                            //         Text("1 Special char",
                            //           style: GoogleFonts.blinker(
                            //             fontSize: 15,
                            //           )),
                            //         SizedBox(width: width * 0.10),
                            //       ],
                            //     ),
                            //   ],
                            // ),
                            SizedBox(height: height * 0.025),
                            ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    backgroundColor: AppColor.kprimary),
                                onPressed: () {
                                  provider.onRegister();
                                },
                                child: Text('Register',
                                    style: GoogleFonts.blinker(
                                      color: AppColor.solidWhite,
                                    ))),
                            const SizedBox(
                              height: 15,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Already have an account? ',
                                  style: GoogleFonts.blinker(
                                    color: AppColor.grey600,
                                    fontSize: 15,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                const SizedBox(
                                  width: 8.0,
                                ),
                                GestureDetector(
                                  onTap: () {
                                    Get.off(
                                      () => const LoginScreen(),
                                      transition: Transition.cupertino,
                                    );
                                  },
                                  child: Text(
                                    'Login',
                                    style: GoogleFonts.blinker(
                                      color: AppColor.kprimary,
                                      fontSize: 15,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              )),
        ]),
      ),
    );
  }
}
