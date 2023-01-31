import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../Model/ObicturyModel.dart';
import '../Services/ObicturyServices.dart';
import '../values/values.dart';
import 'package:intl/intl.dart';

class ObicturyPage extends StatefulWidget {
  const ObicturyPage({super.key});

  @override
  State<ObicturyPage> createState() => _ObicturyPageState();
}

class _ObicturyPageState extends State<ObicturyPage> {
  List<ObicturyModel>? products = [];
  var isLoading = false;
  @override
  void initState() {
    super.initState();
    data();
  }

  data() async {
    products = (await ObicturyService().getObictury())!;
    if (products != null) {
      setState(() {
        isLoading = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
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
                  "Obituary",
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
              if (products?.length != null)
                ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: products?.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: size.height * 0.02,
                          vertical: size.width * 0.03),
                      child: Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: size.height * 0.02,
                              vertical: size.width * 0.03),
                          decoration: BoxDecoration(
                            color: AppColor.lightGreyShade,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Column(
                            children: [
                              Text(products![index].member),
                              SizedBox(
                                height: size.height * 0.02,
                              ),
                              Text(products![index].date),
                              SizedBox(
                                height: size.height * 0.02,
                              ),
                              Text(products![index].description),
                              SizedBox(
                                height: size.height * 0.02,
                              ),
                            ],
                          )),
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
