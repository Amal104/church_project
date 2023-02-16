import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:google_fonts/google_fonts.dart';

import '../values/AppBar.dart';
import '../values/values.dart';

class WorshipTimeScreen extends StatelessWidget {
  const WorshipTimeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // final getobituary = Provider.of<ObicturyProvider>(context);
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: CustomAppBar.customAppBarIcon(),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: MediaQuery.of(context).size.width / 25,
                ),
                child: Text(
                  "Worship Time",
                  style: GoogleFonts.inter(
                    fontSize: 25.0,
                    fontWeight: FontWeight.bold,
                    color: AppColor.grey600,
                    letterSpacing: 1.0,
                  ),
                ),
              ),
              SizedBox(
                height: size.height * 0.02,
              ),
              
            ],
          ),
        ),
      ),
    );
  }
}