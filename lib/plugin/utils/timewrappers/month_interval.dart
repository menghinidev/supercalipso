import 'interval.dart';
import 'month.dart';

class MonthInterval extends IntervalWrapper<Month> {
  @override
  final Month start;
  @override
  final Month end;

  MonthInterval({required this.start, required this.end});

  @override
  bool contains(Month wrapper) {
    var isAfterStart = wrapper.toDateTime().isAfter(start.toDateTime());
    var isBeforeEnd = wrapper.toDateTime().isBefore(end.toDateTime());
    return isAfterStart && isBeforeEnd;
  }

  @override
  bool cross(IntervalWrapper<TimeWrapper> wrapper) {
    var crossOnEdges = contains(wrapper.start as Month) || contains(wrapper.end as Month);
    var crossOnWrapperEdges = wrapper.contains(start) || wrapper.contains(end);
    var isContained = wrapper.start.isAfter(start) && wrapper.end.isBefore(end);
    var isWrapperContained = wrapper.start.isBefore(start) && wrapper.end.isAfter(end);
    return crossOnEdges || crossOnWrapperEdges || isContained || isWrapperContained;
  }

  @override
  Duration difference() => end.toDateTime().difference(start.toDateTime());

  @override
  String format() => start.format() + ' - ' + end.format();

  Iterator<Month> get iterator => MonthIntervalIterator(start: start, end: end);

  List<Month> get flat {
    var months = <Month>[];
    months.add(start);
    while (months.last.isBefore(end)) {
      months.add(months.last.increase(Month.standardMonthDuration) as Month);
    }
    return months;
  }
}

class MonthIntervalIterator extends Iterator<Month> {
  final Month start;
  final Month? end;

  late Month _current;

  MonthIntervalIterator({required this.start, this.end}) {
    _current = start;
  }

  @override
  Month get current => _current;

  @override
  bool moveNext() {
    var increased = _current.increase(Month.standardMonthDuration) as Month;
    if (end == null) {
      _current = increased;
      return true;
    }
    if (increased.isAfter(end!)) return false;
    _current = increased;
    return true;
  }
}
