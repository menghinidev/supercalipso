import 'package:freezed_annotation/freezed_annotation.dart';

part 'task.freezed.dart';
part 'task.g.dart';

@freezed
class Task with _$Task {
  const Task._();
  factory Task({
    required String id,
    required String title,
    required String assignedUserId,
    required String teamId,
    required DateTime lastStatusUpdate,
    String? iconName,
    @Default(TaskStatus.todo) TaskStatus status,
  }) = _Task;

  factory Task.fromJson(Map<String, dynamic> json) => _$TaskFromJson(json);
}

enum TaskStatus { todo, done }
