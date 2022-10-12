import 'package:rxdart/rxdart.dart';
import 'package:supercalipso/data/model/event/team_event.dart';
import 'package:supercalipso/data/model/team/team.dart';
import 'package:supercalipso/data/provider/event_provider.dart';
import 'package:supercalipso/plugin/utils.dart';
import 'package:supercalipso/services/installer.dart';

class EventRepository {
  final controller = BehaviorSubject<List<TeamEvent>>();
  final provider = Installer.instance.get<TeamEventProvider>();

  Stream<List<TeamEvent>> get eventsChanges => controller.stream;

  Stream<List<TeamEvent>> getTeamEventsChanges({required String teamId}) =>
      controller.stream.map((event) => event.where((element) => element.team.id == teamId).toList());

  Stream<TeamEvent> getEventChanges({required String eventId}) =>
      controller.stream.mapNotNull((event) => event.getWhere((element) => element.eventId == eventId));

  Future<Response<List<TeamEvent>>> getTeamEvents({required String teamId}) async {
    var events = await provider.readTeamEvents(teamId: teamId);
    return events.ifSuccess((payload) => controller.add(payload!));
  }

  Future<Response<List<TeamEvent>>> getUserEvents({required String userId}) async {
    var events = await provider.readUserEvents(userId: userId);
    return events.ifSuccess((payload) => controller.add(payload!));
  }

  Future<Response> createEvent({
    required Team team,
    required String name,
    required DateTime startTime,
    Duration? duration,
    String? description,
  }) async {
    var event = await provider.createTeamEvent(
      team: team,
      name: name,
      startTime: startTime,
      duration: duration,
      description: description,
    );
    return await event.flatMapAsync((t) => getTeamEvents(teamId: team.id));
  }
}
