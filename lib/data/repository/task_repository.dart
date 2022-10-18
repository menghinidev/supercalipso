import 'package:rxdart/rxdart.dart';
import 'package:supercalipso/data/model/task/task.dart';
import 'package:supercalipso/data/provider/api/task/i_task_data_source.dart';
import 'package:supercalipso/data/provider/command/task/createTask/create_task_command.dart';
import 'package:supercalipso/data/provider/command/task/updateTask/update_task_command.dart';
import 'package:supercalipso/data/repository/event_repository.dart';
import 'package:supercalipso/plugin/utils.dart';
import 'package:supercalipso/services/installer.dart';

class TaskRepository {
  var dataProvider = Installer.instance.get<ITaskDataSource>();
  var controller = BehaviorSubject<List<Task>>();

  Stream<List<Task>> getTeamTasksChanges({required String teamId}) =>
      controller.stream.map((event) => event.where((element) => element.teamId == teamId).toList());
  Stream<Task> getTaskChanges({required String taskId}) =>
      controller.stream.mapNotNull((event) => event.getWhere((element) => element.id == taskId));

  Future<Response<List<Task>>> getTeamTasks({required String teamId}) async {
    return await dataProvider.readTeamTasks(teamId: teamId).ifSuccess((payload) => controller.add(payload!));
  }

  Future<Response> createTask({
    required String teamId,
    required String title,
    DateTime? deadline,
    String? iconName,
    String? assignedUserId,
  }) async {
    var command = CreateTaskCommand(
      teamId: teamId,
      title: title,
      assignedUserId: assignedUserId,
      deadline: deadline,
      iconName: iconName,
    );
    return await dataProvider.createTask(command: command).ifSuccess((payload) => getTeamTasks(teamId: teamId));
  }

  Future<Response> updateTask({
    required String taskId,
    required String teamId,
    String? assignedUserId,
    String? title,
    DateTime? deadline,
    String? iconName,
    TaskStatus? status,
  }) async {
    var command = UpdateTaskCommand(
      taskId: taskId,
      title: title,
      assignedUserId: assignedUserId,
      deadline: deadline,
      iconName: iconName,
      status: status,
    );
    return await dataProvider.updateTask(command: command).ifSuccess((payload) => getTeamTasks(teamId: teamId));
  }

  Future<Response> completeTask({required String taskId}) async {
    var task = await dataProvider.readTask(taskId: taskId);
    return task.flatMapAsync((t) => updateTask(
          taskId: taskId,
          teamId: t!.teamId,
          assignedUserId: t.assignedUserId,
          deadline: t.deadline,
          iconName: t.iconName,
          title: t.title,
          status: TaskStatus.done,
        ));
  }

  Future<Response> deleteTask({required String taskId}) async {
    var task = await dataProvider.readTask(taskId: taskId);
    if (task.isError) return task;
    return await dataProvider
        .deleteTask(taskId: taskId)
        .ifSuccess((payload) => getTeamTasks(teamId: task.payload!.teamId));
  }
}
