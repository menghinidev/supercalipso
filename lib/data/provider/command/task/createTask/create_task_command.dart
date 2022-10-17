import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:supercalipso/data/model/task/task.dart';

part 'create_task_command.freezed.dart';
part 'create_task_command.g.dart';

@freezed
class CreateTaskCommand with _$CreateTaskCommand {
  const CreateTaskCommand._();
  factory CreateTaskCommand({
    required String teamId,
    required String title,
    DateTime? deadline,
    String? iconName,
    String? assignedUserId,
  }) = _CreateTaskCommand;

  factory CreateTaskCommand.fromJson(Map<String, dynamic> json) => _$CreateTaskCommandFromJson(json);
}

extension CreateTaskCommandFeature on CreateTaskCommand {
  Task createTaskDTO(String id) => Task(
        id: id,
        title: title,
        assignedUserId: assignedUserId,
        teamId: teamId,
        deadline: deadline,
        iconName: iconName,
        status: TaskStatus.todo,
      );
}
