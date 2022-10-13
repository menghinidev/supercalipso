import 'package:get_it/get_it.dart';
import 'package:supercalipso/data/provider/api/event/mocked_data_source.dart';
import 'package:supercalipso/data/provider/api/user/firebase_data_source.dart';
import 'package:supercalipso/data/provider/api/user/i_user_data_source.dart';
import 'package:supercalipso/data/provider/api/note/note_provider.dart';
import 'package:supercalipso/data/provider/api/team/team_provider.dart';
import 'package:supercalipso/data/repository/auth_repository.dart';
import 'package:supercalipso/data/repository/event_repository.dart';
import 'package:supercalipso/data/repository/note_repository.dart';
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
  }

  void installDataProviders() {
    GetIt.instance.registerSingleton<TeamsProvider>(TeamsProvider());
    GetIt.instance.registerSingleton<TeamEventProvider>(TeamEventProvider());
    GetIt.instance.registerSingleton<NoteProvider>(NoteProvider());
    GetIt.instance.registerSingleton<IUserDataSource>(UserFirebaseDataSource());
  }

  void installService<T extends Object>(T instance) => GetIt.instance.registerSingleton<T>(instance);
  T get<T extends Object>() => GetIt.instance.get<T>();
}
