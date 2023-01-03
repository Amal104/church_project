import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import '../provider/HomePage_Provider.dart';
import '../values/values.dart';
import '../widgets/AchansMessage.dart';
import 'package:get/get.dart';

class VicarsMessage extends StatelessWidget {
  const VicarsMessage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              IconButton(
                  onPressed: () {
                    Get.back();
                  },
                  icon: const FaIcon(
                    FontAwesomeIcons.chevronLeft,
                    color: AppColor.grey400,
                  )),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: MediaQuery.of(context).size.width / 25,
                ),
                child: Text(
                  "Vicar's\nMessage...",
                  style: GoogleFonts.inter(
                    fontSize: 25.0,
                    fontWeight: FontWeight.bold,
                    color: AppColor.grey600,
                    letterSpacing: 1.0,
                  ),
                ),
              ),
              const SizedBox(
                height: 25.0,
              ),
              const Center(
                child: AchensMessage(),
              ),
              const SizedBox(
                height: 20,
              ),
              const SizedBox(
                height: 80.0,
              )
            ],
          ),
        ),
      ),
    );
  }
}
