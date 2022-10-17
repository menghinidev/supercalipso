import 'package:freezed_annotation/freezed_annotation.dart';

part 'update_task_command.freezed.dart';
part 'update_task_command.g.dart';

@freezed
class UpdateTaskCommand with _$UpdateTaskCommand {
  factory UpdateTaskCommand() = _UpdateTaskCommand;

  factory UpdateTaskCommand.fromJson(Map<String, dynamic> json) => _$UpdateTaskCommandFromJson(json);
}
