import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import '../provider/HomePage_Provider.dart';
import '../provider/VicarMessageProvider.dart';
import '../values/values.dart';
import '../widgets/AchansMessage.dart';
import 'package:get/get.dart';

class VicarsMessage extends StatefulWidget {
  const VicarsMessage({super.key});

  @override
  State<VicarsMessage> createState() => _VicarsMessageState();
}

class _VicarsMessageState extends State<VicarsMessage> {
  @override
  void initState() {
    super.initState();
    final asivicar = Provider.of<VicarMessageProvider>(context, listen: false);
    asivicar.getAsiVicarMessage();
    final postModel = Provider.of<VicarMessageProvider>(context, listen: false);
    postModel.getVicarMessage();
  }

  @override
  Widget build(BuildContext context) {
    final asivicar = Provider.of<VicarMessageProvider>(context);
    final postModel = Provider.of<VicarMessageProvider>(context);
    return Scaffold(
      backgroundColor: AppColor.lightGreyShade,
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
              if (asivicar.asivicar != null || postModel.vicar != null)
                Column(
                  children: const [
                    SizedBox(
                      height: 25.0,
                    ),
                    Center(
                      child: AchensMessage(),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                      height: 80.0,
                    ),
                  ],
                ),
              if (asivicar.asivicar == null || postModel.vicar == null)
                Image.asset(
                  "assets/404error.jpg",
                  height: 550,
                ),
            ],
          ),
        ),
      ),
    );
  }
}
