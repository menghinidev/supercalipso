import 'package:supercalipso/data/model/task/builder/task_builder.dart';
import 'package:supercalipso/data/model/task/task.dart';
import 'package:supercalipso/data/model/user/user.dart';

abstract class TaskPageState {
  static TaskPageState create(Task? initialTask, List<User>? assignedUsers) {
    if (initialTask != null) return ConsultingTaskPageState(task: initialTask, assignedUsers: assignedUsers);
    return EditingTaskPageState(builder: TaskBuilder());
  }
}

class EditingTaskPageState extends TaskPageState {
  final TaskBuilder builder;

  EditingTaskPageState({required this.builder});
}

class ConsultingTaskPageState extends TaskPageState {
  final Task task;
  final List<User>? assignedUsers;

  ConsultingTaskPageState({required this.task, this.assignedUsers});

  EditingTaskPageState switchToEdit() => EditingTaskPageState(
        builder: TaskBuilder(),
      );
}

extension TaskPageStateExt on TaskPageState {
  T on<T>({
    required T Function() defaultValue,
    T Function(EditingTaskPageState state)? onEditing,
    T Function(ConsultingTaskPageState state)? onReading,
  }) {
    var copyThis = this;
    if (copyThis is EditingTaskPageState && onEditing != null) return onEditing(copyThis);
    if (copyThis is ConsultingTaskPageState && onReading != null) return onReading(copyThis);
    return defaultValue();
  }
}
