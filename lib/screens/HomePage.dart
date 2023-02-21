import 'package:church/screens/Drawer.dart';
import 'package:church/values/values.dart';
import 'package:flutter/material.dart';
import '../widgets/EnquiryTab.dart';
import '../widgets/EventsTab.dart';
import '../widgets/HomePageAppbar.dart';
import '../widgets/HomePageGrid.dart';
import '../widgets/FlashNews.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: AppColor.solidWhite,
      body: CustomScrollView(
        slivers: [
          const HomePageAppbar(),
          SliverPadding(padding: EdgeInsets.only(top: height * 0.01)),
          FlashNews(width: width, height: height),
          SliverPadding(padding: EdgeInsets.only(top: height * 0.01)),
          HomePageGrid(width: width, height: height),
          SliverPadding(padding: EdgeInsets.only(top: height * 0.02)),
          EventsTab(width: width, height: height),
          EnquiryTab(height: height, width: width),
        ],
      ),
      drawer: const Drawerr(),
    );
  }
}
