// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_event.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_CreateEventCommand _$$_CreateEventCommandFromJson(
        Map<String, dynamic> json) =>
    _$_CreateEventCommand(
      teamId: json['teamId'] as String,
      name: json['name'] as String,
      startTime: DateTime.parse(json['startTime'] as String),
      createdByUserId: json['createdByUserId'] as String,
      description: json['description'] as String?,
      iconName: json['iconName'] as String?,
      endTime: json['endTime'] == null
          ? null
          : DateTime.parse(json['endTime'] as String),
    );

Map<String, dynamic> _$$_CreateEventCommandToJson(
        _$_CreateEventCommand instance) =>
    <String, dynamic>{
      'teamId': instance.teamId,
      'name': instance.name,
      'startTime': instance.startTime.toIso8601String(),
      'createdByUserId': instance.createdByUserId,
      'description': instance.description,
      'iconName': instance.iconName,
      'endTime': instance.endTime?.toIso8601String(),
    };
