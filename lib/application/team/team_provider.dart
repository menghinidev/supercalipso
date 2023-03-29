import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:supercalipso/application/auth/auth_provider.dart';
import 'package:supercalipso/application/env.dart';
import 'package:supercalipso/application/team/team_service.dart';
import 'package:supercalipso/data/model/team/invitation/invitation.dart';
import 'package:supercalipso/data/model/team/subscription/subscription.dart';
import 'package:supercalipso/data/model/team/team.dart';
import 'package:supercalipso/data/model/user/user.dart';
import 'package:supercalipso/data/provider/api/team/firestore_data_source.dart';
import 'package:supercalipso/data/provider/api/team/i_team_data_source.dart';
import 'package:supercalipso/data/provider/api/team/mocked_data_source.dart';
import 'package:supercalipso/data/repository/team_repository.dart';

final teamDataSourceProvider = Provider<ITeamDataSource>((ref) {
  if (EnvVariables.isMocked) return TeamMockedDataSource();
  return TeamFirestoreDataSource();
});

final teamRepoProvider = Provider<TeamRepository>(
  (ref) => TeamRepository(teamsDataProvider: ref.watch(teamDataSourceProvider)),
);

final teamsChangesProvider = StreamProvider<List<Team>>((ref) async* {
  var uid = ref.watch(authStateProvider).mapOrNull(auth: (value) => value.user.uid);
  var teamSession = ref.watch(teamSessionStateProvider.select((value) => value.mapOrNull(logged: (value) => value)));
  if (teamSession != null && uid != null) {
    var repo = ref.watch(teamRepoProvider);
    var invitations = await repo.getUserTeams(userId: uid);
    yield invitations.payload!;
  }
});

final teamInvitationsChangesProvider = StreamProvider<List<TeamInvitation>>((ref) async* {
  var uid = ref.watch(authStateProvider).mapOrNull(auth: (value) => value.user.uid);
  var teamSession = ref.watch(teamSessionStateProvider.select((value) => value.mapOrNull(logged: (value) => value)));
  if (teamSession != null && uid != null) {
    var repo = ref.watch(teamRepoProvider);
    var invitations = await repo.getUserTeamInvitations(userId: uid);
    yield invitations.payload!;
  }
});

final pendingTeamInvitationsChangesProvider = StreamProvider<List<TeamInvitation>>((ref) async* {
  var uid = ref.watch(authStateProvider).mapOrNull(auth: (value) => value.user.uid);
  var teamSession = ref.watch(teamSessionStateProvider.select((value) => value.mapOrNull(logged: (value) => value)));
  if (teamSession != null && uid != null) {
    var repo = ref.watch(teamRepoProvider);
    var invitations = await repo.getUserTeamInvitations(userId: uid);
    var filtered = invitations.payload!.where((element) => element.status == TeamInvitationStatus.unknown);
    yield filtered.toList();
  }
});

final loggedTeamMembersProvider = StreamProvider<List<User>>((ref) async* {
  var teamSession = ref.watch(teamSessionStateProvider.select((value) => value.mapOrNull(logged: (value) => value)));
  if (teamSession != null) {
    var authRepo = ref.watch(authRepoProvider);
    var teamRepo = ref.watch(teamRepoProvider);
    var team = await teamRepo.getTeamSubscriptions(teamId: teamSession.team.id);
    var users = await team.flatAndCollectAsync<User, TeamSubscription>(
      team.payload!,
      (source) => authRepo.getUserById(id: source.subscribedUserId),
    );
    yield users.payload!;
  }
});

final teamProvider = FutureProvider.family<Team, String>((ref, id) async {
  var response = await ref.watch(teamRepoProvider).getTeam(teamId: id);
  return response;
});
