import 'date_interval.dart';
import 'interval.dart';
import 'timestamp.dart';
import 'package:intl/intl.dart';
import 'week_day.dart';

class Date extends TimeWrapper {
  final int year;
  final int month;
  final int day;

  factory Date.fromDateTime(DateTime dateTime) => Date(
        year: dateTime.year,
        month: dateTime.month,
        day: dateTime.day,
      );

  factory Date.fromString(String date, {String pattern = 'yyyy-MM-ddTHH:mm:ssZ'}) {
    var datetime = DateFormat(pattern).parse(date);
    return Date(year: datetime.year, month: datetime.month, day: datetime.day);
  }

  factory Date.today() {
    var now = TimeStamp.now();
    var baseType = now.value;
    return Date(day: baseType.day, month: baseType.month, year: baseType.year);
  }

  Date({required this.year, required this.month, required this.day});

  @override
  String format({DateFormat? formatter}) => DateFormat.yMd().format(toDateTime());

  @override
  DateTime toDateTime({TimeStamp? filler}) {
    if (filler == null) {
      return DateTime.utc(year, month, day, 0, 0, 0);
    }
    return DateTime.utc(
      year,
      month,
      day,
      filler.toDateTime().hour,
      filler.toDateTime().minute,
      filler.toDateTime().second,
    );
  }

  @override
  TimeWrapper increase(Duration value) => Date.fromDateTime(toDateTime().add(value));

  @override
  TimeWrapper decrease(Duration value) => Date.fromDateTime(toDateTime().subtract(value));
}

extension DateProperties on Date {
  WeekDay get weekDay => WeekDay.values[toDateTime().toUtc().weekday - 1];
  bool get isToday => DateTime.now().toUtc().day == day;
  bool areInTheSameDay(Date date) => date.compareTo(this) == 0;
  Date firstNextMonth() {
    var time = toDateTime();
    var currentMonth = time.month;
    while (currentMonth == time.month) {
      time = time.add(const Duration(days: 1));
    }
    return Date.fromDateTime(time);
  }

  Date lastOfMonth() {
    var time = toDateTime();
    var currentMonth = time.month;
    DateTime temp;
    while (currentMonth == time.month) {
      temp = time.add(const Duration(days: 1));
      if (temp.month != currentMonth) {
        return Date.fromDateTime(temp);
      }
      time = time.add(const Duration(days: 1));
    }
    return Date.fromDateTime(time);
  }

  DateInterval get weekMonSun {
    var startWeek = decrease(Duration(days: weekDay.index));
    return DateInterval(start: startWeek as Date, end: startWeek.increase(const Duration(days: 7)) as Date);
  }

  DateInterval get daysInMonth {
    var start = Date(year: year, month: month, day: 1);
    return DateInterval(start: start, end: lastOfMonth());
  }

  Date firstPreviousMonth() {
    var time = toDateTime();
    var currentMonth = time.month;
    while (currentMonth == time.month) {
      time = time.subtract(const Duration(days: 1));
    }
    return Date.fromDateTime(time);
  }

  Date nextYear() => increase(const Duration(days: 365)) as Date;
}
