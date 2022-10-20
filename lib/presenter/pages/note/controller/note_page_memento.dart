import 'package:supercalipso/plugin/utils.dart';
import 'package:supercalipso/presenter/pages/note/controller/note_page_state.dart';

class NotePageMementoState extends MementoState<NotePageState> {
  NotePageMementoState(super.state);
}

class NotePageMementoStateCaretaker extends MementoStateCaretaker<NotePageState> {
  NotePageMementoStateCaretaker(super.mementoState);
}

class NotePageMementoStateOriginator extends MementoStateOriginator<NotePageState> {
  NotePageMementoStateOriginator(super.state);

  @override
  MementoState<NotePageState> saveToMemento() => NotePageMementoState(state);
}
