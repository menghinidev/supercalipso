import 'package:rxdart/rxdart.dart';
import 'package:supercalipso/data/model/note/note.dart';
import 'package:supercalipso/data/provider/api/note/i_note_data_source.dart';
import 'package:supercalipso/data/provider/api/note/mocked_data_source.dart';
import 'package:supercalipso/data/provider/command/note/createNote/create_note_command.dart';
import 'package:supercalipso/plugin/utils.dart';
import 'package:supercalipso/services/installer.dart';

class NoteRepository {
  var dataProvider = Installer.instance.get<INoteDataSource>();
  var controller = BehaviorSubject<List<Note>>();

  Stream<List<Note>> get notesChanges => controller.stream;
  Stream<List<Note>> getTeamNotesChanges({required String teamId}) =>
      notesChanges.map((event) => event.where((element) => element.team.id == teamId).toList());
  Stream<Note> getNoteChanges({required String noteId}) =>
      controller.stream.mapNotNull((event) => event.getWhere((element) => element.noteId == noteId));

  Future<Response<List<Note>>> getTeamNotes({required String teamId}) async {
    return await dataProvider.readTeamNotes(teamId: teamId);
  }

  Future<Response<List<Note>>> getUserNotes({required String userId}) async {
    return await dataProvider.readUserNotes(userId: userId).ifSuccess((payload) => controller.add(payload!));
  }

  Future<Response> createNote({
    required String teamId,
    required String userId,
    required String title,
    required String content,
  }) async {
    var command = CreateNoteCommand(
      teamId: teamId,
      title: title,
      content: content,
      modifiedByUserId: userId,
    );
    return await dataProvider.createNote(command: command).ifSuccess((payload) => getUserNotes(userId: userId));
  }

  Future<Response> deleteNote({required String noteId}) async {
    var noteResponse = await dataProvider.readNote(noteId: noteId);
    if (noteResponse.isError) return noteResponse;
    var note = noteResponse.payload!;
    return await dataProvider
        .deleteNote(noteId: noteId)
        .ifSuccess((payload) => getUserNotes(userId: note.modifiedBy.uid));
  }
}
