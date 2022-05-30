import 'date.dart';
import 'interval.dart';
import 'time.dart';
import 'package:intl/intl.dart';

class TimeStamp extends TimeWrapper {
  final DateTime value;

  TimeStamp({required this.value});

  factory TimeStamp.fromString(String datetime) => TimeStamp(value: DateTime.parse(datetime));

  static TimeStamp? tryParse(String? value) => value != null ? TimeStamp.fromString(value) : null;

  factory TimeStamp.fromDateAndTime(Date date, Time time) => TimeStamp(
        value: time.toDateTime(filler: TimeStamp(value: date.toDateTime())),
      );

  factory TimeStamp.now() => TimeStamp(value: DateTime.now().toUtc());

  Time get time => Time.fromDateTime(value);

  Date get day => Date.fromDateTime(value);

  @override
  String format({DateFormat? formatter, TimeStamp? filler}) => DateFormat.yMd().add_jm().format(value.toLocal());

  @override
  DateTime toDateTime({TimeStamp? filler}) => DateTime.parse(value.toIso8601String());

  @override
  TimeWrapper increase(Duration value) => TimeStamp(value: this.value.add(value));

  @override
  TimeWrapper decrease(Duration value) => TimeStamp(value: this.value.subtract(value));
}
