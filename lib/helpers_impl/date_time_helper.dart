

import '../core/helpers/my_date_time.dart';

class DateTimeHelper extends MyDateTime {
  @override
  String getMonthName(int month) {
    return allMonths.elementAt(month - 1).value;
  }

  @override
  String getWeekDayName(int day) {
    return allDays.elementAt(day).value;
  }
}
