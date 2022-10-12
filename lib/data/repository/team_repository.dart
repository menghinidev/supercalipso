import 'dart:async';

import 'package:rxdart/rxdart.dart';
import 'package:rxdart/subjects.dart';
import 'package:supercalipso/data/model/team/invitation/invitation.dart';
import 'package:supercalipso/data/model/team/subscription/subscription.dart';
import 'package:supercalipso/data/model/team/team.dart';
import 'package:supercalipso/data/provider/team_provider.dart';
import 'package:supercalipso/plugin/utils.dart';
import 'package:supercalipso/services/installer.dart';

class TeamRepository {
  final BehaviorSubject<List<Team>> teamsController;
  final BehaviorSubject<List<TeamInvitation>> teamsInvitationsController;
  final teamsDataProvider = Installer.instance.get<TeamsProvider>();

  TeamRepository()
      : teamsController = BehaviorSubject<List<Team>>(),
        teamsInvitationsController = BehaviorSubject<List<TeamInvitation>>();

  Stream<List<Team>> get teamsChanges => teamsController.stream;
  Stream<List<TeamInvitation>> get invitationsChanges => teamsInvitationsController.stream;

  Stream<Team> teamChanges(String teamId) =>
      teamsController.stream.mapNotNull((event) => event.getWhere((element) => element.id == teamId));

  Future<Response<List<Team>>> getUserTeams({required String userId}) async {
    var subs = await teamsDataProvider.readUserTeamsSubscriptions(userId: userId);
    var teams = await subs.flatAndCollectAsync<Team, TeamSubscription>(
      subs.payload!,
      (source) => teamsDataProvider.readTeam(teamId: source.team.id),
    );
    teams.ifSuccess((payload) => teamsController.add(payload!));
    return teams;
  }

  Future<Response<Team>> getTeam({required String teamId}) async {
    var teams = await teamsDataProvider.readTeam(teamId: teamId);
    return teams;
  }

  Future<Response<List<TeamInvitation>>> getUserTeamInvitations({required String userId}) async {
    return await teamsDataProvider
        .readUserTeamsInvitations(userId: userId)
        .ifSuccess((payload) => teamsInvitationsController.add(payload!));
  }

  Future<Response> replyToTeamInvitation({
    required TeamInvitationStatus status,
    required String teamInvitationId,
    required String userId,
  }) async {
    return await teamsDataProvider
        .replyTeamInvitation(invitationId: teamInvitationId, newStatus: status.name)
        .ifSuccessAsync((payload) => getUserTeamInvitations(userId: userId))
        .ifSuccessAsync((payload) => getUserTeams(userId: userId));
  }

  Future<Response> createTeamInvitation({
    required String invitedUserId,
    required String ownerUserId,
    required String teamId,
  }) async {
    return await teamsDataProvider
        .createTeamInvitation(invitedUserId: invitedUserId, teamOwnerId: ownerUserId, teamId: teamId)
        .ifSuccessAsync((payload) => getUserTeams(userId: ownerUserId));
  }
}
