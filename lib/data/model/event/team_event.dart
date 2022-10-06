import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:supercalipso/data/model/team/team.dart';

part 'team_event.g.dart';
part 'team_event.freezed.dart';

@freezed
class TeamEvent with _$TeamEvent {
  const factory TeamEvent({
    required final String eventId,
    required final String name,
    required final DateTime startTime,
    final String? description,
    required final Team team,
    @Default(Duration.zero) final Duration? duration,
  }) = _TeamEvent;

  factory TeamEvent.fromJson(Map<String, Object?> json) => _$TeamEventFromJson(json);
}
