import 'package:get_it/get_it.dart';
import 'package:supercalipso/bloc/env.dart';
import 'package:supercalipso/data/provider/api/event/firestore_data_source.dart';
import 'package:supercalipso/data/provider/api/event/i_event_data_source.dart';
import 'package:supercalipso/data/provider/api/event/mocked_data_source.dart';
import 'package:supercalipso/data/provider/api/note/firestore_data_source.dart';
import 'package:supercalipso/data/provider/api/note/i_note_data_source.dart';
import 'package:supercalipso/data/provider/api/note/mocked_data_source.dart';
import 'package:supercalipso/data/provider/api/task/firestore_data_source.dart';
import 'package:supercalipso/data/provider/api/task/i_task_data_source.dart';
import 'package:supercalipso/data/provider/api/task/mocked_data_source.dart';
import 'package:supercalipso/data/provider/api/team/firestore_data_source.dart';
import 'package:supercalipso/data/provider/api/team/i_team_data_source.dart';
import 'package:supercalipso/data/provider/api/team/mocked_data_source.dart';
import 'package:supercalipso/data/provider/api/user/firebase_data_source.dart';
import 'package:supercalipso/data/provider/api/user/i_user_data_source.dart';
import 'package:supercalipso/data/provider/api/user/mocked_data_souce.dart';
import 'package:supercalipso/data/repository/auth_repository.dart';
import 'package:supercalipso/data/repository/event_repository.dart';
import 'package:supercalipso/data/repository/note_repository.dart';
import 'package:supercalipso/data/repository/task_repository.dart';
import 'package:supercalipso/data/repository/team_repository.dart';

class Installer {
  static final Installer _singleton = Installer._();
  static Installer get instance => _singleton;

  Installer._();

  void launchStartPipeline() {
    installDataProviders();
    installRepositories();
  }

  void installRepositories() {
    GetIt.instance.registerSingleton<AuthRepository>(AuthRepository());
    GetIt.instance.registerSingleton<TeamRepository>(TeamRepository());
    GetIt.instance.registerSingleton<EventRepository>(EventRepository());
    GetIt.instance.registerSingleton<NoteRepository>(NoteRepository());
    GetIt.instance.registerSingleton<TaskRepository>(TaskRepository());
  }

  void installDataProviders() {
    GetIt.instance.registerSingleton<IUserDataSource>(onMockedData(
      onMockedData: () => UserMockedDataSource(),
      onTestValue: () => UserFirestoreDataSource(),
    ));
    GetIt.instance.registerSingleton<ITeamDataSource>(onMockedData(
      onMockedData: () => TeamMockedDataSource(),
      onTestValue: () => TeamFirestoreDataSource(),
    ));
    GetIt.instance.registerSingleton<IEventDataSource>(onMockedData(
      onMockedData: () => EventMockedDataSource(),
      onTestValue: () => TeamEventFirestoreDataSource(),
    ));
    GetIt.instance.registerSingleton<INoteDataSource>(onMockedData(
      onMockedData: () => NoteMockedDataSource(),
      onTestValue: () => NoteFirestoreDataSource(),
    ));
    GetIt.instance.registerSingleton<ITaskDataSource>(onMockedData(
      onMockedData: () => MockedTaskDataSource(),
      onTestValue: () => TaskFirestoreDataSource(),
    ));
  }

  T onMockedData<T>({required T Function() onMockedData, required T Function() onTestValue}) {
    if (EnvVariables.isMocked) return onMockedData();
    return onTestValue();
  }

  void installService<T extends Object>(T instance) => GetIt.instance.registerSingleton<T>(instance);
  T get<T extends Object>() => GetIt.instance.get<T>();
}
