import 'package:church/Services/MemberListService.dart';
import 'package:flutter/cupertino.dart';

import '../Model/MemberListModel.dart';

class MemberProvider extends ChangeNotifier {
  List<MemberListModel>? member = [];
  var isLoading = false;

  getMember() async {
    isLoading = true;

    member = (await MemberListService().getMember());

    isLoading = false;
    notifyListeners();
  }
}
