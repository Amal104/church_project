import 'package:church/Services/Contact_Us_Provider.dart';
import 'package:church/values/AppBar.dart';
import 'package:church/values/AppTitle.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import '../Model/Contact_Us_Model.dart';
import '../provider/Enquiry_Provider.dart';
import '../values/values.dart';

class EnquiryPage extends StatelessWidget {
  const EnquiryPage({super.key});

  @override
  Widget build(BuildContext context) {
    var data = ContactUsService.getContactUs();
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: AppColor.solidWhite,
      appBar: CustomAppBar.customAppBarIcon(),
      body: SingleChildScrollView(
        child: Consumer<EnquiryProvider>(
          builder: (context, provider, child) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: MediaQuery.of(context).size.width / 20,
                    ),
                    child:
                        const AppTitle(title: "For Assistance\n& Enquiries")),
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
                            padding: EdgeInsets.symmetric(
                                horizontal: size.width * 0.15),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10))),
                        onPressed: () {
                          provider.sentResponce(context);
                        },
                        child: Text(
                          "Send",
                          style: GoogleFonts.inter(),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: size.height * 0.06,
                ),
                Container(
                  height: size.height * 0.3,
                  width: size.width,
                  decoration: const BoxDecoration(
                      color: Color(0x47E1E6E9)),
                  child: FutureBuilder<ContactUsModel?>(
                    future: data,
                    builder: (context, snapshot) {
                      return Column(
                        children: [
                          SizedBox(
                            height: size.height * 0.03,
                          ),
                          Text(
                            snapshot.data?.parishName ?? "",
                            style: GoogleFonts.inter(
                              fontWeight: FontWeight.w600,
                              color: AppColor.darkpurpleShade,
                            ),
                          ),
                          SizedBox(
                            height: size.height * 0.02,
                          ),
                          Text(
                            snapshot.data?.address ?? "",
                            style: GoogleFonts.inter(
                              color: AppColor.grey600,
                            ),
                          ),
                          SizedBox(
                            height: size.height * 0.01,
                          ),
                          Text(
                            snapshot.data?.email ?? "",
                            style: GoogleFonts.inter(
                              color: AppColor.grey600,
                            ),
                          ),
                          SizedBox(
                            height: size.height * 0.01,
                          ),
                          Text(
                            snapshot.data?.website ?? "",
                            style: GoogleFonts.inter(
                              color: AppColor.grey600,
                            ),
                          ),
                          SizedBox(
                            height: size.height * 0.01,
                          ),
                          Text(
                            snapshot.data?.mobile1 ?? "",
                            style: GoogleFonts.inter(
                              color: AppColor.grey600,
                            ),
                          ),
                          SizedBox(
                            height: size.height * 0.01,
                          ),
                          Text(
                            snapshot.data?.mobile2 ?? "",
                            style: GoogleFonts.inter(
                              color: AppColor.grey600,
                            ),
                          ),
                          SizedBox(
                            height: size.height * 0.01,
                          ),
                          Text(
                            snapshot.data?.landline1 ?? "",
                            style: GoogleFonts.inter(
                              color: AppColor.grey600,
                            ),
                          ),
                          SizedBox(
                            height: size.height * 0.01,
                          ),
                          Text(
                            snapshot.data?.landline2 ?? "",
                            style: GoogleFonts.inter(
                              color: AppColor.grey600,
                            ),
                          ),
                          SizedBox(
                            height: size.height * 0.01,
                          ),
                        ],
                      );
                    },
                  ),
                )
              ],
            );
          },
        ),
      ),
    );
  }
}
