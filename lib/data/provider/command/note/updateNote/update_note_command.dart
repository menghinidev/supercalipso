import 'package:freezed_annotation/freezed_annotation.dart';

part 'update_note_command.freezed.dart';
part 'update_note_command.g.dart';

@freezed
class UpdateNoteCommand with _$UpdateNoteCommand {
  factory UpdateNoteCommand({
    required String noteId,
    required String modifiedByUserId,
    required String teamId,
    String? title,
    String? content,
  }) = _UpdateNoteCommand;

  factory UpdateNoteCommand.fromJson(Map<String, dynamic> json) => _$UpdateNoteCommandFromJson(json);
}
