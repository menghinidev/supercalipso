import 'dart:async';

import 'package:supercalipso/data/model/team/invitation/invitation.dart';
import 'package:supercalipso/data/model/team/team.dart';
import 'package:supercalipso/data/model/user/user.dart';
import 'package:supercalipso/data/provider/local_storage_provider.dart';
import 'package:supercalipso/data/provider/team_provider.dart';
import 'package:supercalipso/plugin/utils.dart';
import 'package:supercalipso/services/installer.dart';

class TeamRepository {
  final StreamController<List<Team>> teamsController;
  final teamsDataProvider = Installer.instance.get<TeamsProvider>();
  final localStorage = Installer.instance.get<LocalStorageProvider>();

  TeamRepository() : teamsController = StreamController<List<Team>>();

  Stream<List<Team>> get loggedUserTeamsChanges => teamsController.stream.asBroadcastStream();

  Stream<Team> teamChanges(String teamId) =>
      loggedUserTeamsChanges.map<Team>((event) => event.singleWhere((element) => element.id == teamId));

  Future<Response<List<Team>>> getUserTeams() async {
    var loggedUser = await localStorage.readCachedUserId();
    var teams = await loggedUser.flatMapAsync((t) => teamsDataProvider.readUserTeamsSubscriptions(userId: t!));
    return teams;
  }

  Future<Response<List<TeamInvitation>>> getUserTeamInvitations() async {
    var loggedUser = await localStorage.readCachedUserId();
    var invites = await loggedUser.flatMapAsync((t) => teamsDataProvider.readUserTeamsInvitations(userId: t!));
    return invites.map((t) => t!.map((e) => e.getUserInvite(userId: loggedUser.payload!)!).toList());
  }

  Future<Response> replyToTeamInvitation({
    required TeamInvitationStatus status,
    required String teamInvitationId,
  }) async {
    return Future.value(Responses.success(null));
  }

  Future<Response> createTeamInvitation({required User invitedUser}) {
    return Future.value(Responses.success(null));
  }
}
