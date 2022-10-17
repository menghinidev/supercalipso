import 'package:supercalipso/data/model/task/task.dart';
import 'package:supercalipso/data/provider/api/task/i_task_data_source.dart';
import 'package:supercalipso/data/provider/command/task/updateTask/update_task_command.dart';
import 'package:supercalipso/data/provider/command/task/createTask/create_task_command.dart';
import 'package:supercalipso/data/provider/mocked.dart';
import 'package:supercalipso/plugin/utils/extensions/list_extensions.dart';
import 'package:supercalipso/plugin/utils/response.dart';

class MockedTaskDataSource extends ITaskDataSource with IdentifierFactory {
  final mocked = MockValues.instance;

  @override
  Future<Response<Task>> createTask({required CreateTaskCommand command}) {
    var task = command.createTaskDTO(createID());
    mocked.tasks.add(task);
    return Future.value(Responses.success(task));
  }

  @override
  Future<Response> deleteTask({required String taskId}) {
    mocked.tasks.removeWhere((element) => element.id == taskId);
    return Future.value(Responses.success(null));
  }

  @override
  Future<Response<Task>> readTask({required String taskId}) {
    var task = mocked.tasks.getWhere((element) => element.id == taskId);
    if (task == null) return Future.value(Responses.failure([]));
    return Future.value(Responses.success(task));
  }

  @override
  Future<Response<List<Task>>> readTeamTasks({required String teamId}) {
    var tasks = mocked.tasks.where((element) => element.teamId == teamId).toList();
    return Future.value(Responses.success(tasks));
  }

  @override
  Future<Response<Task>> updateTask({required UpdateTaskCommand command}) {
    var task = mocked.tasks.getWhere((element) => element.id == command.taskId);
    if (task == null) return Future.value(Responses.failure([]));
    var updated = command.createTaskDTO(task);
    mocked.tasks.removeWhere((element) => element.id == command.taskId);
    mocked.tasks.add(updated);
    return Future.value(Responses.success(updated));
  }
}
