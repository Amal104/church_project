import 'package:flutter/material.dart';

import '../Model/Profile_Model.dart';
import '../Services/Profile_Services.dart';

class ProfileProvider extends ChangeNotifier {

   ProfileModel? profile;

  bool loading = false;

  getProfileDetails() async {
    loading = true;

    profile = (await ProfileService().profileDetails())!;
    
    loading = false;
    notifyListeners();
  }
}