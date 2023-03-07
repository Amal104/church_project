import 'package:dio/dio.dart';

import '../Constants.dart';
import '../Model/Contact_Us_Model.dart';

class ContactUsService {
  static final Dio dio = Dio();

  static Future<ContactUsModel?> getContactUs() async {
    ContactUsModel? result;
    try {
      final response = await dio.get("${baseUrl}mobile/contact-us/details");
      if (response.statusCode == 200) {
        final data = response.data;

        result = ContactUsModel.fromJson(data);
        print(result);
      } else {
        print("error");
      }
    } catch (e) {
      throw Exception('Failed to load post: ${e.toString()}');
    }
    return result;
  }
}
