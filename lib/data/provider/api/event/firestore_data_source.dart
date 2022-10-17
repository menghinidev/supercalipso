import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:supercalipso/data/model/event/team_event.dart';
import 'package:supercalipso/data/model/team/subscription/subscription.dart';
import 'package:supercalipso/data/provider/api/constants.dart';
import 'package:supercalipso/data/provider/api/event/i_event_data_source.dart';
import 'package:supercalipso/data/provider/command/event/update/update_event_command.dart';
import 'package:supercalipso/plugin/utils/response.dart';
import 'package:supercalipso/data/provider/command/event/create/create_event.dart';

class TeamEventFirestoreDataSource extends IEventDataSource {
  final firestore = FirebaseFirestore.instance;

  @override
  Future<Response<TeamEvent>> createTeamEvent({required CreateEventCommand command}) async {
    var document = firestore.collection(FirestoreCollections.events).doc();
    var event = TeamEvent(
      id: document.id,
      name: command.name,
      startTime: command.startTime,
      teamId: command.teamId,
      description: command.description,
      endTime: command.endTime,
      createdByUserId: command.createdByUserId,
      lastUpdate: DateTime.now().toUtc(),
    );
    await document.set(event.toJson());
    return Responses.success(event);
  }

  @override
  Future<Response> deleteTeamEvent({required String eventId}) async {
    var document = firestore.collection(FirestoreCollections.events).doc(eventId);
    await document.delete();
    return Responses.success(null);
  }

  @override
  Future<Response<TeamEvent>> updateTeamEvent({required UpdateEventCommand command}) async {
    var document = firestore.collection(FirestoreCollections.events).doc(command.eventId);
    var event = TeamEvent.fromJson((await document.get()).data()!);
    var newEvent = event.copyWith(
      name: command.title ?? event.name,
      description: command.description ?? event.description,
      endTime: command.endTime ?? event.endTime,
      startTime: command.startTime ?? event.startTime,
    );
    await document.update(newEvent.toJson());
    return Responses.success(newEvent);
  }

  @override
  Future<Response<List<TeamEvent>>> readTeamEvents({required String teamId}) async {
    var events = await firestore.collection(FirestoreCollections.events).where('teamId', isEqualTo: teamId).get();
    var parsed = events.docs.map((e) => TeamEvent.fromJson(e.data())).toList();
    return Responses.success(parsed);
  }

  @override
  Future<Response<List<TeamEvent>>> readUserEvents({required String userId}) async {
    var userSubs = await firestore
        .collection(FirestoreCollections.subscriptions)
        .where('subscribedUserId', isEqualTo: userId)
        .get();
    if (userSubs.docs.isEmpty) return Responses.success(<TeamEvent>[]);
    var mappedUserSubs = userSubs.docs.map((e) => TeamSubscription.fromJson(e.data())).toList();
    var events = await firestore
        .collection(FirestoreCollections.events)
        .where('teamId', whereIn: mappedUserSubs.map((e) => e.teamId).toList())
        .get();
    var mappedEvents = events.docs.map((e) => TeamEvent.fromJson(e.data())).toList();
    return Responses.success(mappedEvents);
  }

  @override
  Future<Response<TeamEvent>> readTeamEvent({required String eventId}) async {
    var document = firestore.collection(FirestoreCollections.events).doc(eventId);
    var event = TeamEvent.fromJson((await document.get()).data()!);
    return Responses.success(event);
  }
}
