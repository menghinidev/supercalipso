import 'package:supercalipso/data/model/task/task.dart';
import 'package:supercalipso/data/provider/api/task/i_task_data_source.dart';
import 'package:supercalipso/plugin/utils/response.dart';
import 'package:supercalipso/data/provider/command/task/updateTask/update_task_command.dart';
import 'package:supercalipso/data/provider/command/task/createTask/create_task_command.dart';

class TaskFirestoreDataSource extends ITaskDataSource {
  @override
  Future<Response<Task>> createTask({required CreateTaskCommand command}) {
    // TODO: implement createTask
    throw UnimplementedError();
  }

  @override
  Future<Response> deleteTask({required String taskId}) {
    // TODO: implement deleteTask
    throw UnimplementedError();
  }

  @override
  Future<Response<Task>> readTask({required String taskId}) {
    // TODO: implement readTask
    throw UnimplementedError();
  }

  @override
  Future<Response<List<Task>>> readTeamTasks({required String teamId}) {
    // TODO: implement readTeamTasks
    throw UnimplementedError();
  }

  @override
  Future<Response<Task>> updateTask({required UpdateTaskCommand command}) {
    // TODO: implement updateTask
    throw UnimplementedError();
  }
}
