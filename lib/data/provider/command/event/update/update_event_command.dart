import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:supercalipso/data/model/event/team_event.dart';

part 'update_event_command.freezed.dart';
part 'update_event_command.g.dart';

@freezed
class UpdateEventCommand with _$UpdateEventCommand {
  factory UpdateEventCommand({
    required String eventId,
    String? title,
    String? description,
    DateTime? startTime,
    DateTime? endTime,
    String? iconName,
  }) = _UpdateEventCommand;

  factory UpdateEventCommand.fromJson(Map<String, dynamic> json) => _$UpdateEventCommandFromJson(json);
}

extension UpdateEventCommandFeature on UpdateEventCommand {
  TeamEvent createEventDTO(TeamEvent event) {
    var newEvent = event.copyWith(
      description: description ?? event.description,
      endTime: endTime ?? event.endTime,
      name: title ?? event.name,
      startTime: startTime ?? event.startTime,
      iconName: iconName,
      lastUpdate: DateTime.now().toUtc(),
    );
    return newEvent;
  }
}
