import 'package:cached_network_image/cached_network_image.dart';
import 'package:church/values/AppBar.dart';
import 'package:church/values/AppTitle.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

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

  final String profilePhoto;
  final String memberName;
  final String houseName;
  final String homeParish;
  final String address1;
  final String address2;
  final int pincode;
  final String landline;
  final String mobilePhone;
  final String email;
  final String bloodGroup;
  final DateTime birthday;

  final TextEditingController _controller = TextEditingController();
  final TextEditingController _controller1 = TextEditingController();


  @override
  Widget build(BuildContext context) {
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
      body: Column(
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
                    height: size.height * 0.002,
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
                  SizedBox(
                    height: size.height * 0.02,
                  ),
                  SizedBox(
                    height: size.height* 0.52,
                    child: ListView(
                      shrinkWrap: true,
                      children: [
                         SizedBox(
                          height: size.height * 0.015,
                        ),
                        TextFormField(
                          controller: _controller..text = houseName,
                          onChanged: (value) => _controller..text = value,
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
                          onChanged: (value) => _controller1..text = value,
                          keyboardType: TextInputType.text,
                          decoration: InputDecoration(
                            border: const OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(15)),
                            ),
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
                          controller: TextEditingController(text: houseName),
                          keyboardType: TextInputType.text,
                          decoration: InputDecoration(
                            border: const OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(15)),
                            ),
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
                          controller: TextEditingController(text: houseName),
                          keyboardType: TextInputType.text,
                          decoration: InputDecoration(
                            border: const OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(15)),
                            ),
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
                          controller: TextEditingController(text: houseName),
                          keyboardType: TextInputType.text,
                          decoration: InputDecoration(
                            border: const OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(15)),
                            ),
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
                          controller: TextEditingController(text: houseName),
                          keyboardType: TextInputType.text,
                          decoration: InputDecoration(
                            border: const OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(15)),
                            ),
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
                          controller: TextEditingController(text: houseName),
                          keyboardType: TextInputType.text,
                          decoration: InputDecoration(
                            border: const OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(15)),
                            ),
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
                          controller: TextEditingController(text: houseName),
                          keyboardType: TextInputType.text,
                          decoration: InputDecoration(
                            border: const OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(15)),
                            ),
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
                          controller: TextEditingController(text: houseName),
                          keyboardType: TextInputType.text,
                          decoration: InputDecoration(
                            border: const OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(15)),
                            ),
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
                          controller: TextEditingController(text: houseName),
                          keyboardType: TextInputType.text,
                          decoration: InputDecoration(
                            border: const OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(15)),
                            ),
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
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
