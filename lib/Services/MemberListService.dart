import 'dart:convert';
import 'dart:developer';
import 'package:church/Constants.dart';
import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;
import '../Model/MemberListModel.dart';

class MemberListService {
  Future<List<MemberListModel>?> getMember() async {
    try {
      var response =
          await Dio().get('${baseUrl}mobile/members/list/');
      var json = response.data;
      List<MemberListModel>? data = List<MemberListModel>.from(
          json.map((x) => MemberListModel.fromJson(x)));
      print(data);
      return data;
    } catch (e) {
      print(e);
    }
    return null;
  }



  String url = '${baseUrl}mobile/members/list/';

  Future<List<MemberListModel>?> getAllmemberList() async {
    try {
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        // print(response.body);
        List<MemberListModel>? list = parseAgents(response.body);
        return list;
      } else {
        throw Exception('Error');
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  static List<MemberListModel> parseAgents(String responseBody) {
    final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
    return parsed.map<MemberListModel>((json) => MemberListModel.fromJson(json)).toList();
  }


}
