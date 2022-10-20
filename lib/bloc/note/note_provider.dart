import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:supercalipso/bloc/note/note_service.dart';
import 'package:supercalipso/data/model/note/note.dart';
import 'package:supercalipso/data/repository/note_repository.dart';
import 'package:supercalipso/services/installer.dart';

final noteRepoProvider = Provider<NoteRepository>((ref) {
  return Installer.instance.get<NoteRepository>();
});

final notesProvider = StreamProvider<List<Note>>((ref) {
  return ref.watch(noteServiceProvider).loggedTeamNotes;
});
