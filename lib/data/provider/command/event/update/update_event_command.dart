import 'package:freezed_annotation/freezed_annotation.dart';

part 'update_event_command.freezed.dart';
part 'update_event_command.g.dart';

@freezed
class UpdateEventCommand with _$UpdateEventCommand {
  factory UpdateEventCommand({
    required String eventId,
    String? title,
    String? description,
    DateTime? startTime,
    Duration? duration,
  }) = _UpdateEventCommand;

  factory UpdateEventCommand.fromJson(Map<String, dynamic> json) => _$UpdateEventCommandFromJson(json);
}
