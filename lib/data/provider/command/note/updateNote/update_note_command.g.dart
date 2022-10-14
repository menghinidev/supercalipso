// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_note_command.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_UpdateNoteCommand _$$_UpdateNoteCommandFromJson(Map<String, dynamic> json) =>
    _$_UpdateNoteCommand(
      noteId: json['noteId'] as String,
      modifiedByUserId: json['modifiedByUserId'] as String,
      teamId: json['teamId'] as String,
      title: json['title'] as String?,
      content: json['content'] as String?,
    );

Map<String, dynamic> _$$_UpdateNoteCommandToJson(
        _$_UpdateNoteCommand instance) =>
    <String, dynamic>{
      'noteId': instance.noteId,
      'modifiedByUserId': instance.modifiedByUserId,
      'teamId': instance.teamId,
      'title': instance.title,
      'content': instance.content,
    };
