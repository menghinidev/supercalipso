import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:supercalipso/bloc/auth/auth_provider.dart';
import 'package:supercalipso/bloc/note/note_provider.dart';
import 'package:supercalipso/bloc/team/team_service.dart';
import 'package:supercalipso/data/model/note/note.dart';
import 'package:supercalipso/data/repository/auth_repository.dart';
import 'package:supercalipso/data/repository/note_repository.dart';
import 'package:supercalipso/plugin/utils.dart';

final noteServiceProvider = Provider<NoteService>((ref) {
  return NoteService(
    authRepo: ref.watch(authProvider),
    noteRepo: ref.watch(noteRepoProvider),
  );
});

final notesProvider = StreamProvider<List<Note>>((ref) {
  ref.watch(currentTeamChangesProvider);
  return ref.watch(noteRepoProvider).notesChanges;
});

class NoteService {
  final AuthRepository authRepo;
  final NoteRepository noteRepo;

  NoteService({required this.authRepo, required this.noteRepo});

  Future<Response> getUserNotes() async {
    var userId = authRepo.loggedUser?.uid;
    if (userId == null) return Responses.failure([]);
    return await noteRepo.getUserNotes(userId: userId);
  }

  Future<Response> createNote({
    required String teamId,
    required String title,
    String? content,
  }) async {
    var userId = authRepo.loggedUser?.uid;
    if (userId == null) return Responses.failure([]);
    return await noteRepo.createNote(
      teamId: teamId,
      userId: userId,
      title: title,
      content: content ?? '',
    );
  }
}
