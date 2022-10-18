import 'package:freezed_annotation/freezed_annotation.dart';

part 'task_builder.freezed.dart';

@freezed
class TaskBuilder with _$TaskBuilder {
  const TaskBuilder._();
  factory TaskBuilder({
    String? title,
    DateTime? deadline,
    String? assignedUserId,
    String? iconName,
  }) = _TaskBuilder;
}

extension TaskBuilderFeatures on TaskBuilder {
  bool get canBuild => title != null;
}
