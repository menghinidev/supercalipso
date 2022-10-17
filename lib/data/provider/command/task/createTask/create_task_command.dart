import 'package:freezed_annotation/freezed_annotation.dart';

part 'create_task_command.freezed.dart';
part 'create_task_command.g.dart';

@freezed
class CreateTaskCommand with _$CreateTaskCommand {
  factory CreateTaskCommand() = _CreateTaskCommand;

  factory CreateTaskCommand.fromJson(Map<String, dynamic> json) => _$CreateTaskCommandFromJson(json);
}
