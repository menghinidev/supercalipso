import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:supercalipso/bloc/auth/auth_provider.dart';
import 'package:supercalipso/bloc/task/task_provider.dart';
import 'package:supercalipso/bloc/team/team_provider.dart';
import 'package:supercalipso/data/model/task/task.dart';
import 'package:supercalipso/data/repository/auth_repository.dart';
import 'package:supercalipso/data/repository/task_repository.dart';
import 'package:supercalipso/data/repository/team_repository.dart';
import 'package:supercalipso/plugin/utils.dart';

final taskServiceProvider = Provider<TaskService>((ref) {
  return TaskService(
    authRepository: ref.watch(authProvider),
    taskRepository: ref.watch(taskRepoProvider),
    teamRepository: ref.watch(teamRepoProvider),
  );
});

class TaskService {
  final AuthRepository authRepository;
  final TeamRepository teamRepository;
  final TaskRepository taskRepository;

  TaskService({
    required this.authRepository,
    required this.taskRepository,
    required this.teamRepository,
  });

  Future<Response> createTask() async {
    return Responses.success(null);
  }

  Future<Response> askTeamTasks() async {
    var teamId = teamRepository.loggedTeamId;
    if (teamId == null) return Responses.failure([]);
    return await taskRepository.getTeamTasks(teamId: teamId);
  }

  Stream<List<Task>> get loggedTeamTasks {
    var currentTeamId = teamRepository.loggedTeamId;
    if (currentTeamId == null) return Stream.value(<Task>[]);
    return taskRepository.getTeamTasksChanges(teamId: currentTeamId);
  }
}
