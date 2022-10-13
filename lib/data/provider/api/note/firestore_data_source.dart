import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:supercalipso/data/model/note/note.dart';
import 'package:supercalipso/data/model/team/subscription/subscription.dart';
import 'package:supercalipso/data/provider/api/constants.dart';
import 'package:supercalipso/data/provider/api/note/i_note_data_source.dart';
import 'package:supercalipso/data/provider/command/note/createNote/create_note_command.dart';
import 'package:supercalipso/plugin/utils/response.dart';

class NoteFirestoreDataSource extends INoteDataSource {
  final firestore = FirebaseFirestore.instance;

  @override
  Future<Response<Note>> createNote({required CreateNoteCommand command}) async {
    var document = firestore.collection(FirestoreCollections.notes).doc();
    var note = Note(
      id: document.id,
      lastUpdate: DateTime.now(),
      modifiedByUserId: command.modifiedByUserId,
      teamId: command.teamId,
      title: command.title,
      description: command.content,
    );
    await document.set(note.toJson());
    return Responses.success(note);
  }

  @override
  Future<Response> deleteNote({required String noteId}) async {
    await firestore.collection(FirestoreCollections.notes).doc(noteId).delete();
    return Responses.success(null);
  }

  @override
  Future<Response<Note>> readNote({required String noteId}) async {
    var note = await firestore.collection(FirestoreCollections.notes).doc(noteId).get();
    if (!note.exists) return Responses.failure([]);
    return Responses.success(Note.fromJson(note.data()!));
  }

  @override
  Future<Response<List<Note>>> readTeamNotes({required String teamId}) async {
    var notes = await firestore.collection(FirestoreCollections.notes).where('teamId', isEqualTo: teamId).get();
    return Responses.success(notes.docs.map((e) => Note.fromJson(e.data())).toList());
  }

  @override
  Future<Response<List<Note>>> readUserNotes({required String userId}) async {
    var subscriptions = await firestore
        .collection(FirestoreCollections.subscriptions)
        .where('subscribedUserId', isEqualTo: userId)
        .get();
    var teamIds = subscriptions.docs.map((e) => TeamSubscription.fromJson(e.data())).map((e) => e.teamId).toList();
    var notes = await firestore.collection(FirestoreCollections.notes).where('teamId', whereIn: teamIds).get();
    return Responses.success(notes.docs.map((e) => Note.fromJson(e.data())).toList());
  }
}
