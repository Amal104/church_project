import 'package:church/Extensions/StringExtension.dart';
import 'package:church/Services/WorshipTime_Services.dart';
import 'package:church/values/AppTitle.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

import '../Model/WorshipTime_Model.dart';
import '../values/AppBar.dart';
import '../values/values.dart';

class WorshipTimeScreen extends StatefulWidget {
  const WorshipTimeScreen({super.key});

  @override
  State<WorshipTimeScreen> createState() => _WorshipTimeScreenState();
}

class _WorshipTimeScreenState extends State<WorshipTimeScreen> {
  Future<List<WorshipTimeModel>?>? worshipTime;

  @override
  void initState() {
    super.initState();
    worshipTime = WorshipTimeService().getWorshipTime();
  }

  @override
  Widget build(BuildContext context) {
    // final getobituary = Provider.of<ObicturyProvider>(context);
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: AppColor.solidWhite,
      appBar: CustomAppBar.customAppBarIcon(),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: MediaQuery.of(context).size.width / 20,
                  ),
                  child: const AppTitle(title: "Worship Time")),
              SizedBox(
                height: size.height * 0.02,
              ),
              FutureBuilder<List<WorshipTimeModel>?>(
                future: worshipTime,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: snapshot.data?.length,
                      itemBuilder: (context, index) {
                        var worship = snapshot.data![index];
                        return Padding(
                          padding: EdgeInsets.symmetric(
                              vertical: size.height * 0.005,
                              horizontal: size.width * 0.040),
                          child: Card(
                            elevation: 3,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20)
                              ),
                            child: ListTile(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                              tileColor: AppColor.lightblue,
                              leading: Padding(
                                padding: EdgeInsets.only(
                                  top: size.height * 0.006,
                                ),
                                child: const FaIcon(
                                  FontAwesomeIcons.solidClock,
                                  size: 30,
                                ),
                              ),
                              title: Text(
                                worship.title.toTitleCase(),
                                style: GoogleFonts.inter(
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              subtitle: Text(worship.day),
                              trailing: Text(
                                worship.time,
                                style: GoogleFonts.inter(
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              contentPadding: EdgeInsets.symmetric(
                                  horizontal: size.width * 0.04),
                            ),
                          ),
                        );
                      },
                    );
                  } else {
                    print("error : ${snapshot.error}");
                  }
                  return SizedBox(
                    height: size.height * 0.7,
                    child: const Center(
                      child: CircularProgressIndicator(),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
