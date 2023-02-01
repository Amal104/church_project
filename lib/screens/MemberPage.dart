import 'package:church/Constants.dart';
import 'package:church/screens/MemberDetails.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import '../provider/MemberProvider.dart';
import '../values/values.dart';

class MemberPage extends StatefulWidget {
  const MemberPage({super.key});

  @override
  State<MemberPage> createState() => _MemberPageState();
}

class _MemberPageState extends State<MemberPage> {
  @override
  void initState() {
    super.initState();
    final getmember = Provider.of<MemberProvider>(context, listen: false);
    getmember.getMember();
  }

  @override
  Widget build(BuildContext context) {
    final getmember = Provider.of<MemberProvider>(context);
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              IconButton(
                onPressed: () {
                  Get.back();
                },
                icon: const FaIcon(
                  FontAwesomeIcons.chevronLeft,
                  color: AppColor.grey400,
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: MediaQuery.of(context).size.width / 25,
                ),
                child: Text(
                  "Members\nDetails",
                  style: GoogleFonts.inter(
                    fontSize: 25.0,
                    fontWeight: FontWeight.bold,
                    color: AppColor.grey600,
                    letterSpacing: 1.0,
                  ),
                ),
              ),
              SizedBox(
                height: size.height * 0.02,
              ),
              if (getmember.member?.length != null)
                ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: getmember.member?.length,
                  itemBuilder: (context, index) {
                    var member = getmember.member![index];
                    return Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: size.height * 0.015,
                          vertical: size.width * 0.015),
                      child: Card(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15)
                          ),
                        color: AppColor.lightGreyShade,
                        child: ListTile(
                          onTap: () {
                            Get.to(
                              () => MemberDetails(
                                memberid: member.memberId,
                                email: member.email,
                                edavakaReg: member.edavakaRegisterNo,
                                gender: member.gender,
                                membershipStatus: member.membershipStatus,
                                housename: member.houseName,
                                address1: member.address1,
                                address2: member.address2,
                                postoffice: member.postoffice,
                                pincode: member.pincode,
                                prayerGroup: member.prayerGroup.prayerGroupName,
                                designation: member.designation,
                                organization:
                                    member.organisation.organisationName,
                                mobile: member.mobilePhone,
                                phoneOffice: member.phoneOffice,
                                birthday: member.birthday,
                                marriageDate: member.marriageDate,
                                homeParishHouseName: member.homeParishHouseName,
                                homeParish: member.homeParish,
                                nativePlace: member.nativePlace,
                                generalRemarks: member.generalRemarks,
                                memberName: member.memberName,
                              ),
                              transition: Transition.rightToLeft,
                            );
                          },
                          // tileColor: AppColor.lightGreyShade,
                          leading: CircleAvatar(
                            radius: 26,
                            backgroundImage: NetworkImage(
                              images[index],
                            ),
                          ),
                          title: Text(member.memberName),
                          subtitle: Text(member.homeParish),
                          trailing: const FaIcon(FontAwesomeIcons.chevronRight),
                        ),
                      ),
                    );
                  },
                ),
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
