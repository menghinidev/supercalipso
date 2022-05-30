enum WeekDay { monday, tuesday, wednesday, thursday, friday, saturday, sunday }

class WeekDayConverter {
  static final Map<WeekDay, String> _converter = {
    WeekDay.monday: 'Monday',
    WeekDay.tuesday: 'Tuesday',
    WeekDay.wednesday: 'Wednesday',
    WeekDay.thursday: 'Thursday',
    WeekDay.friday: 'Friday',
    WeekDay.saturday: 'Saturday',
    WeekDay.sunday: 'Sunday',
  };

  static WeekDay parse(String value) {
    return _converter.entries.firstWhere((element) => element.value == value).key;
  }

  static String convertToString(WeekDay day) => _converter[day] ?? '';
}
