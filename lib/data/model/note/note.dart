import 'package:freezed_annotation/freezed_annotation.dart';

part 'note.g.dart';
part 'note.freezed.dart';

@freezed
class Note with _$Note {
  const Note._();
  const factory Note({
    required String id,
    required String title,
    String? description,
    required String modifiedByUserId,
    required DateTime lastUpdate,
    required String teamId,
  }) = _Note;

  factory Note.fromJson(Map<String, Object?> json) => _$NoteFromJson(json);
}
