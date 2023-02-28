import 'package:church/Extensions/StringExtension.dart';
import 'package:church/screens/LectionaryScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../Model/LectionaryModel.dart';
import '../Services/LectionaryServices.dart';
import '../values/AppBar.dart';
import '../values/AppTitle.dart';
import '../values/values.dart';

class LectionaryTItle extends StatelessWidget {
  const LectionaryTItle({super.key});

  @override
  Widget build(BuildContext context) {
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
                  child: const AppTitle(title: "Lectionary")),
              SizedBox(
                height: size.height * 0.02,
              ),
              FutureBuilder<Lectionary?>(
                  future: LectionaryService().getLectionary(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: size.width * 0.03),
                          child: ListView.builder(
                            shrinkWrap: true,
                            itemCount: snapshot.data!.lectionary.length,
                            itemBuilder: (context, index) {
                              var data = snapshot.data!.lectionary[index];
                              return Padding(
                                padding: EdgeInsets.symmetric(
                                    vertical: size.height * 0.007,
                                    horizontal: size.width * 0.03),
                                child: Center(
                                  child: Container(
                                    padding: EdgeInsets.symmetric(
                                      vertical: size.height * 0.015,
                                    ),
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                          color: Colors.white.withOpacity(0.2),
                                          width: 1.0),
                                      gradient: const LinearGradient(
                                        colors: [
                                          Color.fromARGB(255, 237, 237, 237),
                                          Color.fromARGB(255, 236, 188, 204),
                                        ],
                                        // stops: const [0.0, 1.0],
                                      ),
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    child: ListTile(
                                      onTap: () {
                                        Get.to(
                                          () => LectionaryScreen(
                                            title: data.title,
                                            date: data.reading,
                                            length: data.reading[index].date.length,
                                            // readingTitle: data.reading[index].title,
                                          ),
                                        );
                                      },
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(20),
                                      ),
                                      leading: const FaIcon(
                                        FontAwesomeIcons.calendarCheck,
                                        size: 30,
                                      ),
                                      title: Text(
                                        data.title.toTitleCase(),
                                        style: GoogleFonts.inter(
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                      trailing: const FaIcon(
                                          FontAwesomeIcons.chevronRight),
                                      contentPadding: EdgeInsets.symmetric(
                                          horizontal: size.width * 0.04),
                                    ),
                                  ),
                                ),
                              );
                            },
                          ));
                    } else if (snapshot.hasError) {
                      return Text("${snapshot.error}");
                    }
                    return const Center(child: CircularProgressIndicator());
                  }),
              SizedBox(
                height: size.height * 0.06,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
