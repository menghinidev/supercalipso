import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:supercalipso/bloc/auth/auth_provider.dart';
import 'package:supercalipso/bloc/auth/auth_service.dart';
import 'package:supercalipso/bloc/team/team_provider.dart';
import 'package:supercalipso/bloc/team/team_service.dart';
import 'package:supercalipso/data/repository/auth_repository.dart';
import 'package:supercalipso/data/repository/team_repository.dart';

final startupServiceProvider = Provider<StartupService>((ref) {
  return StartupService(
    authRepository: ref.watch(authProvider),
    teamRepository: ref.watch(teamRepoProvider),
    authService: ref.watch(authServiceProvider),
    teamService: ref.watch(teamServiceProvider),
  );
});

class StartupService {
  final AuthRepository authRepository;
  final AuthService authService;
  final TeamRepository teamRepository;
  final TeamService teamService;

  StartupService({
    required this.authRepository,
    required this.teamRepository,
    required this.authService,
    required this.teamService,
  }) {
    authRepository.loggedUserChanges.listen((event) {
      if (event != null) {
        teamRepository.getUserTeams(userId: event.uid);
        teamRepository.getUserTeamInvitations(userId: event.uid);
      }
    });
  }

  Future start() async {
    var loginResponse = await authService.silentLogin();
    return await loginResponse.flatMapAsync((e) => teamService.silentloginWithTeam());
  }
}
