import 'package:church/provider/AboutChurchProvider.dart';
import 'package:church/values/urls.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:provider/provider.dart';
import '../values/Strings.dart';
import '../values/values.dart';

class HomePageAppbar extends StatefulWidget {
  const HomePageAppbar({
    Key? key,
  }) : super(key: key);

  @override
  State<HomePageAppbar> createState() => _HomePageAppbarState();
}

class _HomePageAppbarState extends State<HomePageAppbar> {
  @override
  void initState() {
    super.initState();
    final church = Provider.of<AboutChurchProvider>(context, listen: false);
    church.getAboutChurch();
  }

  @override
  Widget build(BuildContext context) {
    final getchurch = Provider.of<AboutChurchProvider>(context);
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
            imageUrl: getchurch.aboutChurch?.parishPhoto ?? "",
            fit: BoxFit.cover,
            errorWidget: (context, url, error) => const Icon(
              Icons.error_outline,
              size: 50,
            ),
          ),
        ),
        title: Text(
          AppStrings.churchName,
          style: GoogleFonts.inter(
            fontSize: 14.0,
            fontWeight: FontWeight.w700,
            color: AppColor.grey,
            letterSpacing: 1,
          ),
        ),
        centerTitle: true,
      ),
    );
  }
}
