import 'package:supercalipso/data/model/event/team_event.dart';
import 'package:supercalipso/data/provider/api/event/i_event_data_source.dart';
import 'package:supercalipso/data/provider/command/event/create/create_event.dart';
import 'package:supercalipso/data/provider/command/event/update/update_event_command.dart';
import 'package:supercalipso/data/provider/mocked.dart';
import 'package:supercalipso/plugin/utils/extensions/list_extensions.dart';
import 'package:supercalipso/plugin/utils/response.dart';

class EventMockedDataSource extends IEventDataSource with IdentifierFactory {
  final mocked = MockValues.instance;

  @override
  Future<Response<List<TeamEvent>>> readTeamEvents({required String teamId}) async {
    var events = mocked.events.where((element) => element.teamId == teamId).toList();
    return Future.value(Responses.success(events));
  }

  @override
  Future<Response<List<TeamEvent>>> readUserEvents({required String userId}) async {
    var user = mocked.users.getWhere((element) => element.uid == userId);
    if (user == null) return Responses.failure([]);
    var teamIds = mocked.teamSubs.where((element) => element.subscribedUserId == userId).map((e) => e.teamId);
    var events = mocked.events.where((element) => teamIds.contains(element.teamId)).toList();
    return Future.value(Responses.success(events));
  }

  @override
  Future<Response<TeamEvent>> createTeamEvent({required CreateEventCommand command}) async {
    var team = mocked.teams.getWhere((element) => element.id == command.teamId);
    if (team == null) return Responses.failure([]);
    var event = TeamEvent(
      id: createID(),
      name: command.name,
      startTime: command.startTime,
      endTime: command.endTime,
      description: command.description,
      teamId: team.id,
      createdByUserId: command.createdByUserId,
      lastUpdate: DateTime.now().toUtc(),
      iconName: command.iconName,
    );
    mocked.events.add(event);
    return Future.value(Responses.success(event));
  }

  @override
  Future<Response> deleteTeamEvent({required String eventId}) {
    mocked.events.removeWhere((element) => element.id == eventId);
    return Future.value(Responses.success(null));
  }

  @override
  Future<Response<TeamEvent>> updateTeamEvent({required UpdateEventCommand command}) async {
    var event = mocked.events.getWhere((element) => element.id == command.eventId);
    if (event == null) return Responses.failure([]);
    var updated = event.copyWith(
      description: command.description ?? event.description,
      endTime: command.endTime ?? event.endTime,
      name: command.title ?? event.name,
      startTime: command.startTime ?? event.startTime,
      iconName: command.iconName,
      lastUpdate: DateTime.now().toUtc(),
    );
    mocked.events.removeWhere((element) => element.id == command.eventId);
    mocked.events.add(updated);
    return Responses.success(updated);
  }

  @override
  Future<Response<TeamEvent>> readTeamEvent({required String eventId}) {
    return Future.value(Responses.success(mocked.events.getWhere((element) => element.id == eventId)));
  }
}
