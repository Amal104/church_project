
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../values/values.dart';

class LoginIcons extends StatelessWidget {
  const LoginIcons({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton(
          onPressed: () {},
          icon: const FaIcon(FontAwesomeIcons.facebookF,
              color: AppColor.grey600),
          iconSize: 20,
        ),
        IconButton(
          onPressed: () {},
          icon: const FaIcon(FontAwesomeIcons.google,
              color: AppColor.grey600),
          iconSize: 20,
        ),
        IconButton(
          onPressed: () {},
          icon: const FaIcon(FontAwesomeIcons.twitter,
              color: AppColor.grey600),
          iconSize: 20,
        ),
      ],
    );
  }
}
