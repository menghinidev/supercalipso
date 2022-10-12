import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:supercalipso/data/provider/user_provider.dart';
import 'package:supercalipso/data/repository/user_repository.dart';
import 'package:supercalipso/services/installer.dart';

final userRepoProvider = Provider<UserRepository>((ref) {
  return Installer.instance.get<UserRepository>();
});
