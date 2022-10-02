import 'dart:async';
import 'package:supercalipso/data/model/user/user.dart';
import 'package:supercalipso/data/provider/mocked.dart';

class AuthRepository {
  final StreamController<User?> authStreamController;
  User? loggedUser;

  AuthRepository() : authStreamController = StreamController<User?>();

  Future silentLogin() async {
    await Future.delayed(const Duration(seconds: 2));

    var user = MockValues.instance.firstUser;
    authStreamController.add(user);
    loggedUser = user;
  }

  Future explicitLogin({required String email, required String password}) async {
    await Future.delayed(const Duration(seconds: 2));

    var user = MockValues.instance.firstUser;
    authStreamController.add(user);
    loggedUser = user;
  }

  Future logout() async {
    loggedUser = null;
    authStreamController.add(null);
  }

  Stream<User?> get loggedUserChanges => authStreamController.stream.asBroadcastStream();
}
