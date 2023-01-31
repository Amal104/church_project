import 'package:cached_network_image/cached_network_image.dart';
import 'package:church/screens/blah.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import '../provider/CommitteeMemberProvider.dart';
import '../provider/MemberProvider.dart';
import '../values/values.dart';

class CommitteeMemberPage extends StatefulWidget {
  const CommitteeMemberPage({super.key});

  @override
  State<CommitteeMemberPage> createState() => _CommitteeMemberPageState();
}

class _CommitteeMemberPageState extends State<CommitteeMemberPage> {
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
                  "Committee\nMembers",
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
                        color: AppColor.lightGreyShade,
                        child: ListTile(
                          onTap: () {
                            Get.to(() => MemberDetails(
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
                                  organization: member.organization.organisationName,
                                  mobile: member.mobilePhone,
                                  phoneOffice: member.phoneOffice,
                                  birthday: member.birthday,
                                  marriageDate: member.marriageDate,
                                  homeParishHouseName:
                                      member.homeParishHouseName,
                                  homeParish: member.homeParish,
                                  nativePlace: member.nativePlace,
                                  generalRemarks: member.generalRemarks,
                                  memberName: member.memberName,
                                ));
                          },
                          // tileColor: AppColor.lightGreyShade,
                          // leading: Text(member.memberName),
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
