import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:supercalipso/application/auth/auth_provider.dart';
import 'package:supercalipso/application/auth/authstate.dart';
import 'package:supercalipso/application/task/task_provider.dart';
import 'package:supercalipso/application/team/team_provider.dart';
import 'package:supercalipso/application/team/team_service.dart';
import 'package:supercalipso/application/team/teamsessionstate.dart';
import 'package:supercalipso/data/model/task/task.dart';
import 'package:supercalipso/data/repository/auth_repository.dart';
import 'package:supercalipso/data/repository/task_repository.dart';
import 'package:supercalipso/data/repository/team_repository.dart';
import 'package:supercalipso/plugin/utils.dart';

final taskServiceProvider = Provider<TaskService>((ref) {
  return TaskService(
    authState: ref.watch(authStateProvider),
    sessionState: ref.watch(teamSessionStateProvider),
    taskRepository: ref.watch(taskRepoProvider),
  );
});

class TaskService {
  final AuthState authState;
  final TeamSessionState sessionState;
  final TaskRepository taskRepository;

  TaskService({
    required this.authState,
    required this.taskRepository,
    required this.sessionState,
  });

  Future<Response> createTask({
    required String title,
    String? iconName,
    DateTime? deadline,
    String? assignedUserId,
  }) async {
    var teamId = sessionState.whenOrNull(logged: (team) => team.id);
    if (teamId == null) return Responses.failure([]);
    return await taskRepository.createTask(
      teamId: teamId,
      title: title,
      assignedUserId: assignedUserId,
      iconName: iconName,
      deadline: deadline,
    );
  }

  Future<Response> updateTask({
    required String taskId,
    String? title,
    String? iconName,
    DateTime? deadline,
    String? assignedUserId,
  }) async {
    var teamId = sessionState.whenOrNull(logged: (team) => team.id);
    if (teamId == null) return Responses.failure([]);
    return await taskRepository.updateTask(
      taskId: taskId,
      teamId: teamId,
      title: title,
      assignedUserId: assignedUserId,
      iconName: iconName,
      deadline: deadline,
    );
  }

  Future<Response> deleteTask({required String taskId}) => taskRepository.deleteTask(taskId: taskId);

  Future<Response> completeTask({required String taskId}) => taskRepository.completeTask(taskId: taskId);

  Future<Response> askTeamTasks() async {
    var teamId = sessionState.whenOrNull(logged: (team) => team.id);
    if (teamId == null) return Responses.failure([]);
    return await taskRepository.getTeamTasks(teamId: teamId);
  }
}
