import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class GetDateState {
  GetDateState._();

  String currentDate = '';


  static String getCurrentDate() {
    var today = DateTime.now();
    var dateFormat = DateFormat('${today.day}-${today.month}-${today.year}');
    String dats = dateFormat.format(today);
    return dats;
  }

  static String getStartTimeRange(BuildContext context, TimeOfDay timeOfDay){
    var time = timeOfDay;
    var timeFormat = TimeOfDay(hour: time.hour, minute: time.minute);
    String timst = timeFormat.format(context);
    return timst;
  }



  static String getEndTimeRange(BuildContext context, TimeOfDay timeOfDay){
    var endtime = timeOfDay;
    var timeFormat = TimeOfDay(hour: endtime.hour, minute: endtime.minute);
    String timend = timeFormat.format(context);
    return timend;
  }

}
