// ignore: depend_on_referenced_packages
import 'package:collection/collection.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'team_event.freezed.dart';
part 'team_event.g.dart';

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
    DateTime? endTime,
    String? description,
    String? iconName,
  }) = _TeamEvent;

  factory TeamEvent.fromJson(Map<String, Object?> json) => _$TeamEventFromJson(json);
}

extension TeamEventProperties on TeamEvent {
  bool get isDayEvent => startTime.hour == 0 && endTime == null;
  DateTime get startDay => DateTime.utc(startTime.year, startTime.month, startTime.day);
  static bool equalsById(TeamEvent one, TeamEvent two) => one.id == two.id;
}

extension TeamEventList on List<TeamEvent> {
  Map<DateTime, List<TeamEvent>> groupByDay() {
    return groupListsBy<DateTime>((element) => element.startTime);
  }
}
