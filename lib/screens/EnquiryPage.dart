import 'package:church/values/AppBar.dart';
import 'package:church/values/AppTitle.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import '../provider/Enquiry_Provider.dart';
import '../values/values.dart';

class EnquiryPage extends StatelessWidget {
  const EnquiryPage({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: AppColor.solidWhite,
      appBar: CustomAppBar.customAppBarIcon(),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Consumer<EnquiryProvider>(
            builder: (context, provider, child) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: MediaQuery.of(context).size.width / 20,
                      ),
                      child: const AppTitle(title: "For Assistance\n& Enquiries")),
                  SizedBox(
                    height: size.height * 0.02,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: size.width / 20,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: size.height * 0.05,
                        ),
                        Container(
                          decoration: BoxDecoration(
                            color: AppColor.lightGreyShade,
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: TextFormField(
                            controller: provider.senderController,
                            keyboardType: TextInputType.text,
                            decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: "Title",
                                hintStyle: GoogleFonts.inter(fontSize: 14),
                                contentPadding: EdgeInsets.symmetric(
                                  horizontal: size.width * 0.05,
                                  vertical: size.height * 0.02,
                                )),
                          ),
                        ),
                        SizedBox(
                          height: size.height * 0.015,
                        ),
                        Container(
                          height: size.height * 0.2,
                          decoration: BoxDecoration(
                            color: AppColor.lightGreyShade,
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: TextFormField(
                            expands: true,
                            maxLines: null,
                            controller: provider.msgController,
                            keyboardType: TextInputType.multiline,
                            decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: "Message",
                                hintStyle: GoogleFonts.inter(fontSize: 14),
                                contentPadding: EdgeInsets.symmetric(
                                  horizontal: size.width * 0.05,
                                  vertical: size.height * 0.02,
                                )),
                          ),
                        ),
                        SizedBox(
                          height: size.height * 0.03,
                        ),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor: AppColor.purpleShade,
                              padding:EdgeInsets.symmetric(horizontal: size.width * 0.15) ,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10))),
                          onPressed: () {
                            provider.sentResponce(context);
                          },
                          child: Text(
                            "Send",
                            style: GoogleFonts.inter(),
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: size.height * 0.06,
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
