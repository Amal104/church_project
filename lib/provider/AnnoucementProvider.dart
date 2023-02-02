import 'package:flutter/material.dart';

import '../Model/AnnoucementModel.dart';
import '../Services/AnnoucementService.dart';

class AnnouncementProvider extends ChangeNotifier {
  List<AnnouncementModel>? annoucement = [];
  var isLoading = false;

  getAnnoucement() async {
    isLoading = true;

    annoucement = (await AnnoucementService().getAnnoucement())!;

    isLoading = false;
    notifyListeners();
  }
}
