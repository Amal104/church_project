import 'package:flutter/material.dart';

import '../Model/AnnoucementModel.dart';
import '../Services/AnnoucementService.dart';

class AnnouncementProvider extends ChangeNotifier {
  List<AnnouncementModel>? member = [];
  var isLoading = false;

  getMember() async {
    isLoading = true;

    member = (await AnnoucementService().getAnnoucement())!;

    isLoading = false;
    notifyListeners();
  }
}
