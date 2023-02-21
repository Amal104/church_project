import 'package:church/provider/AboutChurchProvider.dart';
import 'package:church/provider/AnnoucementProvider.dart';
import 'package:church/provider/ChangePassword.dart';
import 'package:church/provider/CommitteeMemberProvider.dart';
import 'package:church/provider/FlashNewsProvider.dart';
import 'package:church/provider/HomePage_Provider.dart';
import 'package:church/provider/LectionaryProvider.dart';
import 'package:church/provider/LoginProvider.dart';
import 'package:church/provider/MemberProvider.dart';
import 'package:church/provider/VicarMessageProvider.dart';
import 'package:church/screens/SplashScreen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'provider/Enquiry_Provider.dart';
import 'provider/EventProvider.dart';
import 'provider/ObicturyProvider.dart';
import 'provider/PrayerMeeting_Provider.dart';
import 'provider/Profile_Provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => HomePageProvider(),),
        ChangeNotifierProvider(create: (context) => LoginProvider(),),
        ChangeNotifierProvider(create: (context) => VicarMessageProvider(),),
        ChangeNotifierProvider(create: (context) => MemberProvider(),),
        ChangeNotifierProvider(create: (context) => AboutChurchProvider(),),
        ChangeNotifierProvider(create: (context) => AnnouncementProvider(),),
        ChangeNotifierProvider(create: (context) => EventProvider(),),
        ChangeNotifierProvider(create: (context) => FlashNewsProvider(),),
        ChangeNotifierProvider(create: (context) => CommitteeMemberProvider(),),
        ChangeNotifierProvider(create: (context) => ObicturyProvider(),),
        ChangeNotifierProvider(create: (context) => LectionaryProvider(),),
        ChangeNotifierProvider(create: (context) => PrayerMeetingProvider(),),
        ChangeNotifierProvider(create: (context) => ProfileProvider(),),
        ChangeNotifierProvider(create: (context) => ChangePasswordProvider(),),
        ChangeNotifierProvider(create: (context) => EnquiryProvider(),),
      ],
      child: GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'church app',
        theme: ThemeData(
          primarySwatch: Colors.grey,
        ),
        home: const SplashScreen(),
      ),
    );
  }
}
