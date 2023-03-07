import 'package:church/Services/Birthday_Anniversary_Services.dart';
import 'package:church/Services/Contact_Us_Provider.dart';
import 'package:church/Services/VicarMessage.dart';
import 'package:flutter/cupertino.dart';

import '../Model/Birthday_Anniversary_Model.dart';
import '../Model/Contact_Us_Model.dart';

class ContactUsProvider extends ChangeNotifier {
  ContactUsModel? contactUs;
  //  VicarMessageModel? asivicar;
  bool loading = false;

  getContactUs() async {
    loading = true;

    contactUs = (await ContactUsService.getContactUs());

    loading = false;
    notifyListeners();
  }
}
