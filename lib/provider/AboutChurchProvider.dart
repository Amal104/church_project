import 'package:church/Services/AboutChurchServices.dart';
import 'package:flutter/material.dart';

import '../Model/AboutChurch.dart';

class AboutChurchProvider extends ChangeNotifier {

   AboutChurch? aboutChurch;

  bool loading = false;

  getAboutChurch() async {
    loading = true;
    notifyListeners();

    aboutChurch = (await AboutChurchService().aboutChurch());

    loading = false;
    notifyListeners();
  }
}