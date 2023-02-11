import 'dart:ui';

import 'package:church/values/values.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomText {

  static boldTextLarge() => GoogleFonts.inter(
        fontSize: 20.0,
        fontWeight: FontWeight.bold,
        color: AppColor.solidBlack,
      );

  static boldTextRegular() => GoogleFonts.inter(
        fontSize: 18.0,
        fontWeight: FontWeight.w600,
        color: AppColor.solidBlack,
      );

      static boldTextSmall() => GoogleFonts.inter(
        fontSize: 15.0,
        fontWeight: FontWeight.w400,
        color: AppColor.solidBlack,
      );

      static textSmall() => GoogleFonts.inter(
        fontSize: 14.0,
        // fontWeight: FontWeight.w400,
        height: 1.5,
        color: AppColor.solidBlack,
      );
}
