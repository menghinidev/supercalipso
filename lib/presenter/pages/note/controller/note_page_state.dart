import 'package:supercalipso/data/model/note/note.dart';

abstract class NotePageState {
  static NotePageState create(Note? initialNote) {
    if (initialNote != null) return ConsultingNotePageState(note: initialNote);
    return EditingNotePageState();
  }
}

class EditingNotePageState extends NotePageState {
  final String? title;
  final String? content;

  EditingNotePageState({this.title, this.content});
}

class ConsultingNotePageState extends NotePageState {
  final Note note;

  ConsultingNotePageState({required this.note});

  EditingNotePageState switchToEdit() => EditingNotePageState(
        title: note.title,
        content: note.description,
      );
}

extension NotePageStateExt on NotePageState {
  T on<T>({
    required T Function() defaultValue,
    T Function(EditingNotePageState state)? onEditing,
    T Function(ConsultingNotePageState state)? onReading,
  }) {
    var copyThis = this;
    if (copyThis is EditingNotePageState && onEditing != null) return onEditing(copyThis);
    if (copyThis is ConsultingNotePageState && onReading != null) return onReading(copyThis);
    return defaultValue();
  }
}
