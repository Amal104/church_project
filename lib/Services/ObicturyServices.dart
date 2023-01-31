import 'dart:convert';
import 'dart:developer';
import 'package:dio/dio.dart';
import '../Model/ObicturyModel.dart';
import 'package:http/http.dart' as http;

class ObicturyService {
//   Future<List<ObicturyModel>> getObictury() async {
//     const url = 'http://192.168.29.11:5000/mobile/obituary/list';
//     final uri = Uri.parse(url);
//     final response = await http.get(uri);
//     if (response.statusCode == 200) {
//       final json = jsonDecode(response.body) as List;
//       final obictury = json.map((e) {
//         return ObicturyModel(
//           id: e['id'],
//           date: e['date'],
//           member: e['member'],
//         );
//       }).toList();
//       return obictury;
//     }
//     return [];
//   }

  Future<List<ObicturyModel>?> getObictury() async {
    try {
      var response = await Dio().get('http://192.168.29.11:5000/mobile/obituary/list');
      var json = response.data;
      List<ObicturyModel>? data =
          List<ObicturyModel>.from(json.map((x) => ObicturyModel.fromJson(x)));
      print(data);
      return data;
    } catch (e) {
      print(e);
    }
  }
}
