import 'package:church/Model/AnnoucementModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class AnnoucementDetails extends StatelessWidget {
  const AnnoucementDetails(
      {super.key, required this.title, required this.body, required this.item});

  final String title;
  final String body;
  final AnnouncementModel item;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            SizedBox(
              height: size.height * 0.1,
            ),
            Hero(
              tag: item,
              child: Text(title),
            ),
            SizedBox(
              height: size.height * 0.1,
            ),
            Text(
              body,
              textAlign: TextAlign.justify,
            ),
          ],
        ),
      ),
    );
  }
}
