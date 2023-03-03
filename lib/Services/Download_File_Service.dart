import 'dart:io';
import 'package:dio/dio.dart';
import 'package:path_provider/path_provider.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../values/values.dart';

Future<void> downloadFile(String url) async {
  Dio dio = Dio();
  try {
    // Get the application's external storage directory
    Directory? directory = await getExternalStorageDirectory();
    String filePath = '${directory!.path}/filename.pdf';

    // Download the file and save it to the downloads directory
    await dio.download(url, filePath);

    // Show a toast message to indicate that the file has been downloaded
    Fluttertoast.showToast(
        msg: "File downloaded to downloads folder",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: AppColor.purpleShade,
        textColor: AppColor.solidBlack,
        fontSize: 16.0
    );
  } catch (e) {
    // Handle errors here
    print(e);
  }
}
