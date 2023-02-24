import 'package:cached_network_image/cached_network_image.dart';
import 'package:church/Extensions/StringExtension.dart';
import 'package:church/values/AppBar.dart';
import 'package:church/values/AppTitle.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

import '../values/values.dart';

class ProfileScreen extends StatelessWidget {
  ProfileScreen({
    super.key,
    required this.profilePhoto,
    required this.memberName,
    required this.houseName,
    required this.homeParish,
    required this.address1,
    required this.address2,
    required this.pincode,
    required this.landline,
    required this.mobilePhone,
    required this.email,
    required this.bloodGroup,
    required this.birthday,
  });

  late String profilePhoto;
  late String memberName;
  late String houseName;
  late String homeParish;
  late String address1;
  late String address2;
  late int pincode;
  late String landline;
  late String mobilePhone;
  late String email;
  late String bloodGroup;
  late DateTime birthday;

  final TextEditingController _controller = TextEditingController();
  final TextEditingController _controller1 = TextEditingController();
  final TextEditingController _controller2 = TextEditingController();
  final TextEditingController _controller3 = TextEditingController();
  final TextEditingController _controller4 = TextEditingController();
  final TextEditingController _controller5 = TextEditingController();
  final TextEditingController _controller6 = TextEditingController();
  final TextEditingController _controller7 = TextEditingController();
  final TextEditingController _controller8 = TextEditingController();
  final TextEditingController _controller9 = TextEditingController();
  final TextEditingController _controller10 = TextEditingController();
  final TextEditingController _controller11 = TextEditingController();

  

  @override
  Widget build(BuildContext context) {
    final formattedBirthday = DateFormat("dd-MM-yyyy").format(birthday);
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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: MediaQuery.of(context).size.width / 20,
                ),
                child: const AppTitle(title: "Member Profile")),
            SizedBox(
              height: size.height * 0.03,
            ),
            Center(
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: MediaQuery.of(context).size.width / 20,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    profilePhoto != ""
                        ? Hero(
                            tag: "profilephoto",
                            child: CircleAvatar(
                              radius: size.height * 0.1,
                              backgroundImage:
                                  CachedNetworkImageProvider(profilePhoto),
                            ),
                          )
                        : Hero(
                            tag: "profilephoto",
                            child: CircleAvatar(
                              radius: size.height * 0.1,
                              backgroundImage: const AssetImage(
                                  "assets/default_profile.png"),
                            ),
                          ),
                    SizedBox(
                      height: size.height * 0.005,
                    ),
                    Text(
                      memberName.toTitleCase(),
                      style: GoogleFonts.inter(
                          fontWeight: FontWeight.w500, fontSize: 18),
                    ),
                    SizedBox(
                      height: size.height * 0.002,
                    ),
                    // ElevatedButton(
                    //   style: ElevatedButton.styleFrom(
                    //     backgroundColor: AppColor.purpleShade,
                    //     shape: RoundedRectangleBorder(
                    //       borderRadius: BorderRadius.circular(10),
                    //     ),
                    //     elevation: 0,
                    //   ),
                    //   onPressed: () {},
                    //   child: const Text("Edit Profile"),
                    // ),
                    SizedBox(
                      height: size.height * 0.02,
                    ),
                    SizedBox(
                      height: size.height * 0.46,
                      child: ListView(
                        shrinkWrap: true,
                        children: [
                          SizedBox(
                            height: size.height * 0.015,
                          ),
                          TextFormField(
                            controller: _controller..text = houseName,
                            onChanged: (value) => houseName = value,
                            keyboardType: TextInputType.text,
                            decoration: InputDecoration(
                              border: const OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(15)),
                              ),
                              label: const Text("House Name"),
                              contentPadding: EdgeInsets.symmetric(
                                  horizontal: size.width * 0.05),
                              focusedBorder: const OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(15)),
                                  borderSide: BorderSide(
                                      width: 2, color: AppColor.solidBlack)),
                            ),
                            // initialValue: houseName,
                          ),
                          SizedBox(
                            height: size.height * 0.015,
                          ),
                          TextFormField(
                            controller: _controller1..text = homeParish,
                            onChanged: (value) => homeParish = value,
                            keyboardType: TextInputType.text,
                            decoration: InputDecoration(
                              border: const OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(15)),
                              ),
                              label: const Text("Home Parish"),
                              contentPadding: EdgeInsets.symmetric(
                                  horizontal: size.width * 0.05),
                              focusedBorder: const OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(15)),
                                  borderSide: BorderSide(
                                      width: 2, color: AppColor.solidBlack)),
                            ),
                            // initialValue: houseName,
                          ),
                          SizedBox(
                            height: size.height * 0.015,
                          ),
                          TextFormField(
                            controller: _controller2..text = address1,
                            onChanged: (value) => address1 = value,
                            keyboardType: TextInputType.text,
                            decoration: InputDecoration(
                              border: const OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(15)),
                              ),
                              label: const Text("Address 1"),
                              contentPadding: EdgeInsets.symmetric(
                                  horizontal: size.width * 0.05),
                              focusedBorder: const OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(15)),
                                  borderSide: BorderSide(
                                      width: 2, color: AppColor.solidBlack)),
                            ),
                            // initialValue: houseName,
                          ),
                          SizedBox(
                            height: size.height * 0.015,
                          ),
                          TextFormField(
                            controller: _controller3..text = address2,
                            onChanged: (value) => address2 = value,
                            keyboardType: TextInputType.text,
                            decoration: InputDecoration(
                              border: const OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(15)),
                              ),
                              label: const Text("Address 2"),
                              contentPadding: EdgeInsets.symmetric(
                                  horizontal: size.width * 0.05),
                              focusedBorder: const OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(15)),
                                  borderSide: BorderSide(
                                      width: 2, color: AppColor.solidBlack)),
                            ),
                            // initialValue: houseName,
                          ),
                          SizedBox(
                            height: size.height * 0.015,
                          ),
                          TextFormField(
                            controller: _controller4..text = pincode.toString(),
                            onChanged: (value) => pincode = int.parse(value),
                            keyboardType: TextInputType.text,
                            decoration: InputDecoration(
                              border: const OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(15)),
                              ),
                              label: const Text("Pincode"),
                              contentPadding: EdgeInsets.symmetric(
                                  horizontal: size.width * 0.05),
                              focusedBorder: const OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(15)),
                                  borderSide: BorderSide(
                                      width: 2, color: AppColor.solidBlack)),
                            ),
                            // initialValue: houseName,
                          ),
                          SizedBox(
                            height: size.height * 0.015,
                          ),
                          TextFormField(
                            controller: _controller5..text = mobilePhone,
                            onChanged: (value) => mobilePhone = value,
                            keyboardType: TextInputType.text,
                            decoration: InputDecoration(
                              border: const OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(15)),
                              ),
                              label: const Text("Mobile"),
                              contentPadding: EdgeInsets.symmetric(
                                  horizontal: size.width * 0.05),
                              focusedBorder: const OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(15)),
                                  borderSide: BorderSide(
                                      width: 2, color: AppColor.solidBlack)),
                            ),
                            // initialValue: houseName,
                          ),
                          SizedBox(
                            height: size.height * 0.015,
                          ),
                          TextFormField(
                            controller: _controller6..text = landline,
                            onChanged: (value) => landline = value,
                            keyboardType: TextInputType.text,
                            decoration: InputDecoration(
                              border: const OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(15)),
                              ),
                              label: const Text("Landline"),
                              contentPadding: EdgeInsets.symmetric(
                                  horizontal: size.width * 0.05),
                              focusedBorder: const OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(15)),
                                  borderSide: BorderSide(
                                      width: 2, color: AppColor.solidBlack)),
                            ),
                            // initialValue: houseName,
                          ),
                          SizedBox(
                            height: size.height * 0.015,
                          ),
                          TextFormField(
                            controller: _controller7..text = email,
                            onChanged: (value) => _controller7..text = value,
                            keyboardType: TextInputType.text,
                            decoration: InputDecoration(
                              border: const OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(15)),
                              ),
                              label: const Text("Email"),
                              contentPadding: EdgeInsets.symmetric(
                                  horizontal: size.width * 0.05),
                              focusedBorder: const OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(15)),
                                  borderSide: BorderSide(
                                      width: 2, color: AppColor.solidBlack)),
                            ),
                            // initialValue: houseName,
                          ),
                          SizedBox(
                            height: size.height * 0.015,
                          ),
                          TextFormField(
                            controller: _controller8..text = bloodGroup,
                            onChanged: (value) => _controller8..text = value,
                            keyboardType: TextInputType.text,
                            decoration: InputDecoration(
                              border: const OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(15)),
                              ),
                              label: const Text("Blood Group"),
                              contentPadding: EdgeInsets.symmetric(
                                  horizontal: size.width * 0.05),
                              focusedBorder: const OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(15)),
                                  borderSide: BorderSide(
                                      width: 2, color: AppColor.solidBlack)),
                            ),
                            // initialValue: houseName,
                          ),
                          SizedBox(
                            height: size.height * 0.015,
                          ),
                          TextFormField(
                            controller: _controller9..text = formattedBirthday,
                            onChanged: (value) => _controller9..text = value,
                            keyboardType: TextInputType.text,
                            decoration: InputDecoration(
                              border: const OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(15)),
                              ),
                              label: const Text("Birthday"),
                              contentPadding: EdgeInsets.symmetric(
                                  horizontal: size.width * 0.05),
                              focusedBorder: const OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(15)),
                                  borderSide: BorderSide(
                                      width: 2, color: AppColor.solidBlack)),
                            ),
                            // initialValue: houseName,
                          ),
                          SizedBox(
                            height: size.height * 0.05,
                          ),
                        ],
                      ),
                    ),
                    ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColor.purpleShade,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          elevation: 0,
                        ),
                        onPressed: () {},
                        child: const Text("Edit Profile"),
                      ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
