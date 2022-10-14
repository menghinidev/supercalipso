// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_event_command.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_UpdateEventCommand _$$_UpdateEventCommandFromJson(
        Map<String, dynamic> json) =>
    _$_UpdateEventCommand(
      eventId: json['eventId'] as String,
      title: json['title'] as String?,
      description: json['description'] as String?,
      startTime: json['startTime'] == null
          ? null
          : DateTime.parse(json['startTime'] as String),
      duration: json['duration'] == null
          ? null
          : Duration(microseconds: json['duration'] as int),
    );

Map<String, dynamic> _$$_UpdateEventCommandToJson(
        _$_UpdateEventCommand instance) =>
    <String, dynamic>{
      'eventId': instance.eventId,
      'title': instance.title,
      'description': instance.description,
      'startTime': instance.startTime?.toIso8601String(),
      'duration': instance.duration?.inMicroseconds,
    };
