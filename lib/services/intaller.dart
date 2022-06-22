import 'package:get_it/get_it.dart';
import 'package:supercalipso/data/provider/assets_provider.dart';
import 'package:supercalipso/data/provider/local_storage_provider.dart';
import 'package:supercalipso/data/provider/team_provider.dart';
import 'package:supercalipso/data/reposotory/assets_repository.dart';
import 'package:supercalipso/data/reposotory/team_repository.dart';
import 'package:supercalipso/plugin/bloc.dart';

class Installer {
  static final Installer _singleton = Installer._();
  static Installer get instance => _singleton;

  Installer._();

  void launchStartPipeline() {
    GetIt.instance.registerSingleton<ErrorManagerBloc>(ErrorManagerBloc());
    installDataProviders();
    installRepositories();
  }

  void installRepositories() {
    GetIt.instance.registerSingleton<TeamRepository>(TeamRepository(
      teamsDataProvider: get<TeamsProvider>(),
      localStorage: get<LocalStorageProvider>(),
    ));

    GetIt.instance.registerSingleton<AssetsRepository>(AssetsRepository(
      assetsProvider: get<AssetsProvider>(),
    ));
  }

  void installDataProviders() {
    GetIt.instance.registerSingleton<LocalStorageProvider>(LocalStorageProvider());
    GetIt.instance.registerSingleton<TeamsProvider>(TeamsProvider());
    GetIt.instance.registerSingleton<AssetsProvider>(AssetsProvider());
  }

  void installService<T extends Object>(T instance) => GetIt.instance.registerSingleton<T>(instance);
  T get<T extends Object>() => GetIt.instance.get<T>();
}
