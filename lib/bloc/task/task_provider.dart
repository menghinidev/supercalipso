import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:supercalipso/bloc/task/task_service.dart';
import 'package:supercalipso/data/model/task/task.dart';
import 'package:supercalipso/data/repository/task_repository.dart';

final taskRepoProvider = Provider<TaskRepository>((ref) {
  return Installer.instance.get<TaskRepository>();
});

final tasksChangesProvider = StreamProvider<List<Task>>((ref) {
  return ref.watch(taskServiceProvider).loggedTeamTasks;
});
