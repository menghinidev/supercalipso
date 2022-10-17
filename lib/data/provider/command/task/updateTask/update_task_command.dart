import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:supercalipso/data/model/task/task.dart';

part 'update_task_command.freezed.dart';
part 'update_task_command.g.dart';

@freezed
class UpdateTaskCommand with _$UpdateTaskCommand {
  const UpdateTaskCommand._();
  factory UpdateTaskCommand({
    required String taskId,
    String? title,
    DateTime? deadline,
    String? iconName,
    String? assignedUserId,
  }) = _UpdateTaskCommand;

  factory UpdateTaskCommand.fromJson(Map<String, dynamic> json) => _$UpdateTaskCommandFromJson(json);
}

extension UpdateTaskCommandFeature on UpdateTaskCommand {
  Task createTaskDTO(Task task) => task.copyWith(
        title: title ?? task.title,
        iconName: iconName ?? task.iconName,
        assignedUserId: assignedUserId,
        deadline: deadline,
      );
}
