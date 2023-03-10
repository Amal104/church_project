import 'package:cached_network_image/cached_network_image.dart';
import 'package:church/Extensions/StringExtension.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import '../provider/VicarMessageProvider.dart';
import '../values/Strings.dart';
import '../values/urls.dart';
import '../values/values.dart';

class VicarMessage extends StatefulWidget {
  const VicarMessage({
    Key? key,
  }) : super(key: key);

  @override
  State<VicarMessage> createState() => _VicarMessageState();
}

class _VicarMessageState extends State<VicarMessage> {
  @override
  void initState() {
    super.initState();
    final postModel = Provider.of<VicarMessageProvider>(context, listen: false);
    postModel.getVicarMessage();
  }

  @override
  Widget build(BuildContext context) {
    final postModel = Provider.of<VicarMessageProvider>(context);
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                CachedNetworkImage(
                  imageUrl: postModel.vicar?.vicar.photo ?? "",
                  imageBuilder: (context, imageProvider) => Container(
                    width: width * 0.19,
                    height: height * 0.1,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                          image: imageProvider, fit: BoxFit.cover),
                    ),
                  ),
                  placeholder: (context, url) =>
                      const CircularProgressIndicator(),
                  errorWidget: (context, url, error) => const Icon(
                    Icons.error_outline,
                    size: 50,
                  ),
                ),
                SizedBox(
                  width: width * 0.02,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      postModel.vicar?.vicar.name.toCapitalized() ?? "",
                      style: GoogleFonts.inter(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                        color: AppColor.darkpurpleShadev2,
                        letterSpacing: 2.0,
                      ),
                    ),
                    Text(
                      "Vicar",
                      style: GoogleFonts.inter(
                        fontSize: 12.0,
                        fontWeight: FontWeight.w600,
                        color: AppColor.grey600,
                        letterSpacing: 1.0,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const FaIcon(FontAwesomeIcons.chevronRight)
          ],
        ),
         SizedBox(
          height: height * 0.02,
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            SizedBox(
              width: width*0.66,
              child: Text(
                postModel.vicar?.vicar.message ?? "",maxLines: 5,
                style: GoogleFonts.inter(
                          fontSize: 15.0,
                          fontWeight: FontWeight.w600,
                          color: AppColor.grey600,
                        ),
              ),
            ),
            const Text(".....")
          ],
        ),
      ],
    );
  }
}
