import 'package:church/values/AppBar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../provider/ChangePassword.dart';
import '../values/AppTitle.dart';
import '../values/values.dart';

class ChangePasswordScreen extends StatefulWidget {
  const ChangePasswordScreen({super.key});

  @override
  State<ChangePasswordScreen> createState() => _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends State<ChangePasswordScreen> {
  bool _isvisible = false;

  bool _isvisible1 = false;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: AppColor.solidWhite,
      appBar: CustomAppBar.customAppBarIcon(),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Consumer<ChangePasswordProvider>(
            builder: (context, provider, child) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: MediaQuery.of(context).size.width / 20,
                      ),
                      child: const AppTitle(title: "Change Password")),
                  SizedBox(
                    height: size.height * 0.02,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: size.width / 20,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: size.height * 0.05,
                        ),
                        Container(
                          decoration: BoxDecoration(
                            color: AppColor.lightGreyShade,
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: TextFormField(
                            controller: provider.oldPasswordController,
                            obscureText: !_isvisible,
                            keyboardType: TextInputType.text,
                            decoration: InputDecoration(
                                prefixIcon: const Icon(
                                  Icons.password_outlined,
                                  size: 20,
                                ),
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
                                border: InputBorder.none,
                                hintText: "Old Password",
                                hintStyle: GoogleFonts.inter(fontSize: 14),
                                contentPadding: EdgeInsets.symmetric(
                                  horizontal: size.width * 0.05,
                                  vertical: size.height * 0.02,
                                )),
                          ),
                        ),
                        SizedBox(
                          height: size.height * 0.015,
                        ),
                        Container(
                          decoration: BoxDecoration(
                            color: AppColor.lightGreyShade,
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: TextFormField(
                            controller: provider.newPasswordController,
                            keyboardType: TextInputType.text,
                            obscureText: !_isvisible1,
                            decoration: InputDecoration(
                                suffixIcon: IconButton(
                                    onPressed: () {
                                      setState(() {
                                        _isvisible1 = !_isvisible1;
                                      });
                                    },
                                    icon: _isvisible1
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
                                border: InputBorder.none,
                                prefixIcon: const Icon(
                                  Icons.password_outlined,
                                  size: 20,
                                ),
                                hintText: "New Password",
                                hintStyle: GoogleFonts.inter(fontSize: 14),
                                contentPadding: EdgeInsets.symmetric(
                                  horizontal: size.width * 0.05,
                                  vertical: size.height * 0.02,
                                )),
                          ),
                        ),
                        SizedBox(
                          height: size.height * 0.03,
                        ),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor: AppColor.purpleShade,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10))),
                          onPressed: () {
                            provider.changePassword(context);
                          },
                          child: Text(
                            "change password",
                            style: GoogleFonts.inter(),
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: size.height * 0.06,
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
