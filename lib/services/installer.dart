import 'package:get_it/get_it.dart';
import 'package:supercalipso/data/provider/event_provider.dart';
import 'package:supercalipso/data/provider/local_storage_provider.dart';
import 'package:supercalipso/data/provider/note_provider.dart';
import 'package:supercalipso/data/provider/team_provider.dart';
import 'package:supercalipso/data/provider/user_provider.dart';
import 'package:supercalipso/data/repository/auth_repository.dart';
import 'package:supercalipso/data/repository/event_repository.dart';
import 'package:supercalipso/data/repository/note_repository.dart';
import 'package:supercalipso/data/repository/team_repository.dart';
import 'package:supercalipso/data/repository/user_repository.dart';

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
    GetIt.instance.registerSingleton<UserRepository>(UserRepository());
    GetIt.instance.registerSingleton<EventRepository>(EventRepository());
    GetIt.instance.registerSingleton<NoteRepository>(NoteRepository());
  }

  void installDataProviders() {
    GetIt.instance.registerSingleton<LocalStorageProvider>(LocalStorageProvider());
    GetIt.instance.registerSingleton<TeamsProvider>(TeamsProvider());
    GetIt.instance.registerSingleton<UserProvider>(UserProvider());
    GetIt.instance.registerSingleton<TeamEventProvider>(TeamEventProvider());
    GetIt.instance.registerSingleton<NoteProvider>(NoteProvider());
  }

  void installService<T extends Object>(T instance) => GetIt.instance.registerSingleton<T>(instance);
  T get<T extends Object>() => GetIt.instance.get<T>();
}
