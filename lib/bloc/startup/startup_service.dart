import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:supercalipso/bloc/auth/auth_provider.dart';
import 'package:supercalipso/bloc/auth/auth_service.dart';
import 'package:supercalipso/bloc/event/event_service.dart';
import 'package:supercalipso/bloc/task/task_service.dart';
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
    eventService: ref.watch(eventServiceProvider),
    taskService: ref.watch(taskServiceProvider),
  );
});

class StartupService {
  final AuthRepository authRepository;
  final TeamRepository teamRepository;
  final AuthService authService;
  final TeamService teamService;
  final EventService eventService;
  final TaskService taskService;

  StartupService({
    required this.authRepository,
    required this.teamRepository,
    required this.authService,
    required this.teamService,
    required this.eventService,
    required this.taskService,
  }) {
    authRepository.loggedUserChanges.listen((event) {
      teamService.getTeamsInvitations();
    });
    teamRepository.currentTeam.listen((event) {
      eventService.askTeamEvents();
      taskService.askTeamTasks();
    });
  }

  Future start() async {
    var loginResponse = await authService.silentLogin();
    return await loginResponse.flatMapAsync((e) => teamService.silentloginWithTeam());
  }
}
