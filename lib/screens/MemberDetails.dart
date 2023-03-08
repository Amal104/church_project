import 'package:cached_network_image/cached_network_image.dart';
import 'package:church/Model/MemberListModel.dart';
import 'package:church/values/values.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:lottie/lottie.dart';
import '../widgets/MemberDetailsTile.dart';
import 'package:confetti/confetti.dart';

class MemberDetails extends StatefulWidget {
  const MemberDetails({
    super.key,
    required this.memberid,
    required this.email,
    required this.edavakaReg,
    required this.gender,
    required this.membershipStatus,
    required this.housename,
    required this.address1,
    required this.address2,
    required this.postoffice,
    required this.pincode,
    required this.prayerGroup,
    required this.designation,
    required this.organization,
    required this.mobile,
    required this.phoneOffice,
    required this.birthday,
    required this.marriageDate,
    required this.homeParishHouseName,
    required this.homeParish,
    required this.nativePlace,
    required this.generalRemarks,
    required this.memberName,
    required this.photo,
    required this.item,
    required this.latitude,
    required this.longitude,
  });

  final String memberName;
  final int memberid;
  final String email;
  final int edavakaReg;
  final String gender;
  final String membershipStatus;
  final String housename;
  final String address1;
  final String address2;
  final String postoffice;
  final int pincode;
  final String prayerGroup;
  final String designation;
  final String organization;
  final String mobile;
  final String phoneOffice;
  final DateTime birthday;
  final DateTime? marriageDate;
  final String homeParishHouseName;
  final String homeParish;
  final String nativePlace;
  final String generalRemarks;
  final String photo;
  final String latitude;
  final String longitude;
  final MemberListModel item;

  @override
  State<MemberDetails> createState() => _MemberDetailsState();
}

class _MemberDetailsState extends State<MemberDetails> {
  ConfettiController controller =
      ConfettiController(duration: const Duration(seconds: 3));
  @override
  void initState() {
    super.initState();
    var a = DateFormat("dd-MM").format(widget.birthday);
    var b = DateFormat("dd-MM").format(DateTime.now());
    if (a == b) {
      controller.play();
    }
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var a = DateFormat("dd-MM").format(widget.birthday);
    var b = DateFormat("dd-MM").format(DateTime.now());
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: SizedBox(
        width: size.width,
        height: size.height,
        child: Stack(
          clipBehavior: Clip.none,
          fit: StackFit.loose,
          children: [
            Hero(
              tag: widget.item,
              child: CachedNetworkImage(
                imageUrl: widget.photo,
                height: size.height * 0.4,
                width: size.width,
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: size.height * 0.065),
              child: IconButton(
                  onPressed: () => Get.back(),
                  icon: const FaIcon(
                    FontAwesomeIcons.chevronLeft,
                    color: AppColor.solidBlack,
                  )),
            ),
            Positioned(
              bottom: 0,
              child: Container(
                padding: EdgeInsets.only(
                  left: size.width * 0.025,
                  right: size.width * 0.025,
                  top: size.height * 0.01,
                ),
                width: size.width,
                height: size.height * 0.64,
                decoration: const BoxDecoration(
                  color: AppColor.solidWhite,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                ),
                child: MemberDetailsTile(
                  size: size,
                  memberName: widget.memberName,
                  memberid: widget.memberid,
                  email: widget.email,
                  edavakaReg: widget.edavakaReg,
                  gender: widget.gender,
                  membershipStatus: widget.membershipStatus,
                  housename: widget.housename,
                  address1: widget.address1,
                  address2: widget.address2,
                  postoffice: widget.postoffice,
                  pincode: widget.pincode,
                  prayerGroup: widget.prayerGroup,
                  designation: widget.designation,
                  organization: widget.organization,
                  mobile: widget.mobile,
                  phoneOffice: widget.phoneOffice,
                  homeParishHouseName: widget.homeParishHouseName,
                  homeParish: widget.homeParish,
                  nativePlace: widget.nativePlace,
                  generalRemarks: widget.generalRemarks,
                  latitude: widget.latitude,
                  longitude: widget.longitude,
                  marriageDate: widget.marriageDate,
                  birthDay: widget.birthday,
                ),
              ),
            ),
            Align(
              alignment: Alignment.topCenter,
              child: ConfettiWidget(
                confettiController: controller,
                blastDirectionality: BlastDirectionality.explosive,
                numberOfParticles: 30,
              ),
            ),
            a == b
                ? Positioned(
                    top: size.height * 0.315,
                    left: size.width * 0.32,
                    child: LottieBuilder.asset(
                      "assets/lottie/birthday.json",
                      repeat: false,
                      height: size.height * 0.12,
                    ),
                  )
                : SizedBox.shrink(),
          ],
        ),
      ),
    );
  }
}
