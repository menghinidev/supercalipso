import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:supercalipso/data/model/note/note.dart';
import 'package:supercalipso/data/repository/note_repository.dart';
import 'package:supercalipso/services/installer.dart';

final pinnedNotesChangesProvider = StreamProvider.family<List<Note>, String>((ref, id) {
  return ref.watch(noteRepoProvider).notesChanges;
});

final noteRepoProvider = Provider<NoteRepository>((ref) {
  return Installer.instance.get<NoteRepository>();
});

final teamNotesChangesProvider = StreamProvider.family<List<Note>, String>((ref, id) {
  return ref.watch(noteRepoProvider).getTeamNotesChanges(teamId: id);
});
