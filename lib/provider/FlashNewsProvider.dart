import 'package:flutter/material.dart';

import '../Model/FlashNewsModel.dart';
import '../Services/FlashNewsService.dart';

class FlashNewsProvider extends ChangeNotifier {

  List<FlashNewsModel>? flashnews = [];
  var isLoading = false;

  getFlashnews() async {
    isLoading = true;

     flashnews = (await FlashNewsService().getFlashNews())!;

     isLoading = false;
     notifyListeners();
  }

}