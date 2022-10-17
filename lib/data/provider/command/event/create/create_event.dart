import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:supercalipso/data/model/event/team_event.dart';

part 'create_event.g.dart';
part 'create_event.freezed.dart';

@freezed
class CreateEventCommand with _$CreateEventCommand {
  const CreateEventCommand._();

  const factory CreateEventCommand({
    required String teamId,
    required String name,
    required DateTime startTime,
    required String createdByUserId,
    String? description,
    String? iconName,
    DateTime? endTime,
  }) = _CreateEventCommand;

  factory CreateEventCommand.fromJson(Map<String, Object?> json) => _$CreateEventCommandFromJson(json);
}

extension CreateEventCommandFeatures on CreateEventCommand {
  TeamEvent createEventDTO(String id) => TeamEvent(
        id: id,
        name: name,
        startTime: startTime,
        endTime: endTime,
        description: description,
        teamId: teamId,
        createdByUserId: createdByUserId,
        lastUpdate: DateTime.now().toUtc(),
        iconName: iconName,
      );
}
