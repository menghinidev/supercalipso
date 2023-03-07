import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:supercalipso/application/auth/auth_provider.dart';
import 'package:supercalipso/application/auth/authstate.dart';
import 'package:supercalipso/application/note/note_provider.dart';
import 'package:supercalipso/application/team/team_service.dart';
import 'package:supercalipso/application/team/teamsessionstate.dart';
import 'package:supercalipso/data/model/note/note.dart';
import 'package:supercalipso/data/repository/note_repository.dart';
import 'package:supercalipso/plugin/utils.dart';

final loggedTeamNotesProvider = StateNotifierProvider<TeamNotesController, AsyncValue<List<Note>>>((ref) {
  var session = ref.watch(teamSessionStateProvider);
  var auth = ref.watch(authStateProvider.select((value) => value.valueOrNull));
  return TeamNotesController(
    noteRepo: ref.watch(noteRepoProvider),
    authState: auth,
    sessionState: session,
  );
});

class TeamNotesController extends StateNotifier<AsyncValue<List<Note>>> {
  final TeamSessionState sessionState;
  final AuthState? authState;
  final NoteRepository noteRepo;

  TeamNotesController({required this.noteRepo, required this.authState, required this.sessionState})
      : super(const AsyncData(<Note>[])) {
    askTeamNotes();
  }

  Future<Response> askTeamNotes() async {
    var teamId = sessionState.whenOrNull(logged: (team) => team.id);
    if (teamId == null) return Responses.failure([]);
    return await noteRepo.getTeamNotes(teamId: teamId);
  }

  Future<Response> createNote({required String title, String? content}) async {
    var userId = authState?.whenOrNull(auth: (user) => user.uid);
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
    var userId = authState?.whenOrNull(auth: (user) => user.uid);
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
