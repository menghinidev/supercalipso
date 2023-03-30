import 'package:supercalipso/data/model/event/team_event.dart';
import 'package:supercalipso/data/provider/api/event/i_event_data_source.dart';
import 'package:supercalipso/data/provider/command/event/create/create_event.dart';
import 'package:supercalipso/data/provider/command/event/update/update_event_command.dart';
import 'package:supercalipso/plugin/utils.dart';

class EventRepository {
  final IEventDataSource provider;

  EventRepository({required this.provider});

  Future<Response<List<TeamEvent>>> getTeamEvents({required String teamId}) async {
    return await provider.readTeamEvents(teamId: teamId);
  }

  Future<Response<TeamEvent>> getEvent({required String id}) async {
    return await provider.readTeamEvent(eventId: id);
  }

  Future<Response> createEvent({
    required String teamId,
    required String name,
    required DateTime startTime,
    required String userId,
    DateTime? endTime,
    String? description,
    String? iconName,
  }) async {
    var command = CreateEventCommand(
      teamId: teamId,
      name: name,
      startTime: startTime,
      endTime: endTime,
      description: description,
      createdByUserId: userId,
      iconName: iconName,
    );
    var event = await provider.createTeamEvent(command: command);
    return await event.flatMapAsync((t) => getTeamEvents(teamId: teamId));
  }

  Future<Response> updateEvent({
    required String eventId,
    String? name,
    DateTime? startTime,
    DateTime? endTime,
    String? description,
    String? iconName,
  }) async {
    var command = UpdateEventCommand(
      eventId: eventId,
      title: name,
      startTime: startTime,
      endTime: endTime,
      description: description,
      iconName: iconName,
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
