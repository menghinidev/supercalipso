import 'package:duration/duration.dart';
import 'package:duration/locale.dart';
import 'timestamp.dart';
import 'package:intl/intl.dart';

abstract class TimeWrapper {
  DateTime toDateTime({TimeStamp? filler});
  Duration difference(TimeWrapper compare) => toDateTime().difference(compare.toDateTime());
  String formatDifference(TimeWrapper compare, {DurationTersity tersity = DurationTersity.minute}) => printDuration(
        difference(compare),
        locale: DurationLocale.fromLanguageCode('it')!,
        tersity: tersity,
      );
  int compareTo(TimeWrapper compare) => toDateTime().compareTo(compare.toDateTime());
  bool isAfter(TimeWrapper wrapper, {bool alsoEqual = true}) {
    if (alsoEqual) {
      return toDateTime().isAfter(wrapper.toDateTime()) || toDateTime().isAtSameMomentAs(wrapper.toDateTime());
    }
    return toDateTime().isAfter(wrapper.toDateTime());
  }

  bool isBefore(TimeWrapper wrapper, {bool alsoEqual = true}) {
    if (alsoEqual) {
      return toDateTime().isBefore(wrapper.toDateTime()) || toDateTime().isAtSameMomentAs(wrapper.toDateTime());
    }
    return toDateTime().isBefore(wrapper.toDateTime());
  }

  String format({DateFormat? formatter});
  TimeWrapper increase(Duration value);
  TimeWrapper decrease(Duration value);
}

abstract class IntervalWrapper<T extends TimeWrapper> {
  bool contains(T wrapper);
  T get start;
  T get end;
  Duration difference();
  bool cross(IntervalWrapper wrapper);
  String format();
}
