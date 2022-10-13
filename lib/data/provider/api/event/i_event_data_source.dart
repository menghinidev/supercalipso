import 'package:supercalipso/data/model/event/team_event.dart';
import 'package:supercalipso/data/provider/command/event/create/create_event.dart';
import 'package:supercalipso/plugin/utils/response.dart';

abstract class IEventDataSource {
  Future<Response<List<TeamEvent>>> readTeamEvents({required String teamId});
  Future<Response<List<TeamEvent>>> readUserEvents({required String userId});
  Future<Response> createTeamEvent({required CreateEventCommand command});
}
