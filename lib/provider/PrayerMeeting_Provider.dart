import 'package:church/Services/PrayerMeeting_Services.dart';
import 'package:flutter/material.dart';

import '../Model/PrayerMeeting_Model.dart';

class PrayerMeetingProvider extends ChangeNotifier {
 

  List<PrayerMeetingModel>?  prayermeeting = [];
  bool loading = false;

  getPrayerMeeting() async {
    loading = true;
    
    prayermeeting = (await PrayerMeetingService().getPrayerMeeting())!;
    loading = false;

    notifyListeners();
  }
}
