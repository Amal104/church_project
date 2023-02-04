
import 'package:church/Services/ObicturyServices.dart';
import 'package:flutter/material.dart';

import '../Model/ObicturyModel.dart';

class ObicturyProvider extends ChangeNotifier {
 

  List<ObicturyModel>?  obictury;
  bool loading = false;

  getObituary() async {
    loading = true;
    
    obictury = (await ObicturyService().getObictury())!;
    loading = false;

    notifyListeners();
  }
}
