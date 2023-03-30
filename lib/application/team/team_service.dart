import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:supercalipso/application/auth/auth_provider.dart';
import 'package:supercalipso/application/auth/authstate.dart';
import 'package:supercalipso/application/team/team_provider.dart';
import 'package:supercalipso/application/team/teamsessionstate.dart';
import 'package:supercalipso/data/model/team/invitation/invitation.dart';
import 'package:supercalipso/data/repository/auth_repository.dart';
import 'package:supercalipso/data/repository/team_repository.dart';
import 'package:supercalipso/plugin/utils.dart';

final teamInvitationsProvider = FutureProvider<Response<List<TeamInvitation>>>((ref) async {
  var authState = ref.watch(authStateProvider);
  var uid = authState.whenOrNull(auth: (user) => user.uid);
  if (uid == null) return Responses.success(<TeamInvitation>[]);
  return ref.watch(teamRepoProvider).getUserTeamInvitations(userId: uid);
});

final teamSessionStateProvider = StateNotifierProvider<TeamSessionNotifier, TeamSessionState>((ref) {
  var auth = ref.watch(authStateProvider);
  var value = auth.whenOrNull(auth: (user) => auth);
  return TeamSessionNotifier(
    teamRepository: ref.watch(teamRepoProvider),
    authRepository: ref.watch(authRepoProvider),
    authState: value,
  );
});

class TeamSessionNotifier extends StateNotifier<TeamSessionState> {
  final TeamRepository teamRepository;
  final AuthRepository authRepository;
  final AuthState? authState;

  TeamSessionNotifier({
    required this.teamRepository,
    required this.authRepository,
    required this.authState,
  }) : super(const TeamSessionState.homeless()) {
    silentloginWithTeam();
  }

  Future switchToTeamSession({required String teamId}) async {}

  Future<Response> replyTeamInvitation({required TeamInvitationStatus status, required String teamInvitationId}) async {
    var userId = authState?.whenOrNull(auth: (user) => user.uid);
    if (userId == null) return Responses.failure([]);
    return await teamRepository.replyToTeamInvitation(
      status: status,
      teamInvitationId: teamInvitationId,
      userId: userId,
    );
  }

  Future<Response> inviteUserToTeam({required String email, required String teamId}) async {
    var userId = authState?.whenOrNull(auth: (user) => user.uid);
    if (userId == null) return Responses.failure([]);
    var toInvite = await authRepository.getUserByEmail(email: email);
    var response = await toInvite.flatMapAsync((t) => teamRepository.createTeamInvitation(
          ownerUserId: userId,
          invitedUserId: t!.uid,
          teamId: teamId,
        ));
    return response;
  }

  Future<Response> createTeam({required String name}) async {
    var userId = authState?.whenOrNull(auth: (user) => user.uid);
    if (userId == null) return Responses.failure([]);
    return await teamRepository
        .createTeam(name: name, userId: userId)
        .ifSuccessAsync((payload) => loginWithTeam(teamId: payload!.id));
  }

  loginWithTeam({required String teamId}) async {
    var userId = authState?.whenOrNull(auth: (user) => user.uid);
    if (userId == null) return Responses.failure([]);
    var team = await teamRepository.getTeam(teamId: teamId);
    state = TeamSessionState.logged(team: team);
  }

  silentloginWithTeam() async {
    var userId = authState?.whenOrNull(auth: (user) => user.uid);
    if (userId == null) return Responses.failure([]);
    var teams = await teamRepository.getUserTeams(userId: userId);
    if (teams.isError) return state = TeamSessionState.signedOut(teams: teams.payload!);
    var firstTeamId = teams.payload!.first.id;
    var team = await teamRepository.getTeam(teamId: firstTeamId);
    state = TeamSessionState.logged(team: team);
  }
}
