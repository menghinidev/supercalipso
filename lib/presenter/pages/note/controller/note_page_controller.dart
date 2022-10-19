import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:supercalipso/bloc/auth/auth_provider.dart';
import 'package:supercalipso/bloc/note/note_service.dart';
import 'package:supercalipso/data/model/note/note.dart';
import 'package:supercalipso/data/repository/auth_repository.dart';
import 'package:supercalipso/plugin/utils.dart';
import 'package:supercalipso/presenter/components/dialog/confirm_dialog.dart';
import 'package:supercalipso/presenter/pages/note/controller/note_page_memento.dart';
import 'package:supercalipso/presenter/pages/note/controller/note_page_state.dart';
import 'package:supercalipso/services/modals/dialog/dialog_service.dart';
import 'package:supercalipso/services/navigation/router_provider.dart';

final notePageControllerProvider =
    StateNotifierProvider.family.autoDispose<NotePageNotifier, NotePageState, Note?>((ref, note) {
  return NotePageNotifier(
    noteService: ref.watch(noteServiceProvider),
    authRepo: ref.watch(authProvider),
    dialogService: ref.watch(dialogServiceProvider),
    router: ref.watch(routerProvider),
    initialNote: note,
  );
});

class NotePageNotifier extends StateNotifier<NotePageState> {
  final Note? initialNote;
  final NoteService noteService;
  final DialogService dialogService;
  final GoRouter router;
  final AuthRepository authRepo;
  late NotePageMementoStateOriginator originator;
  late NotePageMementoStateCaretaker caretaker;

  NotePageNotifier({
    required this.initialNote,
    required this.noteService,
    required this.dialogService,
    required this.router,
    required this.authRepo,
  }) : super(NotePageState.create(initialNote)) {
    originator = NotePageMementoStateOriginator(state);
    caretaker = NotePageMementoStateCaretaker(originator.saveToMemento());
  }

  editTitle(String? title) {
    var actualState = state;
    if (actualState is EditingNotePageState) {
      state = EditingNotePageState(title: title, content: actualState.content);
    }
  }

  editContent(String? content) {
    var actualState = state;
    if (actualState is EditingNotePageState) {
      state = EditingNotePageState(title: actualState.title, content: content);
    }
  }

  switchToEdit() {
    var actualState = state;
    if (actualState is ConsultingNotePageState) {
      state = actualState.switchToEdit();
    }
  }

  discard() {
    var actualState = state;
    if (actualState is EditingNotePageState && initialNote != null) {
      state = ConsultingNotePageState(note: initialNote!);
    }
  }

  Future save() async {
    var actualState = state;
    if (actualState is EditingNotePageState) {
      var isNew = initialNote == null;
      var confirm = await dialogService.showDialog(
        dialog: const ConfirmDialog(
          title: 'Confirm',
          textBody: 'This note will be available inside your Team',
        ),
      );
      if (confirm.hasDismissed) return Future.value();
      if (isNew) {
        return noteService
            .createNote(title: actualState.title!, content: actualState.content)
            .ifSuccess((payload) => router.pop());
      } else {
        return noteService
            .updateNote(noteId: initialNote!.id, content: actualState.content, title: actualState.title)
            .ifSuccess((payload) => router.pop());
      }
    }
  }

  Future delete() async {
    var id = state.on(defaultValue: () => null, onReading: (state) => state.note.id);
    if (id == null) return Future.value();
    var dialogResponse = await dialogService.showDialog(
      dialog: const ConfirmDialog(
        title: 'Are you sure',
        textBody: 'This note will be deleted',
      ),
    );
    if (dialogResponse.hasConfirmed) {
      return await noteService.deleteNote(noteId: id).ifSuccess((payload) => router.pop());
    }
    return Future.value();
  }

  __saveStep(NotePageState newState) {
    var mementoState = NotePageMementoState(newState);
    originator.changeState(mementoState.state);
    caretaker.saveMemento(mementoState);
    state = newState;
  }

  undo() {
    var backState = caretaker.rollback();
    originator.restoreFromMemento(backState);
    state = backState.state;
  }
}
