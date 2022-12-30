import 'package:church/screens/Drawer.dart';
import 'package:flutter/material.dart';
import '../widgets/EnquiryTab.dart';
import '../widgets/EventsTab.dart';
import '../widgets/HomePageAppbar.dart';
import '../widgets/HomePageGrid.dart';
import '../widgets/QuoteHomePage.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          const HomePageAppbar(),
          HomePageQuote(width: width, height: height),
          HomePageGrid(width: width, height: height),
          EventsTab(width: width, height: height),
          EnquiryTab(height: height, width: width),
        ],
      ),
      drawer: const Drawerr(),
    );
  }
}