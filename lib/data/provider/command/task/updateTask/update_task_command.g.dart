// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_task_command.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_UpdateTaskCommand _$$_UpdateTaskCommandFromJson(Map<String, dynamic> json) =>
    _$_UpdateTaskCommand(
      taskId: json['taskId'] as String,
      status: $enumDecodeNullable(_$TaskStatusEnumMap, json['status']),
      title: json['title'] as String?,
      deadline: json['deadline'] == null
          ? null
          : DateTime.parse(json['deadline'] as String),
      iconName: json['iconName'] as String?,
      assignedUserId: json['assignedUserId'] as String?,
    );

Map<String, dynamic> _$$_UpdateTaskCommandToJson(
        _$_UpdateTaskCommand instance) =>
    <String, dynamic>{
      'taskId': instance.taskId,
      'status': _$TaskStatusEnumMap[instance.status],
      'title': instance.title,
      'deadline': instance.deadline?.toIso8601String(),
      'iconName': instance.iconName,
      'assignedUserId': instance.assignedUserId,
    };

const _$TaskStatusEnumMap = {
  TaskStatus.todo: 'todo',
  TaskStatus.done: 'done',
};
