import 'dart:convert';
import 'dart:developer';
import 'package:church/Constants.dart';
import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;
import '../Model/CommitteeMembers.dart';

class CommitteeMemberService {
  Future<List<CommitteeMembers>?> getCommitteeMember() async {
    try {
      var response =
          await Dio().get('${baseUrl}mobile/committe-members/list');
      var json = response.data;
      List<CommitteeMembers>? data = List<CommitteeMembers>.from(
          json.map((x) => CommitteeMembers.fromJson(x)));
      print(data);
      return data;
    } catch (e) {
      log(e.toString());
    }
  }
}