import 'package:cached_network_image/cached_network_image.dart';
import 'package:church/provider/ObicturyProvider.dart';
import 'package:church/values/AppBar.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import '../Model/ObicturyModel.dart';
import '../Services/ObicturyServices.dart';
import '../values/values.dart';
import 'package:intl/intl.dart';

import '../widgets/ObituaryList.dart';

class ObicturyPage extends StatefulWidget {
  const ObicturyPage({super.key});

  @override
  State<ObicturyPage> createState() => _ObicturyPageState();
}

class _ObicturyPageState extends State<ObicturyPage> {
  @override
  void initState() {
    super.initState();
    final obituary = Provider.of<ObicturyProvider>(context, listen: false);
    obituary.getObituary();
  }

  @override
  Widget build(BuildContext context) {
    final getobituary = Provider.of<ObicturyProvider>(context);
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
                  "Obituary",
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
              if (getobituary.obictury?.length != null)
                ObituaryList(
                  getobituary: getobituary,
                  size: size,
                ),
              SizedBox(
                height: size.height * 0.06,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
