import 'package:church/Model/VicarMessage.dart';
import 'package:church/Services/VicarMessage.dart';
import 'package:flutter/cupertino.dart';

class VicarMessageProvider extends ChangeNotifier {

   VicarMessageModel? vicar;
  //  VicarMessageModel? asivicar;
  bool loading = false;

  getVicarMessage() async {
    loading = true;

    vicar = (await VicarMessageService().vicarMessage());
    
    loading = false;
    notifyListeners();
  }

  // getAsiVicarMessage() async {
  //   loading = true;

  //   asivicar = (await VicarMessageService().asiVicarMessage());

  //   loading = false;
  //   notifyListeners();
  // }

}