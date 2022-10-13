import 'package:freezed_annotation/freezed_annotation.dart';

part 'create_note_command.freezed.dart';
part 'create_note_command.g.dart';

@freezed
class CreateNoteCommand with _$CreateNoteCommand {
  const factory CreateNoteCommand({
    required String teamId,
    required String title,
    required String content,
    required String modifiedByUserId,
  }) = _CreateNoteCommand;

  factory CreateNoteCommand.fromJson(Map<String, dynamic> json) => _$CreateNoteCommandFromJson(json);
}
