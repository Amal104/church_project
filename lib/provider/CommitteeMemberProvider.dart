import 'package:flutter/material.dart';

import '../Model/CommitteeMembers.dart';
import '../Services/CommitteeMemberService.dart';

class CommitteeMemberProvider extends ChangeNotifier {

  List<CommitteeMembers>? member = [];
  var isLoading = false;

  getCommitteeMember() async {
    isLoading = true;

     member = (await CommitteeMemberService().getCommitteeMember());

     isLoading = false;
     notifyListeners();
  }

}