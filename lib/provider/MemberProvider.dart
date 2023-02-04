import 'dart:async';

import 'package:church/Services/MemberListService.dart';
import 'package:flutter/cupertino.dart';

import '../Model/MemberListModel.dart';

class MemberProvider extends ChangeNotifier {
  List<MemberListModel>? member = [];
  List<MemberListModel>? memberLists = [];
  final _debouncer = Debouncer();

  var isLoading = false;

  getMember() async {
    isLoading = true;

    member = (await MemberListService().getMember());

    isLoading = false;
    notifyListeners();
  }

  void searchMember() async {
    await MemberListService().getAllmemberList().then((value) {
      notifyListeners();
      member = value;
      notifyListeners();
      memberLists = member;
      notifyListeners();
    });
    notifyListeners();
  }

  search(String string) {
    return _debouncer.run(() {
      memberLists = member
          ?.where(
            (u) => (u.memberName.toLowerCase().contains(
                  string.toLowerCase(),
                )),
          )
          .toList();
      notifyListeners();
    });
  }
}

class Debouncer {
  int? milliseconds;
  VoidCallback? action;
  Timer? timer;

  run(VoidCallback action) {
    if (null != timer) {
      timer!.cancel();
    }
    timer = Timer(
      const Duration(milliseconds: Duration.millisecondsPerSecond),
      action,
    );
  }
}
