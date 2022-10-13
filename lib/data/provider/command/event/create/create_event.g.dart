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
      duration: Duration(microseconds: json['duration'] as int),
      description: json['description'] as String?,
    );

Map<String, dynamic> _$$_CreateEventCommandToJson(
        _$_CreateEventCommand instance) =>
    <String, dynamic>{
      'teamId': instance.teamId,
      'name': instance.name,
      'startTime': instance.startTime.toIso8601String(),
      'duration': instance.duration.inMicroseconds,
      'description': instance.description,
    };
