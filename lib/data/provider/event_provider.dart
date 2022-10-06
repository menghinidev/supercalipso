import 'package:supercalipso/data/model/event/team_event.dart';
import 'package:supercalipso/data/model/team/team.dart';
import 'package:supercalipso/data/provider/mocked.dart';
import 'package:supercalipso/plugin/utils/response.dart';

class TeamEventProvider with IdentifierFactory {
  final mocked = MockValues.instance;

  Future<Response<List<TeamEvent>>> readTeamEvents({required String teamId}) async {
    var events = mocked.events.where((element) => element.team.id == teamId).toList();
    return Future.value(Responses.success(events));
  }

  Future<Response> createTeamEvent({
    required Team team,
    required String name,
    required DateTime startTime,
    Duration? duration,
  }) {
    var event = TeamEvent(
      eventId: createID(),
      name: name,
      startTime: startTime,
      duration: duration,
      team: team,
    );
    mocked.events.add(event);
    return Future.value(Responses.success(null));
  }
}
