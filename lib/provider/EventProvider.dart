import 'package:flutter/material.dart';

import '../Model/EventModel.dart';
import '../Services/EventService.dart';

class EventProvider extends ChangeNotifier {
  List<EventModel>? event = [];
  var isLoading = false;

  getEvent() async {
    isLoading = true;

    event = (await EventService().getEvent())!;

    isLoading = false;
    notifyListeners();
  }
}
