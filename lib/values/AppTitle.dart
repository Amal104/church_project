import 'package:church/values/values.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTitle extends StatelessWidget {
  const AppTitle({
    super.key, required this.title,
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: GoogleFonts.inter(
        fontSize: 22.0,
        fontWeight: FontWeight.bold,
        color: AppColor.grey600,
        letterSpacing: 1.0,
      ),
    );
  }
}
