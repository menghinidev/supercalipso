import 'package:supercalipso/data/model/note/note.dart';
import 'package:supercalipso/data/provider/command/note/createNote/create_note_command.dart';
import 'package:supercalipso/data/provider/command/note/updateNote/update_note_command.dart';
import 'package:supercalipso/plugin/utils.dart';

abstract class INoteDataSource {
  Future<Response<List<Note>>> readTeamNotes({required String teamId});
  Future<Response<List<Note>>> readUserNotes({required String userId});
  Future<Response<Note>> readNote({required String noteId});
  Future<Response<Note>> createNote({required CreateNoteCommand command});
  Future<Response<Note>> updateNote({required UpdateNoteCommand command});
  Future<Response> deleteNote({required String noteId});
}
