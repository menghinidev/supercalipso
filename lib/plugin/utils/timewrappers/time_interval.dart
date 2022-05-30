import 'date.dart';
import 'interval.dart';
import 'time.dart';
import 'timestamp.dart';
import 'timestamp_interval.dart';

class TimeInterval with IntervalWrapper<Time> {
  @override
  final Time start;

  @override
  final Time end;

  TimeInterval({required this.start, required this.end});

  factory TimeInterval.fromJSON(dynamic json) {
    return TimeInterval(
      start: Time.fromString(json['startTime']),
      end: Time.fromString(json['endTime']),
    );
  }

  @override
  bool contains(Time wrapper) => start.compareTo(wrapper) <= 0 && end.compareTo(wrapper) >= 0;

  @override
  Duration difference() => end.difference(start);

  @override
  bool cross(IntervalWrapper<TimeWrapper> wrapper) {
    var crossStart = wrapper.contains(start);
    var crossEnd = wrapper.contains(end);
    var crossOtherStart = contains(wrapper.start as Time);
    var crossOtherEnd = contains(wrapper.end as Time);
    return crossStart || crossEnd || crossOtherStart || crossOtherEnd;
  }

  @override
  String format() => start.format() + ' - ' + end.format();

  bool isValid() => start.isBefore(end);

  TimeStampInterval toTimeStampInterval(Date date) => TimeStampInterval(
        start: TimeStamp.fromDateAndTime(date, start),
        end: TimeStamp.fromDateAndTime(date, end),
      );

  TimeInterval copyWith({Time? newStart, Time? newEnd}) => TimeInterval(start: newStart ?? start, end: newEnd ?? end);
}
