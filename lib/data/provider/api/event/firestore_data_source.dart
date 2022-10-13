import 'package:supercalipso/data/model/event/team_event.dart';
import 'package:supercalipso/data/provider/api/event/i_event_data_source.dart';
import 'package:supercalipso/plugin/utils/response.dart';
import 'package:supercalipso/data/provider/command/event/create/create_event.dart';

class TeamEventFirestoreSource extends IEventDataSource {
  @override
  Future<Response> createTeamEvent({required CreateEventCommand command}) {
    // TODO: implement createTeamEvent
    throw UnimplementedError();
  }

  @override
  Future<Response<List<TeamEvent>>> readTeamEvents({required String teamId}) {
    // TODO: implement readTeamEvents
    throw UnimplementedError();
  }

  @override
  Future<Response<List<TeamEvent>>> readUserEvents({required String userId}) {
    // TODO: implement readUserEvents
    throw UnimplementedError();
  }
}
