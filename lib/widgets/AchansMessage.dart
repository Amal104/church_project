import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../values/Strings.dart';
import '../values/values.dart';
import 'AsiVicarMessage.dart';
import 'VicarMessage.dart';

class AchensMessage extends StatelessWidget {
  const AchensMessage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(20),
          width: MediaQuery.of(context).size.width / 1.1,
          decoration: const BoxDecoration(
            color: AppColor.lightGreyShade,
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(50),
              bottomRight: Radius.circular(50),
              topRight: Radius.circular(50),
            ),
          ),
          child: const VicarMessage(),
        ),
        const SizedBox(
          height: 20,
        ),
        Container(
          padding: const EdgeInsets.all(20),
          width: MediaQuery.of(context).size.width / 1.1,
          decoration: const BoxDecoration(
            color: AppColor.purpleShadeWithOpec,
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(50),
              bottomRight: Radius.circular(50),
              topLeft: Radius.circular(50),
            ),
          ),
          child: const AsiVicarMessage(),
        ),
      ],
    );
  }
}

