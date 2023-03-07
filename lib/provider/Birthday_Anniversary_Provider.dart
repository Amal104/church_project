import 'package:church/Services/Birthday_Anniversary_Services.dart';
import 'package:church/Services/VicarMessage.dart';
import 'package:flutter/cupertino.dart';

import '../Model/Birthday_Anniversary_Model.dart';

class BirthdayAnniversaryProvider extends ChangeNotifier {
  BirthdayAnniversaryModel? event;
  //  VicarMessageModel? asivicar;
  bool loading = false;

  getEvent(DateTime date) async {
    loading = true;

    event = (await BirthdayAnniversaryService.getEvent(date));

    loading = false;
    notifyListeners();
  }
}
