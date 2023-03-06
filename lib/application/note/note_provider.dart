import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:supercalipso/application/env.dart';
import 'package:supercalipso/application/note/note_service.dart';
import 'package:supercalipso/data/model/note/note.dart';
import 'package:supercalipso/data/provider/api/note/firestore_data_source.dart';
import 'package:supercalipso/data/provider/api/note/i_note_data_source.dart';
import 'package:supercalipso/data/provider/api/note/mocked_data_source.dart';
import 'package:supercalipso/data/repository/note_repository.dart';

final noteDataSourceProvider = Provider<INoteDataSource>((ref) {
  if (EnvVariables.isMocked) return NoteMockedDataSource();
  return NoteFirestoreDataSource();
});

final noteRepoProvider = Provider<NoteRepository>((ref) {
  return NoteRepository(dataProvider: ref.watch(noteDataSourceProvider));
});
