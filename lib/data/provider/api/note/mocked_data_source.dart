import 'package:supercalipso/data/model/note/note.dart';
import 'package:supercalipso/data/model/team/team.dart';
import 'package:supercalipso/data/provider/api/note/i_note_data_source.dart';
import 'package:supercalipso/data/provider/command/note/updateNote/update_note_command.dart';
import 'package:supercalipso/data/provider/command/note/createNote/create_note_command.dart';
import 'package:supercalipso/data/provider/mocked.dart';
import 'package:supercalipso/plugin/utils.dart';

class NoteMockedDataSource extends INoteDataSource with IdentifierFactory {
  var mocked = MockValues.instance;

  @override
  Future<Response<List<Note>>> readTeamNotes({required String teamId}) async {
    var notes = mocked.notes.where((element) => element.teamId == teamId).toList();
    return Future.value(Responses.success(notes));
  }

  @override
  Future<Response<List<Note>>> readUserNotes({required String userId}) async {
    var user = mocked.users.getWhere((element) => element.uid == userId);
    if (user == null) return Responses.failure([]);
    var userTeamIds =
        mocked.teamSubs.where((element) => element.subscribedUserId == userId).map((e) => e.teamId).toList();
    var notes = mocked.notes.where((element) => userTeamIds.contains(element.teamId)).toList();
    return Future.value(Responses.success(notes));
  }

  @override
  Future<Response<Note>> readNote({required String noteId}) async {
    var note = mocked.notes.getWhere((element) => element.id == noteId);
    if (note == null) return Responses.failure([]);
    return Future.value(Responses.success(note));
  }

  @override
  Future<Response> deleteNote({required String noteId}) async {
    mocked.notes.removeWhere((element) => element.id == noteId);
    return Future.value(Responses.success(null));
  }

  @override
  Future<Response<Note>> createNote({required CreateNoteCommand command}) async {
    var user = mocked.users.getWhere((element) => element.uid == command.modifiedByUserId);
    if (user == null) return Responses.failure([]);
    var team = mocked.teams.getWhere((element) => element.id == command.teamId);
    if (team == null) return Responses.failure([]);
    var newNote = command.createNoteDTO(createID());
    mocked.notes.add(newNote);
    return Future.value(Responses.success(null));
  }

  @override
  Future<Response<Note>> updateNote({required UpdateNoteCommand command}) async {
    var user = mocked.users.getWhere((element) => element.uid == command.modifiedByUserId);
    if (user == null) return Responses.failure([]);
    var note = mocked.notes.getWhere((element) => element.id == command.noteId);
    if (note == null) return Responses.failure([]);
    var newNote = note.copyWith(
      id: note.id,
      title: command.title ?? note.title,
      description: command.content ?? note.description,
      lastUpdate: DateTime.now().toUtc(),
      modifiedByUserId: user.uid,
      teamId: note.teamId,
    );
    mocked.notes.remove(note);
    mocked.notes.add(newNote);
    return Future.value(Responses.success(null));
  }
}
