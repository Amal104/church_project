import 'package:cached_network_image/cached_network_image.dart';
import 'package:church/Constants.dart';
import 'package:church/screens/MemberDetails.dart';
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
    final getcommitteemember =
        Provider.of<CommitteeMemberProvider>(context, listen: false);
    getcommitteemember.getCommitteeMember();
  }

  @override
  Widget build(BuildContext context) {
    final getcommitteemember = Provider.of<CommitteeMemberProvider>(context);
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: size.width * 0.027),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(vertical: size.height * 0.02),
                  child: GestureDetector(
                    onTap: () => Get.back(),
                    child: const FaIcon(
                      FontAwesomeIcons.chevronLeft,
                      color: AppColor.grey400,
                    ),
                  ),
                ),
                Text(
                  "Committee\nMembers",
                  style: GoogleFonts.inter(
                    fontSize: 25.0,
                    fontWeight: FontWeight.bold,
                    color: AppColor.grey600,
                    letterSpacing: 1.0,
                  ),
                ),
                SizedBox(
                  height: size.height * 0.02,
                ),
                if (getcommitteemember.member?.length != null)
                  GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 0.7,
                    ),
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: getcommitteemember.member?.length,
                    itemBuilder: (context, index) {
                      var committeemember = getcommitteemember.member![index];
                      return Card(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15)),
                          color: AppColor.lightGreyShade,
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: size.width * 0.05,
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  width: 100.0,
                                  height: 100.0,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    image: DecorationImage(
                                      fit: BoxFit.cover,
                                      image: NetworkImage(images[index]),
                                    ),
                                  ),
                                ),
                                SizedBox(height: size.height * 0.02),
                                Text(
                                  committeemember.name,
                                  style: GoogleFonts.inter(
                                    fontSize: 18.0,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                                SizedBox(height: size.height * 0.02),
                                Text(
                                  committeemember.position.positionName,
                                  style: GoogleFonts.inter(
                                    fontSize: 14.0,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                SizedBox(height: size.height * 0.005),
                                Text(
                                  committeemember.organisation.organisationName,
                                  style: GoogleFonts.inter(
                                    fontSize: 14.0,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                SizedBox(height: size.height * 0.005),
                                Text(
                                  committeemember.email,
                                  style: GoogleFonts.inter(
                                    fontSize: 14.0,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                SizedBox(height: size.height * 0.005),
                                Text(
                                  committeemember.phoneNo,
                                  style: GoogleFonts.inter(
                                    fontSize: 14.0,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ],
                            ),
                          ));
                    },
                  ),
                SizedBox(
                  height: size.height * 0.06,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
