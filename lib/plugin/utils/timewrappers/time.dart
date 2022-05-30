import 'package:intl/intl.dart';
import 'interval.dart';
import 'timestamp.dart';

class Time extends TimeWrapper {
  final int hour;
  final int minute;
  final int seconds;
  final bool _local;

  factory Time.fromDateTime(DateTime time, {bool? keepLocal}) => Time(
        hour: time.hour,
        minute: time.minute,
        seconds: time.second,
        local: keepLocal ?? !time.isUtc,
      );

  factory Time.now() {
    var now = DateTime.now().toUtc();
    return Time(hour: now.hour, minute: now.minute);
  }

  factory Time.fromString(String time, {String divider = ':', bool local = true}) {
    var decomposed = time.split(divider);
    if (time.length < 2) return Time(hour: 0, minute: 0);
    return Time(
      hour: int.parse(decomposed[0]),
      minute: int.parse(decomposed[1]),
      seconds: time.length == 3 ? int.parse(decomposed[2]) : 0,
      local: local,
    );
  }

  Time({required this.hour, required this.minute, this.seconds = 0, bool local = true}) : _local = local;

  @override
  String format({DateFormat? formatter}) {
    var form = formatter ?? DateFormat.jm();
    return form.format(toDateTime().toLocal());
  }

  @override
  DateTime toDateTime({TimeStamp? filler, bool keepLocal = false}) {
    filler ??= TimeStamp.now();
    if (_local) return DateTime(filler.day.year, filler.day.month, filler.day.day, hour, minute);
    var utcTime = DateTime.utc(filler.day.year, filler.day.month, filler.day.day, hour, minute);
    return utcTime;
  }

  @override
  TimeWrapper increase(Duration value) => Time.fromDateTime(
        toDateTime().add(value),
        keepLocal: _local,
      );

  @override
  TimeWrapper decrease(Duration value) => Time.fromDateTime(
        toDateTime().subtract(value),
        keepLocal: _local,
      );
}
