// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'note.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Note _$$_NoteFromJson(Map<String, dynamic> json) => _$_Note(
      noteId: json['noteId'] as String,
      title: json['title'] as String,
      description: json['description'] as String?,
      modifiedBy: User.fromJson(json['modifiedBy'] as Map<String, dynamic>),
      lastUpdate: DateTime.parse(json['lastUpdate'] as String),
      team: Team.fromJson(json['team'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_NoteToJson(_$_Note instance) => <String, dynamic>{
      'noteId': instance.noteId,
      'title': instance.title,
      'description': instance.description,
      'modifiedBy': instance.modifiedBy,
      'lastUpdate': instance.lastUpdate.toIso8601String(),
      'team': instance.team,
    };
