import 'dart:math';

import 'package:supercalipso/data/model/team/invitation/invitation.dart';
import 'package:supercalipso/data/model/team/subscription/subscription.dart';
import 'package:supercalipso/data/model/team/team.dart';
import 'package:supercalipso/data/provider/mocked.dart';
import 'package:supercalipso/plugin/utils.dart';

class TeamsProvider {
  var mocked = MockValues.instance;

  Future<Response<List<TeamSubscription>>> readUserTeamsSubscriptions({required String userId}) {
    var teams = mocked.teamSubs.where((element) => element.subscribedUser.uid == userId).toList();
    return Future.value(Responses.success(teams));
  }

  Future<Response<List<TeamInvitation>>> readUserTeamsInvitations({required String userId}) {
    var invites = mocked.teamInvites.where((element) => element.invitedUser.uid == userId).toList();
    return Future.value(Responses.success(invites));
  }

  Future<Response> replyTeamInvitation({required String invitationId, required String newStatus}) {
    var invitation = mocked.teamInvites.getWhere((element) => element.invitationId == invitationId);
    if (invitation == null) return Future.value(Responses.failure([]));
    var status = TeamInvitationStatus.fromString(newStatus);
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
    }
    return Future.value(Responses.success(null));
  }

  Future<Response<Team>> readTeam({required String teamId}) async {
    var team = mocked.teams.getWhere((element) => element.id == teamId);
    if (team == null) return Future.value(Responses.failure([]));
    return Future.value(Responses.success(team));
  }

  Future<Response> createTeamInvitation({
    required String invitedUserId,
    required String teamOwnerId,
    required String teamId,
  }) {
    var invitations = MockValues.instance.teamInvites;
    var invitedUser = MockValues.instance.users.getWhere((element) => element.uid == invitedUserId);
    var ownerUser = MockValues.instance.users.getWhere((element) => element.uid == teamOwnerId);
    var team = MockValues.instance.teams.getWhere((element) => element.id == teamId);
    var newInvite = TeamInvitation(
      team: team!,
      invitationId: Random().nextInt(2000).toString(),
      invitedUser: invitedUser!,
      invitedBy: ownerUser!,
      created: DateTime.now(),
    );
    invitations.add(newInvite);
    return Future.value(Responses.success(null));
  }
}
