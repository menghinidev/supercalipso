// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'team_event.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_TeamEvent _$$_TeamEventFromJson(Map<String, dynamic> json) => _$_TeamEvent(
      id: json['id'] as String,
      name: json['name'] as String,
      startTime: DateTime.parse(json['startTime'] as String),
      description: json['description'] as String?,
      teamId: json['teamId'] as String,
      duration: json['duration'] == null
          ? Duration.zero
          : Duration(microseconds: json['duration'] as int),
    );

Map<String, dynamic> _$$_TeamEventToJson(_$_TeamEvent instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'startTime': instance.startTime.toIso8601String(),
      'description': instance.description,
      'teamId': instance.teamId,
      'duration': instance.duration?.inMicroseconds,
    };
