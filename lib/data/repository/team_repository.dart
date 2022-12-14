import 'dart:async';

import 'package:rxdart/rxdart.dart';
import 'package:supercalipso/data/model/team/invitation/invitation.dart';
import 'package:supercalipso/data/model/team/subscription/subscription.dart';
import 'package:supercalipso/data/model/team/team.dart';
import 'package:supercalipso/data/provider/api/team/i_team_data_source.dart';
import 'package:supercalipso/data/provider/command/team/createInvitation/create_team_invitation_command.dart';
import 'package:supercalipso/data/provider/command/team/createTeam/create_team_command.dart';
import 'package:supercalipso/data/provider/command/team/replyToInvitation/replayto_invitation_command.dart';
import 'package:supercalipso/plugin/utils.dart';
import 'package:supercalipso/services/installer.dart';

class TeamRepository {
  final BehaviorSubject<List<Team>> enrolledTeamsController;
  final BehaviorSubject<List<TeamInvitation>> teamsInvitationsController;
  final teamsDataProvider = Installer.instance.get<ITeamDataSource>();
  String? loggedTeamId;

  TeamRepository()
      : enrolledTeamsController = BehaviorSubject<List<Team>>(),
        teamsInvitationsController = BehaviorSubject<List<TeamInvitation>>();

  Stream<List<Team>> get enrolledTeams => enrolledTeamsController.stream;
  Stream<List<TeamInvitation>> get invitationsChanges => teamsInvitationsController.stream;

  Stream<Team?> get currentTeam =>
      enrolledTeamsController.stream.map((event) => event.getWhere((element) => element.id == loggedTeamId)).distinct();

  Future<Response<List<Team>>> getUserTeams({required String userId}) async {
    var subs = await teamsDataProvider.readUserTeamsSubscriptions(userId: userId);
    var teams = await subs.flatAndCollectAsync<Team, TeamSubscription>(
      subs.payload!,
      (source) => teamsDataProvider.readTeam(teamId: source.teamId),
    );
    teams.ifSuccess((payload) => enrolledTeamsController.add(payload!));
    return teams;
  }

  Future<Team> getTeam({required String teamId}) async {
    var teams = await teamsDataProvider.readTeam(teamId: teamId);
    return teams.isError ? Future.error('error') : Future.value(teams.payload!);
  }

  Future loginWithTeam({required String teamId, required String userId}) async {
    loggedTeamId = teamId;
    return await getUserTeams(userId: userId);
  }

  Future<Response<Team>> createTeam({required String name, required String userId}) async {
    var response = await teamsDataProvider.createTeam(command: CreateTeamCommand(name: name, userId: userId));
    return await response.ifSuccessAsync((payload) => getUserTeams(userId: userId));
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
    var command = ReplyToInvitationCommand(invitationId: teamInvitationId, status: status.name);
    return await teamsDataProvider
        .replyTeamInvitation(command: command)
        .ifSuccessAsync((payload) => getUserTeamInvitations(userId: userId))
        .ifSuccessAsync((payload) => getUserTeams(userId: userId));
  }

  Future<Response> createTeamInvitation({
    required String invitedUserId,
    required String ownerUserId,
    required String teamId,
  }) async {
    var command = CreateTeamInvitationCommand(
      invitedUserId: invitedUserId,
      invitedByUserId: ownerUserId,
      teamId: teamId,
      createdAt: DateTime.now().toUtc(),
      status: TeamInvitationStatus.unknown.name,
    );
    return await teamsDataProvider
        .createTeamInvitation(command: command)
        .ifSuccessAsync((payload) => getUserTeams(userId: ownerUserId));
  }

  Future<Response<List<TeamSubscription>>> getTeamSubscriptions({required String teamId}) async {
    return await teamsDataProvider.readTeamSubscriptions(teamId: teamId);
  }

  Future<Response> logoutFromTeam() {
    enrolledTeamsController.add(<Team>[]);
    return Future.value(Responses.success(null));
  }
}
