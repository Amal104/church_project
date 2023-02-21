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
    var size = MediaQuery.of(context).size;
    final getchurch = Provider.of<AboutChurchProvider>(context);
    return SliverAppBar(
      backgroundColor: AppColor.solidWhite,
      elevation: 0.0,
      centerTitle: true,
      expandedHeight: 300.0,
      pinned: true,
      leading: Builder(
        builder: (BuildContext context) {
          return Padding(
            padding: EdgeInsets.symmetric(
              horizontal: size.width * 0.025,
              vertical: size.height * 0.013,
            ),
            child: Container(
              decoration: BoxDecoration(
                  color: const Color.fromARGB(109, 255, 255, 255),
                  borderRadius: BorderRadius.circular(10)),
              child: IconButton(
                icon: const Icon(
                  Icons.menu,
                  size: 20,
                ),
                onPressed: () {
                  Scaffold.of(context).openDrawer();
                },
                tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
              ),
            ),
          );
        },
      ),
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
