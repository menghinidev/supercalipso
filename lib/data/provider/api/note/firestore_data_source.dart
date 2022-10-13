import 'package:supercalipso/data/model/note/note.dart';
import 'package:supercalipso/data/provider/api/note/i_note_data_source.dart';
import 'package:supercalipso/data/provider/command/note/createNote/create_note_command.dart';
import 'package:supercalipso/plugin/utils/response.dart';

class NoteFirestoreDataSource extends INoteDataSource {
  @override
  Future<Response<Note>> createNote({required CreateNoteCommand command}) {
    // TODO: implement createNote
    throw UnimplementedError();
  }

  @override
  Future<Response> deleteNote({required String noteId}) {
    // TODO: implement deleteNote
    throw UnimplementedError();
  }

  @override
  Future<Response<Note>> readNote({required String noteId}) {
    // TODO: implement readNote
    throw UnimplementedError();
  }

  @override
  Future<Response<List<Note>>> readTeamNotes({required String teamId}) {
    // TODO: implement readTeamNotes
    throw UnimplementedError();
  }

  @override
  Future<Response<List<Note>>> readUserNotes({required String userId}) {
    // TODO: implement readUserNotes
    throw UnimplementedError();
  }
}
