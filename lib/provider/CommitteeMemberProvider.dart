import 'package:flutter/material.dart';

import '../Model/CommitteeMembers.dart';
import '../Services/CommitteeMemberService.dart';

class CommitteeMemberProvider extends ChangeNotifier {
  final _service = TodoService();
  bool isLoading = false;
  List<CommitteeMembers> _todos = [];
  List<CommitteeMembers> get todos => _todos;

  Future<void> getAllTodos() async {
    isLoading = true;
    notifyListeners();

    final response = await _service.getAll();

    _todos = response;
    isLoading = false;
    notifyListeners();
  }
}
