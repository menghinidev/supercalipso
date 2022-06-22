import 'package:supercalipso/data/model/team/team.dart';
import 'package:supercalipso/data/provider/mocked.dart';
import 'package:supercalipso/plugin/utils.dart';

class TeamsProvider {
  var mocked = MockValues.instance;

  Future<Response<List<Team>>> readUserTeamsSubscriptions({required String userId}) {
    var teams = mocked.teams.where((element) => element.hasUserSub(userId: userId)).toList();
    return Future.value(Responses.success(teams));
  }

  Future<Response<List<Team>>> readUserTeamsInvitations({required String userId}) {
    var teams = mocked.teams.where((element) => element.hasUserInvite(userId: userId)).toList();
    return Future.value(Responses.success(teams));
  }
}
