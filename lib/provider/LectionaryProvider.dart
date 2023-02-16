import 'package:flutter/material.dart';

import '../Model/LectionaryModel.dart';
import '../Services/LectionaryServices.dart';

class LectionaryProvider extends ChangeNotifier {
  Lectionary? getLectionary;

  bool loading = false;

  getLectionaryData() async {
    loading = true;

    getLectionary = (await LectionaryService().getLectionary());

    loading = false;
    notifyListeners();
  }
}
