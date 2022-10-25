import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:supercalipso/bloc/auth/auth_provider.dart';
import 'package:supercalipso/bloc/auth/auth_service.dart';
import 'package:supercalipso/bloc/event/event_service.dart';
import 'package:supercalipso/bloc/note/note_service.dart';
import 'package:supercalipso/bloc/task/task_service.dart';
import 'package:supercalipso/bloc/team/team_provider.dart';
import 'package:supercalipso/bloc/team/team_service.dart';
import 'package:supercalipso/data/repository/auth_repository.dart';
import 'package:supercalipso/data/repository/team_repository.dart';
import 'package:supercalipso/services/navigation/router_provider.dart';
import 'package:supercalipso/services/navigation/routes.dart';

final startupServiceProvider = Provider<StartupService>((ref) {
  return StartupService(
    goRouter: ref.watch(routerProvider),
    authRepository: ref.watch(authProvider),
    teamRepository: ref.watch(teamRepoProvider),
    authService: ref.watch(authServiceProvider),
    teamService: ref.watch(teamServiceProvider),
    eventService: ref.watch(eventServiceProvider),
    taskService: ref.watch(taskServiceProvider),
    noteService: ref.watch(noteServiceProvider),
  );
});

class StartupService {
  final AuthRepository authRepository;
  final TeamRepository teamRepository;

  final NoteService noteService;
  final AuthService authService;
  final TeamService teamService;
  final EventService eventService;
  final TaskService taskService;
  final GoRouter goRouter;

  StartupService({
    required this.goRouter,
    required this.authRepository,
    required this.teamRepository,
    required this.authService,
    required this.teamService,
    required this.eventService,
    required this.taskService,
    required this.noteService,
  }) {
    authRepository.loggedUserChanges.listen((event) {
      teamService.getTeamsInvitations();
    });
    teamRepository.currentTeam.listen((event) {
      eventService.askTeamEvents();
      taskService.askTeamTasks();
      noteService.askTeamNotes();
    });
  }

  Future start() async {
    var loginResponse = await authService.silentLogin();
    if (loginResponse.isError) goRouter.go(LoginPageRoute.pagePath);
    var login = await loginResponse.flatMapAsync((e) => teamService.silentloginWithTeam());
    return login.ifSuccess((payload) => goRouter.go(DashboardPageRoute.pagePath));
  }
}
