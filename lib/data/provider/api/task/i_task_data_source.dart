import 'package:supercalipso/data/model/task/task.dart';
import 'package:supercalipso/data/provider/command/task/createTask/create_task_command.dart';
import 'package:supercalipso/data/provider/command/task/updateTask/update_task_command.dart';
import 'package:supercalipso/plugin/utils.dart';

abstract class ITaskDataSource {
  Future<Response<List<Task>>> readTeamTasks({required String teamId});
  Future<Response<Task>> readTask({required String taskId});
  Future<Response<Task>> createTask({required CreateTaskCommand command});
  Future<Response<Task>> updateTask({required UpdateTaskCommand command});
  Future<Response> deleteTask({required String taskId});
}
