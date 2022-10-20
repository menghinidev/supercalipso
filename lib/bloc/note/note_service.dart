import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:supercalipso/bloc/auth/auth_provider.dart';
import 'package:supercalipso/bloc/note/note_provider.dart';
import 'package:supercalipso/bloc/team/team_provider.dart';
import 'package:supercalipso/data/model/note/note.dart';
import 'package:supercalipso/data/repository/auth_repository.dart';
import 'package:supercalipso/data/repository/note_repository.dart';
import 'package:supercalipso/data/repository/team_repository.dart';
import 'package:supercalipso/plugin/utils.dart';

final noteServiceProvider = Provider<NoteService>((ref) {
  return NoteService(
    authRepo: ref.watch(authProvider),
    teamRepo: ref.watch(teamRepoProvider),
    noteRepo: ref.watch(noteRepoProvider),
  );
});

class NoteService {
  final AuthRepository authRepo;
  final TeamRepository teamRepo;
  final NoteRepository noteRepo;

  NoteService({required this.authRepo, required this.noteRepo, required this.teamRepo});

  Future<Response> askTeamNotes() async {
    var teamId = teamRepo.loggedTeamId;
    if (teamId == null) return Responses.failure([]);
    return await noteRepo.getTeamNotes(teamId: teamId);
  }

  Future<Response> createNote({required String title, String? content}) async {
    var userId = authRepo.loggedUser?.uid;
    if (userId == null) return Responses.failure([]);
    var teamId = teamRepo.loggedTeamId;
    if (teamId == null) return Responses.failure([]);
    return await noteRepo.createNote(
      teamId: teamId,
      userId: userId,
      title: title,
      content: content ?? '',
    );
  }

  Future<Response> updateNote({required String noteId, String? title, String? content}) async {
    var userId = authRepo.loggedUser?.uid;
    if (userId == null) return Responses.failure([]);
    var teamId = teamRepo.loggedTeamId;
    if (teamId == null) return Responses.failure([]);
    return await noteRepo.updateNote(
      noteId: noteId,
      teamId: teamId,
      userId: userId,
      title: title,
      content: content,
    );
  }

  Future<Response> deleteNote({required String noteId}) => noteRepo.deleteNote(noteId: noteId);

  Stream<List<Note>> get loggedTeamNotes {
    var currentTeamId = teamRepo.loggedTeamId;
    if (currentTeamId == null) return Stream.value(<Note>[]);
    return noteRepo.getTeamNotesChanges(teamId: currentTeamId);
  }
}
