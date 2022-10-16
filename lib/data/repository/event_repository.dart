import 'package:rxdart/rxdart.dart';
import 'package:supercalipso/data/model/event/team_event.dart';
import 'package:supercalipso/data/model/team/team.dart';
import 'package:supercalipso/data/provider/api/event/i_event_data_source.dart';
import 'package:supercalipso/data/provider/command/event/create/create_event.dart';
import 'package:supercalipso/data/provider/command/event/update/update_event_command.dart';
import 'package:supercalipso/plugin/utils.dart';
import 'package:supercalipso/services/installer.dart';

class EventRepository {
  final controller = BehaviorSubject<List<TeamEvent>>();
  final provider = Installer.instance.get<IEventDataSource>();

  Stream<List<TeamEvent>> get eventsChanges => controller.stream;

  Stream<List<TeamEvent>> getTeamEventsChanges({required String teamId}) {
    return controller.stream.map((event) => event.where((element) => element.teamId == teamId).toList());
  }

  Stream<TeamEvent> getEventChanges({required String eventId}) {
    return controller.stream.mapNotNull((event) => event.getWhere((element) => element.id == eventId));
  }

  Future<Response<List<TeamEvent>>> getTeamEvents({required String teamId}) async {
    var events = await provider.readTeamEvents(teamId: teamId);
    return events.ifSuccess((payload) => controller.add(payload!));
  }

  Future<Response<List<TeamEvent>>> getUserEvents({required String userId}) async {
    var events = await provider.readUserEvents(userId: userId);
    return events.ifSuccess((payload) => controller.add(payload!));
  }

  Future<Response<TeamEvent>> getEvent({required String id}) async {
    return await provider.readTeamEvent(eventId: id);
  }

  Future<Response> createEvent({
    required String teamId,
    required String name,
    required DateTime startTime,
    required String userId,
    Duration? duration,
    String? description,
  }) async {
    var command = CreateEventCommand(
      teamId: teamId,
      name: name,
      startTime: startTime,
      duration: duration ?? Duration.zero,
      description: description,
      createdByUserId: userId,
    );
    var event = await provider.createTeamEvent(command: command);
    return await event.flatMapAsync((t) => getTeamEvents(teamId: teamId));
  }

  Future<Response> updateEvent({
    required String eventId,
    String? name,
    DateTime? startTime,
    Duration? duration,
    String? description,
  }) async {
    var command = UpdateEventCommand(
      eventId: eventId,
      title: name,
      startTime: startTime,
      duration: duration ?? Duration.zero,
      description: description,
    );
    var event = await provider.updateTeamEvent(command: command);
    return await event.flatMapAsync((t) => getTeamEvents(teamId: t!.teamId));
  }

  Future<Response> deleteEvent({required String eventId}) async {
    var event = await provider.readTeamEvent(eventId: eventId);
    var delete = await event.flatMapAsync((t) => provider.deleteTeamEvent(eventId: eventId));
    return await delete.flatMapAsync((t) => getTeamEvents(teamId: event.payload!.teamId));
  }
}
