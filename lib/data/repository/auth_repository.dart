import 'dart:async';
import 'package:rxdart/subjects.dart';
import 'package:supercalipso/data/model/user/user.dart';
import 'package:supercalipso/data/provider/mocked.dart';

class AuthRepository {
  final BehaviorSubject<User?> authStreamController;
  User? loggedUser;

  AuthRepository() : authStreamController = BehaviorSubject<User?>();

  Future silentLogin() async {
    var user = MockValues.instance.firstUser;
    loggedUser = user;
    authStreamController.add(user);
    return Future.value();
  }

  Future explicitLogin({required String email, required String password}) async {
    var user = MockValues.instance.users.firstWhere((element) => element.email == email);
    loggedUser = user;
    authStreamController.add(user);
  }

  Future logout() async {
    loggedUser = null;
    authStreamController.add(null);
  }

  Stream<User?> get loggedUserChanges => authStreamController.stream;
}
