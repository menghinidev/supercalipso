import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:collection/collection.dart';
part 'team_event.g.dart';
part 'team_event.freezed.dart';

@freezed
class TeamEvent with _$TeamEvent {
  const TeamEvent._();
  const factory TeamEvent({
    required String id,
    required String name,
    required DateTime startTime,
    required String teamId,
    required String createdByUserId,
    required DateTime lastUpdate,
    String? description,
    @Default(Duration.zero) Duration? duration,
  }) = _TeamEvent;

  factory TeamEvent.fromJson(Map<String, Object?> json) => _$TeamEventFromJson(json);
}

extension TeamEventProperties on TeamEvent {
  DateTime? get endTime => duration != null ? startTime.add(duration!) : null;
  bool get isDayEvent => duration == null && startTime.hour == 0;
  DateTime get day => DateTime.utc(startTime.year, startTime.month, startTime.day);
}

extension TeamEventList on List<TeamEvent> {
  Map<DateTime, List<TeamEvent>> groupByDay() {
    return groupListsBy<DateTime>((element) => element.startTime);
  }
}
