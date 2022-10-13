// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_note_command.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_CreateNoteCommand _$$_CreateNoteCommandFromJson(Map<String, dynamic> json) =>
    _$_CreateNoteCommand(
      teamId: json['teamId'] as String,
      title: json['title'] as String,
      content: json['content'] as String,
      modifiedByUserId: json['modifiedByUserId'] as String,
    );

Map<String, dynamic> _$$_CreateNoteCommandToJson(
        _$_CreateNoteCommand instance) =>
    <String, dynamic>{
      'teamId': instance.teamId,
      'title': instance.title,
      'content': instance.content,
      'modifiedByUserId': instance.modifiedByUserId,
    };
