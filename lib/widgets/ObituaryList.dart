import 'package:cached_network_image/cached_network_image.dart';
import 'package:church/Extensions/StringExtension.dart';
import 'package:church/screens/ObituaryDetails.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import '../provider/ObicturyProvider.dart';
import '../values/values.dart';

class ObituaryList extends StatelessWidget {
  const ObituaryList({
    super.key,
    required this.getobituary,
    required this.size,
  });

  final ObicturyProvider getobituary;
  final Size size;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: getobituary.obictury?.length,
      itemBuilder: (context, index) {
        final obituary = getobituary.obictury![index];
        final formattedDate = DateFormat("dd-MM-yyyy").format(obituary.date);
        return Padding(
          padding: EdgeInsets.symmetric(
            horizontal: size.width * 0.03,
            vertical: size.height * 0.003,
          ),
          child: Card(
            color: AppColor.lightGreyShade,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            child: ListTile(
              onTap: () => Get.to(
                () => ObituaryDetails(
                  name: obituary.member,
                  description: obituary.description,
                  date: formattedDate,
                  image: obituary.memeberPhoto,
                  item: obituary,
                ),
                // transition: Transition.rightToLeft,
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              tileColor: AppColor.lightGreyShade,
              contentPadding: EdgeInsets.symmetric(
                vertical: size.height * 0.004,
                horizontal: size.width * 0.02,
              ),
              leading: Hero(
                tag: obituary,
                child: CircleAvatar(
                  radius: size.height * 0.04,
                  backgroundImage: CachedNetworkImageProvider(
                    obituary.memeberPhoto,
                  ),
                ),
              ),
              title: Text(
                obituary.member.toTitleCase(),
              ),
              subtitle: Text(formattedDate),
              trailing: const FaIcon(FontAwesomeIcons.chevronRight),
            ),
          ),
        );
      },
    );
  }
}
