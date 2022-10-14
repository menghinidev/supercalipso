import 'package:supercalipso/data/model/event/team_event.dart';
import 'package:supercalipso/data/provider/command/event/create/create_event.dart';
import 'package:supercalipso/data/provider/command/event/update/update_event_command.dart';
import 'package:supercalipso/plugin/utils/response.dart';

abstract class IEventDataSource {
  Future<Response<List<TeamEvent>>> readTeamEvents({required String teamId});
  Future<Response<List<TeamEvent>>> readUserEvents({required String userId});
  Future<Response<TeamEvent>> createTeamEvent({required CreateEventCommand command});
  Future<Response<TeamEvent>> readTeamEvent({required String eventId});
  Future<Response<TeamEvent>> updateTeamEvent({required UpdateEventCommand command});
  Future<Response> deleteTeamEvent({required String eventId});
}
