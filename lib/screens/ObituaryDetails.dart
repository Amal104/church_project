import 'package:cached_network_image/cached_network_image.dart';
import 'package:church/Extensions/StringExtension.dart';
import 'package:church/Model/ObicturyModel.dart';
import 'package:church/values/AppBar.dart';
import 'package:church/values/Text.dart';
import 'package:church/values/values.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class ObituaryDetails extends StatelessWidget {
  const ObituaryDetails({
    super.key,
    required this.name,
    required this.description,
    required this.date,
    required this.image, required this.item,
  });

  final String name;
  final String description;
  final String date;
  final String image;
  final ObituaryModel item;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: AppColor.solidWhite,
      appBar: CustomAppBar.customAppBarIcon(),
      body: Padding(
        padding: EdgeInsets.fromLTRB(
            size.width * 0.04, 0, size.width * 0.04, size.height * 0.05),
        child: Card(
          color: AppColor.lightGreyShade,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          child: Column(
            children: [
              Hero(
                tag: item,
                child: ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topRight: Radius.circular(20),
                    topLeft: Radius.circular(20),
                  ),
                  child: CachedNetworkImage(
                    imageUrl: image,
                    width: size.width,
                    height: size.height * 0.3,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(
                height: size.height * 0.02,
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: size.width * 0.05,
                ),
                child: Column(
                  children: [
                    Text(
                      name.toTitleCase(),
                      style: CustomText.boldTextRegular(),
                    ),
                    SizedBox(
                      height: size.height * 0.01,
                    ),
                    Text(
                      date,
                      style: CustomText.boldTextSmall(),
                    ),
                    SizedBox(
                      height: size.height * 0.01,
                    ),
                    Text( 
                      description,
                      textAlign: TextAlign.justify,
                      maxLines: 14,
                      style: CustomText.textSmall(),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
