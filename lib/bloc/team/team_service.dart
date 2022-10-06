import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:supercalipso/bloc/auth/auth_provider.dart';
import 'package:supercalipso/bloc/team/team_provider.dart';
import 'package:supercalipso/bloc/user/user_provider.dart';
import 'package:supercalipso/data/model/team/invitation/invitation.dart';
import 'package:supercalipso/data/model/team/team.dart';
import 'package:supercalipso/data/repository/auth_repository.dart';
import 'package:supercalipso/data/repository/team_repository.dart';
import 'package:supercalipso/data/repository/user_repository.dart';
import 'package:supercalipso/plugin/utils.dart';

var teamServiceProvider = Provider<TeamService>((ref) => TeamService(
      teamRepository: ref.watch(teamRepoProvider),
      authRepository: ref.watch(authProvider),
      userRepository: ref.watch(userRepoProvider),
    ));

class TeamService {
  final TeamRepository teamRepository;
  final AuthRepository authRepository;
  final UserRepository userRepository;

  TeamService({
    required this.teamRepository,
    required this.authRepository,
    required this.userRepository,
  });

  Future<Response<List<Team>>> getUserTeams() async {
    var userId = authRepository.loggedUser?.id;
    if (userId == null) return Responses.failure([]);
    var response = await teamRepository.getUserTeams(userId: userId);
    return response;
  }

  Future<Response<List<TeamInvitation>>> getTeamsInvitations() async {
    var userId = authRepository.loggedUser?.id;
    if (userId == null) return Responses.failure([]);
    var response = await teamRepository.getUserTeamInvitations(userId: userId);
    return response;
  }

  Future<Response> inviteUserToTeam({required String email, required String teamId}) async {
    var userId = authRepository.loggedUser?.id;
    if (userId == null) return Responses.failure([]);
    var toInvite = await userRepository.getUserByEmail(email: email);
    var response = await toInvite.flatMapAsync((t) => teamRepository.createTeamInvitation(
          ownerUserId: userId,
          invitedUserId: t!.id,
          teamId: teamId,
        ));
    return response;
  }
}
