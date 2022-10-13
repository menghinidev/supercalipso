import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:supercalipso/data/model/event/team_event.dart';
import 'package:supercalipso/data/model/team/subscription/subscription.dart';
import 'package:supercalipso/data/provider/api/constants.dart';
import 'package:supercalipso/data/provider/api/event/i_event_data_source.dart';
import 'package:supercalipso/plugin/utils/response.dart';
import 'package:supercalipso/data/provider/command/event/create/create_event.dart';

class TeamEventFirestoreSource extends IEventDataSource {
  final documentPath = 'events';
  final firestore = FirebaseFirestore.instance;

  @override
  Future<Response> createTeamEvent({required CreateEventCommand command}) async {
    var document = firestore.collection(FirestoreCollections.events).doc();
    var event = TeamEvent(
      id: document.id,
      name: command.name,
      startTime: command.startTime,
      teamId: command.teamId,
      description: command.description,
      duration: command.duration,
    );
    await document.set(event.toJson());
    return Responses.success(null);
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
    var mappedUserSubs = userSubs.docs.map((e) => TeamSubscription.fromJson(e.data())).toList();
    var events = await firestore
        .collection(FirestoreCollections.events)
        .where('teamId', whereIn: mappedUserSubs.map((e) => e.teamId).toList())
        .get();
    var mappedEvents = events.docs.map((e) => TeamEvent.fromJson(e.data())).toList();
    return Responses.success(mappedEvents);
  }
}
