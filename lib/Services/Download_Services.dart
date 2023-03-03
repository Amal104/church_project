
import 'package:church/Constants.dart';
import 'package:dio/dio.dart';

import '../Model/Download_Model.dart';


class DownloadService {
  Future<List<DownloadModel>?> getDownload() async {
    try {
      var response = await Dio().get(
        '${baseUrl}mobile/download/get-files',
        options: Options(
          headers: {"mobile": "application/json"},
        ),
      );
      var json = response.data;
      List<DownloadModel>? data = List<DownloadModel>.from(
          json.map((x) => DownloadModel.fromJson(x)));
      print(data);
      return data;
    } catch (e) {
      print(e);
    }
    return null;
  }
}
