import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:supercalipso/data/model/note/note.dart';

part 'create_note_command.freezed.dart';
part 'create_note_command.g.dart';

@freezed
class CreateNoteCommand with _$CreateNoteCommand {
  const CreateNoteCommand._();
  const factory CreateNoteCommand({
    required String teamId,
    required String title,
    required String content,
    required String modifiedByUserId,
  }) = _CreateNoteCommand;

  factory CreateNoteCommand.fromJson(Map<String, dynamic> json) => _$CreateNoteCommandFromJson(json);
}

extension CreateNoteCommandFeature on CreateNoteCommand {
  Note createNoteDTO(String id) => Note(
        id: id,
        title: title,
        description: content,
        lastUpdate: DateTime.now().toUtc(),
        modifiedByUserId: modifiedByUserId,
        teamId: teamId,
      );
}
