import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:supercalipso/application/auth/auth_notifier.dart';
import 'package:supercalipso/application/auth/authstate.dart';
import 'package:supercalipso/application/env.dart';
import 'package:supercalipso/data/model/user/user.dart';
import 'package:supercalipso/data/provider/api/user/firebase_data_source.dart';
import 'package:supercalipso/data/provider/api/user/i_user_data_source.dart';
import 'package:supercalipso/data/provider/api/user/mocked_data_souce.dart';
import 'package:supercalipso/data/repository/auth_repository.dart';

final userDataSouceProvider = Provider<IUserDataSource>((ref) {
  return EnvVariables.isMocked ? UserMockedDataSource() : UserFirestoreDataSource();
});

var authRepoProvider = Provider<AuthRepository>((ref) => AuthRepository(dataSource: ref.watch(userDataSouceProvider)));

final authStateProvider = StateNotifierProvider<AuthStateNotifier, AsyncValue<AuthState>>((ref) {
  return AuthStateNotifier(authRepository: ref.watch(authRepoProvider));
});

final getUserByIdProvider = FutureProvider.family<User, String>((ref, id) async {
  var repo = ref.watch(authRepoProvider);
  var user = await repo.getUserById(id: id);
  return user.payload!;
});
