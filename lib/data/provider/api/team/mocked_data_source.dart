import 'dart:math';

import 'package:supercalipso/data/model/team/invitation/invitation.dart';
import 'package:supercalipso/data/model/team/subscription/subscription.dart';
import 'package:supercalipso/data/model/team/team.dart';
import 'package:supercalipso/data/provider/api/team/i_team_data_source.dart';
import 'package:supercalipso/data/provider/command/team/createInvitation/create_team_invitation_command.dart';
import 'package:supercalipso/data/provider/command/team/createTeam/create_team_command.dart';
import 'package:supercalipso/data/provider/command/team/replyToInvitation/replayto_invitation_command.dart';
import 'package:supercalipso/data/provider/mocked.dart';
import 'package:supercalipso/plugin/utils.dart';

class TeamMockedDataSource extends ITeamDataSource {
  var mocked = MockValues.instance;

  @override
  Future<Response<List<TeamSubscription>>> readUserTeamsSubscriptions({required String userId}) {
    var teams = mocked.teamSubs.where((element) => element.subscribedUserId == userId).toList();
    return Future.value(Responses.success(teams));
  }

  @override
  Future<Response<List<TeamInvitation>>> readUserTeamsInvitations({required String userId}) {
    var invites = mocked.teamInvites.where((element) => element.invitedUserId == userId).toList();
    return Future.value(Responses.success(invites));
  }

  @override
  Future<Response> replyTeamInvitation({required ReplyToInvitationCommand command}) {
    /* var invitation = mocked.teamInvites.getWhere((element) => element.invitationId == command.invitationId);
    if (invitation == null) return Future.value(Responses.failure([]));
    var status = TeamInvitationStatus.fromString(command.status);
    var user = invitation.invitedUser;
    mocked.teamInvites.remove(invitation);
    invitation = invitation.copyWith(status: status);
    mocked.teamInvites.add(invitation);
    if (status == TeamInvitationStatus.accepted) {
      mocked.teamSubs.add(TeamSubscription(
        subscribedUser: user,
        team: invitation.team,
        joined: DateTime.now(),
      ));
    } */
    return Future.value(Responses.success(null));
  }

  @override
  Future<Response<Team>> readTeam({required String teamId}) async {
    var team = mocked.teams.getWhere((element) => element.id == teamId);
    if (team == null) return Future.value(Responses.failure([]));
    return Future.value(Responses.success(team));
  }

  @override
  Future<Response> createTeamInvitation({required CreateTeamInvitationCommand command}) {
    var invitations = MockValues.instance.teamInvites;
    var invitedUser = MockValues.instance.users.getWhere((element) => element.uid == command.invitedUserId);
    var ownerUser = MockValues.instance.users.getWhere((element) => element.uid == command.invitedByUserId);
    var team = MockValues.instance.teams.getWhere((element) => element.id == command.teamId);
    var newInvite = TeamInvitation(
      teamId: team!.id,
      id: Random().nextInt(2000).toString(),
      invitedUserId: invitedUser!.uid,
      invitedByUserId: ownerUser!.uid,
      created: DateTime.now(),
    );
    invitations.add(newInvite);
    return Future.value(Responses.success(null));
  }

  @override
  Future<Response> createTeam({required CreateTeamCommand command}) {
    // TODO: implement createTeam
    throw UnimplementedError();
  }
}
