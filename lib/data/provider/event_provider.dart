import 'package:supercalipso/data/model/event/team_event.dart';
import 'package:supercalipso/data/model/team/team.dart';
import 'package:supercalipso/data/provider/mocked.dart';
import 'package:supercalipso/plugin/utils/extensions/list_extensions.dart';
import 'package:supercalipso/plugin/utils/response.dart';

class TeamEventProvider with IdentifierFactory {
  final mocked = MockValues.instance;

  Future<Response<List<TeamEvent>>> readTeamEvents({required String teamId}) async {
    var events = mocked.events.where((element) => element.team.id == teamId).toList();
    return Future.value(Responses.success(events));
  }

  Future<Response<List<TeamEvent>>> readUserEvents({required String userId}) async {
    var user = mocked.users.getWhere((element) => element.id == userId);
    if (user == null) return Responses.failure([]);
    var events = mocked.events.where((element) => element.team.hasUserSub(userId: userId)).toList();
    return Future.value(Responses.success(events));
  }

  Future<Response> createTeamEvent({
    required Team team,
    required String name,
    required DateTime startTime,
    Duration? duration,
    String? description,
  }) {
    var event = TeamEvent(
      eventId: createID(),
      name: name,
      startTime: startTime,
      duration: duration,
      team: team,
      description: description,
    );
    mocked.events.add(event);
    return Future.value(Responses.success(null));
  }
}
