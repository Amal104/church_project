import 'package:church/values/urls.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:cached_network_image/cached_network_image.dart';
import '../values/Strings.dart';
import '../values/values.dart';

class HomePageAppbar extends StatelessWidget {
  const HomePageAppbar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      backgroundColor: AppColor.solidWhite,
      elevation: 0.0,
      centerTitle: true,
      expandedHeight: 300.0,
      pinned: true,
      flexibleSpace: FlexibleSpaceBar(
        expandedTitleScale: 1.6,
        background: DecoratedBox(
          position: DecorationPosition.foreground,
          decoration: const BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                  colors: <Color>[
                AppColor.solidWhite,
                AppColor.transparent,
              ])),
          child: CachedNetworkImage(
            imageUrl: AppUrls.church3,
            fit: BoxFit.cover,
            errorWidget: (context, url, error) => const Icon(
                    Icons.error_outline,size: 50,
                  ),
          ),
        ),
        title: Text(
          AppStrings.churchName,
          style: GoogleFonts.inter(
            fontSize: 14.0,
            fontWeight: FontWeight.w700,
            color: AppColor.grey800,
            letterSpacing: 1,
          ),
        ),
        centerTitle: true,
      ),
    );
  }
}
