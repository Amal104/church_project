import 'package:church/values/AppTitle.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import '../provider/HomePage_Provider.dart';
import '../provider/VicarMessageProvider.dart';
import '../values/AppBar.dart';
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
    // final asivicar = Provider.of<VicarMessageProvider>(context, listen: false);
    // asivicar.getAsiVicarMessage();
    final postModel = Provider.of<VicarMessageProvider>(context, listen: false);
    postModel.getVicarMessage();
  }

  @override
  Widget build(BuildContext context) {
    // final asivicar = Provider.of<VicarMessageProvider>(context);
    var size = MediaQuery.of(context).size;
    final postModel = Provider.of<VicarMessageProvider>(context);
    return Scaffold(
      backgroundColor: AppColor.solidWhite,
      appBar: CustomAppBar.customAppBarIcon(),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: MediaQuery.of(context).size.width / 20,
                ),
                child: const AppTitle(title: "Church\nHistory")
              ),
              if (postModel.vicar?.asstVicar != null || postModel.vicar?.vicar != null)
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
              if (postModel.vicar?.asstVicar == null || postModel.vicar?.vicar == null)
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
