import 'package:supercalipso/data/model/team/invitation.dart';
import 'package:supercalipso/data/model/team/team.dart';
import 'package:supercalipso/data/model/user/user.dart';
import 'package:supercalipso/data/provider/local_storage_provider.dart';
import 'package:supercalipso/data/provider/team_provider.dart';
import 'package:supercalipso/plugin/utils.dart';

class TeamRepository {
  final TeamsProvider teamsDataProvider;
  final LocalStorageProvider localStorage;

  TeamRepository({required this.teamsDataProvider, required this.localStorage});

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

  Future<Response> createTeamInvitation({required SuperCalipsoUser invitedUser}) {
    return Future.value(Responses.success(null));
  }
}
