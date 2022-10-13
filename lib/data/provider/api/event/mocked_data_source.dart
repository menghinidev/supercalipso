import 'package:supercalipso/data/model/event/team_event.dart';
import 'package:supercalipso/data/provider/api/event/i_event_data_source.dart';
import 'package:supercalipso/data/provider/command/event/create/create_event.dart';
import 'package:supercalipso/data/provider/mocked.dart';
import 'package:supercalipso/plugin/utils/extensions/list_extensions.dart';
import 'package:supercalipso/plugin/utils/response.dart';

class EventMockedDataSource extends IEventDataSource with IdentifierFactory {
  final mocked = MockValues.instance;

  @override
  Future<Response<List<TeamEvent>>> readTeamEvents({required String teamId}) async {
    var events = mocked.events.where((element) => element.id == teamId).toList();
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
  Future<Response> createTeamEvent({required CreateEventCommand command}) async {
    var team = mocked.teams.getWhere((element) => element.id == command.teamId);
    if (team == null) return Responses.failure([]);
    var event = TeamEvent(
      id: createID(),
      name: command.name,
      startTime: command.startTime,
      duration: command.duration,
      description: command.description,
      teamId: team.id,
    );
    mocked.events.add(event);
    return Future.value(Responses.success(null));
  }
}
