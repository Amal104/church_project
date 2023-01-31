import 'package:dio/dio.dart';
import '../Model/AnnoucementModel.dart';

class AnnoucementService {
  Future<List<AnnouncementModel>?> getAnnoucement() async {
    try {
      var response = await Dio().get(
        'http://192.168.29.11:5000/mobile/announcement/get-announcement',
        options: Options(
          headers: {"mobile": "application/json"},
        ),
      );
      var json = response.data;
      List<AnnouncementModel>? data = List<AnnouncementModel>.from(
          json.map((x) => AnnouncementModel.fromJson(x)));
      print(data);
      return data;
    } catch (e) {
      print(e);
    }
    return null;
  }
}
