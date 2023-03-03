
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:open_filex/open_filex.dart';
import 'package:path_provider/path_provider.dart';
import '../Model/Download_Model.dart';
import '../Model/EventModel.dart';
import '../Services/Download_Services.dart';
import '../Services/EventService.dart';

class DownloadProvider extends ChangeNotifier {
  List<DownloadModel>? Download = [];
  var isLoading = false;

  getDownload() async {
    isLoading = true;

    Download = (await DownloadService().getDownload());

    isLoading = false;
    notifyListeners();
  }

  Future openFile({required String url, String? fileName}) async {
    final file = await downloadFile(url, fileName!);
    if (file == null) return;
    print('path: ${file.path}');
    OpenFilex.open(file.path);
  }

  Future<File?> downloadFile(String url, String name) async {
    final appStorage = await getApplicationDocumentsDirectory();
    final file = File('${appStorage.path}/$name');
    try {
      final response = await Dio().get(
        url,
        options: Options(
          responseType: ResponseType.bytes,
          followRedirects: false,
          receiveTimeout: 0,
        ),
      );
      final raf = file.openSync(mode: FileMode.write);
      raf.writeFromSync(response.data);
      await raf.close();
      return file;
    } catch (e) {
      return null;
    }
  }
}
