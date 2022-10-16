import 'package:supercalipso/data/model/team/invitation/invitation.dart';
import 'package:supercalipso/data/model/team/subscription/subscription.dart';
import 'package:supercalipso/data/model/team/team.dart';
import 'package:supercalipso/data/provider/command/team/createInvitation/create_team_invitation_command.dart';
import 'package:supercalipso/data/provider/command/team/createTeam/create_team_command.dart';
import 'package:supercalipso/data/provider/command/team/replyToInvitation/replayto_invitation_command.dart';
import 'package:supercalipso/plugin/utils.dart';

abstract class ITeamDataSource {
  Future<Response<List<TeamSubscription>>> readUserTeamsSubscriptions({required String userId});
  Future<Response<List<TeamSubscription>>> readTeamSubscriptions({required String teamId});
  Future<Response<List<TeamInvitation>>> readUserTeamsInvitations({required String userId});
  Future<Response> replyTeamInvitation({required ReplyToInvitationCommand command});
  Future<Response<Team>> readTeam({required String teamId});
  Future<Response> createTeamInvitation({required CreateTeamInvitationCommand command});
  Future<Response<Team>> createTeam({required CreateTeamCommand command});
}
