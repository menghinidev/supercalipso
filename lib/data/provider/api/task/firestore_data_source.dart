import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:supercalipso/data/model/task/task.dart';
import 'package:supercalipso/data/provider/api/constants.dart';
import 'package:supercalipso/data/provider/api/task/i_task_data_source.dart';
import 'package:supercalipso/plugin/utils/response.dart';
import 'package:supercalipso/data/provider/command/task/updateTask/update_task_command.dart';
import 'package:supercalipso/data/provider/command/task/createTask/create_task_command.dart';

class TaskFirestoreDataSource extends ITaskDataSource {
  final firestore = FirebaseFirestore.instance;

  @override
  Future<Response<Task>> createTask({required CreateTaskCommand command}) async {
    var document = firestore.collection(FirestoreCollections.tasks).doc();
    var task = command.createTaskDTO(document.id);
    await document.set(task.toJson());
    return Responses.success(task);
  }

  @override
  Future<Response> deleteTask({required String taskId}) async {
    var document = firestore.collection(FirestoreCollections.tasks).doc(taskId);
    await document.delete();
    return Responses.success(null);
  }

  @override
  Future<Response<Task>> readTask({required String taskId}) async {
    var document = firestore.collection(FirestoreCollections.tasks).doc(taskId);
    var task = Task.fromJson((await document.get()).data()!);
    return Responses.success(task);
  }

  @override
  Future<Response<List<Task>>> readTeamTasks({required String teamId}) async {
    var documents = await firestore.collection(FirestoreCollections.tasks).where('teamId', isEqualTo: teamId).get();
    var tasks = documents.docs.map((e) => Task.fromJson(e.data())).toList();
    return Responses.success(tasks);
  }

  @override
  Future<Response<Task>> updateTask({required UpdateTaskCommand command}) async {
    var document = firestore.collection(FirestoreCollections.tasks).doc(command.taskId);
    var task = Task.fromJson((await document.get()).data()!);
    var updated = command.createTaskDTO(task);
    await document.update(updated.toJson());
    return Responses.success(updated);
  }
}
