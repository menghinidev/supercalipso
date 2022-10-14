// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Task _$$_TaskFromJson(Map<String, dynamic> json) => _$_Task(
      id: json['id'] as String,
      title: json['title'] as String,
      assignedUserId: json['assignedUserId'] as String,
      teamId: json['teamId'] as String,
      lastStatusUpdate: DateTime.parse(json['lastStatusUpdate'] as String),
      description: json['description'] as String?,
      status: $enumDecodeNullable(_$TaskStatusEnumMap, json['status']) ??
          TaskStatus.todo,
    );

Map<String, dynamic> _$$_TaskToJson(_$_Task instance) => <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'assignedUserId': instance.assignedUserId,
      'teamId': instance.teamId,
      'lastStatusUpdate': instance.lastStatusUpdate.toIso8601String(),
      'description': instance.description,
      'status': _$TaskStatusEnumMap[instance.status]!,
    };

const _$TaskStatusEnumMap = {
  TaskStatus.todo: 'todo',
  TaskStatus.doing: 'doing',
  TaskStatus.done: 'done',
};
