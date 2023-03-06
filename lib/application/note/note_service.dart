import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:supercalipso/application/auth/auth_provider.dart';
import 'package:supercalipso/application/auth/authstate.dart';
import 'package:supercalipso/application/note/note_provider.dart';
import 'package:supercalipso/application/team/team_service.dart';
import 'package:supercalipso/application/team/teamsessionstate.dart';
import 'package:supercalipso/data/repository/note_repository.dart';
import 'package:supercalipso/plugin/utils.dart';

final noteServiceProvider = Provider<NoteService>((ref) {
  return NoteService(
    sessionState: ref.watch(teamSessionStateProvider),
    authState: ref.watch(authStateProvider),
    noteRepo: ref.watch(noteRepoProvider),
  );
});

class NoteService {
  final TeamSessionState sessionState;
  final AuthState authState;
  final NoteRepository noteRepo;

  NoteService({required this.noteRepo, required this.authState, required this.sessionState});

  Future<Response> askTeamNotes() async {
    var teamId = sessionState.whenOrNull(logged: (team) => team.id);
    if (teamId == null) return Responses.failure([]);
    return await noteRepo.getTeamNotes(teamId: teamId);
  }

  Future<Response> createNote({required String title, String? content}) async {
    var userId = authState.whenOrNull(auth: (user) => user.uid);
    if (userId == null) return Responses.failure([]);
    var teamId = sessionState.whenOrNull(logged: (team) => team.id);
    if (teamId == null) return Responses.failure([]);
    return await noteRepo.createNote(
      teamId: teamId,
      userId: userId,
      title: title,
      content: content ?? '',
    );
  }

  Future<Response> updateNote({required String noteId, String? title, String? content}) async {
    var userId = authState.whenOrNull(auth: (user) => user.uid);
    if (userId == null) return Responses.failure([]);
    var teamId = sessionState.whenOrNull(logged: (team) => team.id);
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
}
