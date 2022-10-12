import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:supercalipso/data/model/user/user.dart';
import 'package:supercalipso/data/repository/auth_repository.dart';
import 'package:supercalipso/services/installer.dart';

var authProvider = Provider<AuthRepository>((ref) => Installer.instance.get<AuthRepository>());

var authChanges = StreamProvider<User?>((ref) {
  return ref.watch(authProvider).loggedUserChanges;
});
