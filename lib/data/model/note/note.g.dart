// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'note.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Note _$$_NoteFromJson(Map<String, dynamic> json) => _$_Note(
      id: json['id'] as String,
      title: json['title'] as String,
      description: json['description'] as String?,
      modifiedByUserId: json['modifiedByUserId'] as String,
      lastUpdate: DateTime.parse(json['lastUpdate'] as String),
      teamId: json['teamId'] as String,
    );

Map<String, dynamic> _$$_NoteToJson(_$_Note instance) => <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'description': instance.description,
      'modifiedByUserId': instance.modifiedByUserId,
      'lastUpdate': instance.lastUpdate.toIso8601String(),
      'teamId': instance.teamId,
    };
