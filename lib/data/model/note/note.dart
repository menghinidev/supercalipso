import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:supercalipso/data/model/team/team.dart';
import 'package:supercalipso/data/model/user/user.dart';

part 'note.g.dart';
part 'note.freezed.dart';

@freezed
class Note with _$Note {
  const Note._();
  const factory Note({
    required String noteId,
    required String title,
    String? description,
    required User modifiedBy,
    required DateTime lastUpdate,
    required Team team,
  }) = _Note;

  factory Note.fromJson(Map<String, Object?> json) => _$NoteFromJson(json);
}
