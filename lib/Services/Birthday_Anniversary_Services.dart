import 'package:church/Constants.dart';
import 'package:dio/dio.dart';

import '../Model/Birthday_Anniversary_Model.dart';

class BirthdayAnniversaryService {
  static final Dio dio = Dio();

  static Future<BirthdayAnniversaryModel> getEvent(DateTime date) async {
    try {
      final response = await dio.get("${baseUrl}member-events/birthday-anniversary?Date=$date");
      final data = response.data;

      BirthdayAnniversaryModel post = BirthdayAnniversaryModel.fromJson(data);
      print(post);
      return post;
    } catch (e) {
      throw Exception('Failed to load post: ${e.toString()}');
    }
  }
}