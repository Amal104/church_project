import 'package:church/values/values.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class UsernameField extends StatelessWidget {
  const UsernameField({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width *0.10),
      child: TextFormField(
        keyboardType: TextInputType.text,
        decoration: InputDecoration(
          border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
          prefixIcon: const Icon(
            Icons.email,
            size: 20,
            color: AppColor.kprimary,
          ),
          label: Text("email",
              style: GoogleFonts.blinker(
                color: AppColor.kprimary,
                fontSize: 15,
              )),
        ),
      ),
    );
  }
}
