import 'package:intl/intl.dart';
import 'interval.dart';
import 'timestamp.dart';

class Month extends TimeWrapper {
  final int month;
  final int year;

  Month({required this.month, required this.year});

  static Duration get standardMonthDuration => const Duration(days: 31);

  factory Month.fromDatetime(DateTime time) {
    return Month(month: time.month, year: time.year);
  }

  @override
  TimeWrapper decrease(Duration value) {
    var monthsToIncrease = value.inDays / standardMonthDuration.inDays;
    var yearsToIncrease = monthsToIncrease / 12;
    return Month(month: (month - monthsToIncrease).toInt(), year: (year - yearsToIncrease).toInt());
  }

  @override
  String format({DateFormat? formatter}) => DateFormat.yMMMM().format(toDateTime());

  @override
  TimeWrapper increase(Duration value) {
    var totalTimeInMonth = value.inDays ~/ standardMonthDuration.inDays;
    var monthToIncrease = totalTimeInMonth % 12;
    var yearsToIncrease = totalTimeInMonth ~/ 12;
    var newMonth = month + monthToIncrease;
    var newYear = year + yearsToIncrease;
    if (newMonth > 12) {
      newMonth -= 12;
      newYear++;
    }
    return Month(month: newMonth, year: newYear);
  }

  @override
  DateTime toDateTime({TimeStamp? filler}) => DateTime.utc(year, month);

  @override
  bool operator ==(other) => other is Month && month == other.month && year == other.year;

  @override
  int get hashCode => int.parse(month.toString() + year.toString());
}
