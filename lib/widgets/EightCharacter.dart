import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../values/values.dart';

class EightCharacter extends StatelessWidget {
  const EightCharacter({
    Key? key,
    required this.width,
    required this.height,
    required this.provider,
  }) : super(key: key);

  final double width;
  final double height;
  final provider;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: EdgeInsets.only(left: width * 0.10),
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            width: width * 0.05,
            height: height * 0.025,
            decoration: BoxDecoration(
                color: provider.ispasswordEightcharacter
                    ? AppColor.kprimary
                    : Colors.transparent,
                border: provider.ispasswordEightcharacter
                    ? Border.all(color: AppColor.kprimary)
                    : Border.all(color: AppColor.kprimary),
                borderRadius: BorderRadius.circular(50)),
            child: Center(
                child: Icon(
              Icons.check,
              size: 15,
              color: Colors.grey[200],
            )),
          ),
        ),
        SizedBox(width: width * 0.02),
        Text("8 Character",
            style: GoogleFonts.blinker(
              fontSize: 15,
            )),
      ],
    );
  }
}
