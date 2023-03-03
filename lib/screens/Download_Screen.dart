import 'package:church/Extensions/StringExtension.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import '../Services/Download_File_Service.dart';
import '../provider/Download_Provider.dart';
import '../values/AppBar.dart';
import '../values/AppTitle.dart';
import '../values/values.dart';

class DownloadScreen extends StatefulWidget {
  const DownloadScreen({super.key});

  @override
  State<DownloadScreen> createState() => _DownloadScreenState();
}

class _DownloadScreenState extends State<DownloadScreen> {
  @override
  void initState() {
    super.initState();
    final download = Provider.of<DownloadProvider>(context, listen: false);
    download.getDownload();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: AppColor.solidWhite,
      appBar: CustomAppBar.customAppBarIcon(),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: MediaQuery.of(context).size.width / 20,
                  ),
                  child: const AppTitle(title: "Downloads")),
              SizedBox(
                height: size.height * 0.04,
              ),
              Consumer<DownloadProvider>(
                builder: (context, provider, child) {
                  return provider.isLoading != true
                      ? ListView.builder(
                          shrinkWrap: true,
                          itemCount: provider.Download!.length,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: size.width * 0.035,
                                  vertical: size.height * 0.005),
                              child: Card(
                                elevation: 3,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20)
                              ),
                                child: ListTile(
                                  onTap: () {
                                    provider.openFile(
                                      url: provider.Download![index].upload,
                                      fileName: "${provider.Download![index].title}.pdf",
                                    );
                                  },
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(15)),
                                  tileColor: AppColor.lightGreyShade,
                                  leading:
                                      const FaIcon(FontAwesomeIcons.filePdf),
                                  title: Text(provider.Download![index].title),
                                  trailing:
                                      const FaIcon(FontAwesomeIcons.download),
                                ),
                              ),
                            );
                          },
                        )
                      : const CircularProgressIndicator();
                },
              ),
              SizedBox(
                height: size.height * 0.06,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
