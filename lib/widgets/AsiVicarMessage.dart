
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../values/Strings.dart';
import '../values/urls.dart';
import '../values/values.dart';

class AsiVicarMessage extends StatelessWidget {
  const AsiVicarMessage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            CachedNetworkImage(
              imageUrl: AppUrls.asiVicar,
              imageBuilder: (context, imageProvider) => Container(
                width: width * 0.15,
                height: height * 0.10,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image:
                      DecorationImage(image: imageProvider, fit: BoxFit.cover),
                ),
              ),
              placeholder: (context, url) => const CircularProgressIndicator(),
              errorWidget: (context, url, error) => const Icon(
                    Icons.error_outline,size: 50,
                  ),
            ),
            const SizedBox(
              width: 10.0,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Joyal Achan",
                  style: GoogleFonts.blinker(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                    color: AppColor.grey800,
                    letterSpacing: 2.0,
                  ),
                ),
                Text(
                  "Assi Vicar",
                  style: GoogleFonts.blinker(
                    fontSize: 15.0,
                    fontWeight: FontWeight.bold,
                    color: AppColor.grey600,
                    letterSpacing: 2.0,
                  ),
                ),
              ],
            )
          ],
        ),
        const SizedBox(
          height: 10,
        ),
        const Text(
          AppStrings.achansMessage,
          style: TextStyle(
            fontSize: 17.0,
          ),
          maxLines: 3,
        ),
      ],
    );
  }
}