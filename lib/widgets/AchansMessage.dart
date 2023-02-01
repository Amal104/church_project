import 'package:church/provider/VicarMessageProvider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
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
            color: AppColor.purpleShadeWithOpec,
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(40),
              bottomRight: Radius.circular(40),
              topRight: Radius.circular(40),
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
            color: AppColor.lightPinkShade,
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(40),
              bottomRight: Radius.circular(40),
              topLeft: Radius.circular(40),
            ),
          ),
          child: const AsiVicarMessage(),
        ),
      ],
    );
  }
}

