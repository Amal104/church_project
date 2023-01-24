import 'dart:convert';
import 'package:http/http.dart' as http;

import '../Model/CommitteeMembers.dart';

class TodoService {
  Future<List<CommitteeMembers>> getAll() async {
    const url = 'http://192.168.29.11:5000/mobile/committe-members/list';
    final uri = Uri.parse(url);
    final response = await http.get(uri);
    if (response.statusCode == 200) {
      final json = jsonDecode(response.body) as List;
      final todos = json.map((e) {
        return CommitteeMembers(
            id: e['id'],
            name: e['name'],
            email: e['email'],
            phoneNo: e['phoneNo'],
            organisation: e['organisation'],
            position: e['position']);
      }).toList();
      return todos;
    }
    return [];
  }
}
