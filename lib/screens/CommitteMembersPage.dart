import 'package:cached_network_image/cached_network_image.dart';
import 'package:church/Constants.dart';
import 'package:church/Extensions/StringExtension.dart';
import 'package:church/screens/MemberDetails.dart';
import 'package:church/values/AppBar.dart';
import 'package:church/values/AppTitle.dart';
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
      backgroundColor: AppColor.solidWhite,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppColor.solidWhite,
        // leadingWidth: size.width * 0.1,
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: const FaIcon(
            FontAwesomeIcons.chevronLeft,
            color: AppColor.grey400,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: size.width * 0.027),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const AppTitle(
                  title: "Committee\nMembers",
                ),
                SizedBox(
                  height: size.height * 0.02,
                ),
                getcommitteemember.member?.length != null
                    ? GridView.builder(
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          childAspectRatio: 0.55,
                        ),
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: getcommitteemember.member?.length,
                        itemBuilder: (context, index) {
                          var committeemember =
                              getcommitteemember.member![index];
                          return Card(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15)),
                              color: AppColor.lightGreyShade,
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                  horizontal: size.width * 0.03,
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
                                          image: CachedNetworkImageProvider(
                                              committeemember
                                                  .committeMemberPhoto),
                                        ),
                                      ),
                                    ),
                                    SizedBox(height: size.height * 0.02),
                                    Text(
                                      committeemember.name.toTitleCase(),
                                      style: GoogleFonts.inter(
                                        fontSize: 18.0,
                                        fontWeight: FontWeight.w800,
                                      ),
                                    ),
                                    SizedBox(height: size.height * 0.02),
                                    Text(
                                      committeemember.position.positionName.toCapitalized(),
                                      style: GoogleFonts.inter(
                                        fontSize: 14.0,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                    SizedBox(height: size.height * 0.005),
                                    Text(
                                      committeemember
                                          .organisation.organisationName.toCapitalized(),
                                      style: GoogleFonts.inter(
                                        fontSize: 14.0,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                    SizedBox(height: size.height * 0.005),
                                    Text(
                                      committeemember.email,
                                      style: GoogleFonts.inter(
                                        fontSize: 14.0,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                    SizedBox(height: size.height * 0.005),
                                    Text(
                                      committeemember.phoneNo,
                                      style: GoogleFonts.inter(
                                        fontSize: 14.0,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ],
                                ),
                              ));
                        },
                      )
                    : SizedBox(
                        height: size.height,
                        child: Padding(
                          padding: EdgeInsets.only(bottom: size.height * 0.3),
                          child: const Center(
                            child: CircularProgressIndicator(),
                          ),
                        ),
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
