import 'package:church/Services/AboutChurchServices.dart';
import 'package:flutter/material.dart';

import '../Model/AboutChurch.dart';
import '../Model/ChurchHistory.dart';

class AboutChurchProvider extends ChangeNotifier {

   AboutChurch? aboutChurch;
   ChurchHistoryModel? churchHistory;

  bool loading = false;
  bool loading1 = false;

  getAboutChurch() async {
    loading = true;

    aboutChurch = (await AboutChurchService().aboutChurch());

    loading = false;
    notifyListeners();
  }

   getChurchHistory() async {
    loading1 = true;

    churchHistory = (await AboutChurchService().churchHistory());

    loading1 = false;
    notifyListeners();
  }

}