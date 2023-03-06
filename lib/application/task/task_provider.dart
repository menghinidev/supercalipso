import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:supercalipso/application/env.dart';
import 'package:supercalipso/application/task/task_service.dart';
import 'package:supercalipso/data/model/task/task.dart';
import 'package:supercalipso/data/provider/api/task/firestore_data_source.dart';
import 'package:supercalipso/data/provider/api/task/i_task_data_source.dart';
import 'package:supercalipso/data/provider/api/task/mocked_data_source.dart';
import 'package:supercalipso/data/repository/task_repository.dart';

final taskDataSourceProvider = Provider<ITaskDataSource>((ref) {
  if (EnvVariables.isMocked) return MockedTaskDataSource();
  return TaskFirestoreDataSource();
});

final taskRepoProvider = Provider<TaskRepository>((ref) {
  return TaskRepository(dataProvider: ref.watch(taskDataSourceProvider));
});
