import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:supercalipso/data/model/user/user.dart';
import 'package:supercalipso/data/reposotory/auth_repository.dart';

var authProvider = Provider<AuthRepository>((ref) => AuthRepository());

var authChanges = StreamProvider<User?>((ref) {
  var repo = ref.watch(authProvider);
  return repo.loggedUserChanges;
});
