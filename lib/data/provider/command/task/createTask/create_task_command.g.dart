// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_task_command.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_CreateTaskCommand _$$_CreateTaskCommandFromJson(Map<String, dynamic> json) =>
    _$_CreateTaskCommand(
      teamId: json['teamId'] as String,
      title: json['title'] as String,
      deadline: json['deadline'] == null
          ? null
          : DateTime.parse(json['deadline'] as String),
      iconName: json['iconName'] as String?,
      assignedUserId: json['assignedUserId'] as String?,
    );

Map<String, dynamic> _$$_CreateTaskCommandToJson(
        _$_CreateTaskCommand instance) =>
    <String, dynamic>{
      'teamId': instance.teamId,
      'title': instance.title,
      'deadline': instance.deadline?.toIso8601String(),
      'iconName': instance.iconName,
      'assignedUserId': instance.assignedUserId,
    };
