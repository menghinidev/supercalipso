import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:supercalipso/bloc/auth/auth_provider.dart';
import 'package:supercalipso/bloc/auth/auth_service.dart';
import 'package:supercalipso/bloc/team/team_provider.dart';
import 'package:supercalipso/data/repository/auth_repository.dart';
import 'package:supercalipso/data/repository/team_repository.dart';

final startupServiceProvider = Provider<StartupService>((ref) {
  return StartupService(
    authRepository: ref.watch(authProvider),
    teamRepository: ref.watch(teamRepoProvider),
    authService: ref.watch(authServiceProvider),
  );
});

class StartupService {
  final AuthRepository authRepository;
  final AuthService authService;
  final TeamRepository teamRepository;

  StartupService({
    required this.authRepository,
    required this.teamRepository,
    required this.authService,
  }) {
    authRepository.loggedUserChanges.listen((event) {
      if (event != null) {
        teamRepository.getUserTeams(userId: event.uid);
        teamRepository.getUserTeamInvitations(userId: event.uid);
      }
    });
  }

  Future start() => authService.silentLogin();
}
