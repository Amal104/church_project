import 'dart:convert';
import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;
import '../Model/MemberListModel.dart';

class MemberListService {
  Future<List<MemberListModel>?> getMember() async {
    try {
      var response =
          await Dio().get('http://192.168.29.11:5000/mobile/members/list/');
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
}
