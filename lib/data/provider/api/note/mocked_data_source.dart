import 'package:supercalipso/data/model/note/note.dart';
import 'package:supercalipso/data/model/team/team.dart';
import 'package:supercalipso/data/provider/mocked.dart';
import 'package:supercalipso/plugin/utils.dart';

class NoteMockedDataSource with IdentifierFactory {
  var mocked = MockValues.instance;

  Future<Response<List<Note>>> readTeamNotes({required String teamId}) async {
    var notes = mocked.notes.where((element) => element.teamId == teamId).toList();
    return Future.value(Responses.success(notes));
  }

  Future<Response<List<Note>>> readUserNotes({required String userId}) async {
    var user = mocked.users.getWhere((element) => element.uid == userId);
    if (user == null) return Responses.failure([]);
    var userTeamIds = mocked.teams.where((element) => element.hasUserSub(userId: userId)).map((e) => e.id).toList();
    var notes = mocked.notes.where((element) => userTeamIds.contains(element.teamId)).toList();
    return Future.value(Responses.success(notes));
  }

  Future<Response<Note>> readNote({required String noteId}) async {
    var note = mocked.notes.getWhere((element) => element.id == noteId);
    if (note == null) return Responses.failure([]);
    return Future.value(Responses.success(note));
  }

  Future<Response> createTeamNote({
    required String teamId,
    required String title,
    required String content,
    required String modifiedByUserId,
  }) async {
    var user = mocked.users.getWhere((element) => element.uid == modifiedByUserId);
    if (user == null) return Responses.failure([]);
    var team = mocked.teams.getWhere((element) => element.id == teamId);
    if (team == null) return Responses.failure([]);
    var newNote = Note(
      id: createID(),
      title: title,
      description: content,
      lastUpdate: DateTime.now(),
      modifiedByUserId: user.uid,
      teamId: team.id,
    );
    mocked.notes.add(newNote);
    return Future.value(Responses.success(null));
  }

  Future<Response> modifyTeamNote({
    required String noteId,
    String? title,
    String? content,
    required String modifiedByUserId,
  }) async {
    var user = mocked.users.getWhere((element) => element.uid == modifiedByUserId);
    if (user == null) return Responses.failure([]);
    var note = mocked.notes.getWhere((element) => element.id == noteId);
    if (note == null) return Responses.failure([]);
    var newNote = note.copyWith(
      id: note.id,
      title: title ?? note.title,
      description: content ?? note.description,
      lastUpdate: DateTime.now(),
      modifiedByUserId: user.uid,
      teamId: note.teamId,
    );
    mocked.notes.remove(note);
    mocked.notes.add(newNote);
    return Future.value(Responses.success(null));
  }

  Future<Response> deleteNote({required String noteId}) async {
    mocked.notes.removeWhere((element) => element.id == noteId);
    return Future.value(Responses.success(null));
  }
}
