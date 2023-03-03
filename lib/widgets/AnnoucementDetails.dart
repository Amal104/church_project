import 'package:church/Model/AnnoucementModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';

import '../values/AppBar.dart';
import '../values/AppTitle.dart';
import '../values/values.dart';

class AnnoucementDetails extends StatelessWidget {
  const AnnoucementDetails(
      {super.key, required this.title, required this.body, required this.item});

  final String title;
  final String body;
  final AnnouncementModel item;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: AppColor.solidWhite,
      appBar: CustomAppBar.customAppBarIcon(),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: MediaQuery.of(context).size.width / 20,
                  ),
                  child: const AppTitle(title: "Annoucement")),
              SizedBox(
                height: size.height * 0.05,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal:size.width * 0.05 ),
                child: Column(
                  children: [
                    Text(title),
                    SizedBox(
                      height: size.height * 0.04,
                    ),
                    Text(body,textAlign: TextAlign.justify,),
                  ],
                ),
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
