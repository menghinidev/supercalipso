import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

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
