
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../provider/VicarMessageProvider.dart';
import '../values/Strings.dart';
import '../values/urls.dart';
import '../values/values.dart';

class AsiVicarMessage extends StatefulWidget {
  const AsiVicarMessage({
    Key? key,
  }) : super(key: key);

  @override
  State<AsiVicarMessage> createState() => _AsiVicarMessageState();
}

class _AsiVicarMessageState extends State<AsiVicarMessage> {

  @override
  void initState() {
    super.initState();
    final asivicar = Provider.of<VicarMessageProvider>(context, listen: false);
    asivicar.getVicarMessage();
  }

  @override
  Widget build(BuildContext context) {
    final asivicar = Provider.of<VicarMessageProvider>(context);
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            CachedNetworkImage(
              imageUrl: asivicar.vicar?.asstVicar.photo ?? "",
              imageBuilder: (context, imageProvider) => Container(
                width: width * 0.19,
                height: height * 0.1,
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
                  asivicar.vicar?.asstVicar.name ?? "",
                  style: GoogleFonts.inter(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                    color: AppColor.darkPinkShade,
                    letterSpacing: 2.0,
                  ),
                ),
                Text(
                  "Assi Vicar",
                  style: GoogleFonts.inter(
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
         Text(
          asivicar.vicar?.asstVicar.message ?? "",
          style: const TextStyle(
            fontSize: 17.0,
          ),
        ),
      ],
    );
  }
}
