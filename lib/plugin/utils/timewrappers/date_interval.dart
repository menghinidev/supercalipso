import 'date.dart';
import 'interval.dart';

class DateInterval with IntervalWrapper<Date> {
  @override
  final Date start;

  @override
  final Date end;

  DateInterval({required this.start, required this.end});

  factory DateInterval.fromJson(dynamic json) {
    return DateInterval(start: json['startDate'], end: json['endDate']);
  }

  @override
  bool contains(Date wrapper) => start.compareTo(wrapper) <= 0 && end.compareTo(wrapper) >= 0;

  @override
  Duration difference() => end.difference(start);

  @override
  bool cross(IntervalWrapper<TimeWrapper> wrapper) {
    var crossStart = wrapper.contains(start);
    var crossEnd = wrapper.contains(end);
    var crossOtherStart = contains(wrapper.start as Date);
    var crossOtherEnd = contains(wrapper.end as Date);
    return crossStart || crossEnd || crossOtherStart || crossOtherEnd;
  }

  @override
  String format() => start.format() + ' - ' + end.format();

  Date operator [](int index) => start.increase(Duration(days: index)) as Date;

  DateInterval copyWith({Date? newStart, Date? newEnd}) => DateInterval(start: newStart ?? start, end: newEnd ?? end);
}
