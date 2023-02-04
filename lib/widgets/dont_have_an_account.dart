
import 'package:church/values/values.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../screens/Register.dart';

class DontHaveAnAccount extends StatelessWidget {
  const DontHaveAnAccount({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
         Text('Dont have an account? ',
            style: GoogleFonts.blinker(
              color: AppColor.grey600,
              fontSize: 15,
              fontWeight: FontWeight.w500,
            ),),
        TextButton(
          onPressed: () {
            // Get.off(() => const Register(),
            //     transition: Transition.cupertino);
          },
          child: Text(
            'Register',
            style: GoogleFonts.blinker(
              color: AppColor.kprimary,
              fontSize: 15,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ],
    );
  }
}
