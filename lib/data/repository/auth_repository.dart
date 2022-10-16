import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart' as firebase;
import 'package:rxdart/subjects.dart';
import 'package:supercalipso/data/model/user/user.dart';
import 'package:supercalipso/data/provider/api/user/i_user_data_source.dart';
import 'package:supercalipso/data/provider/command/user/create/register_user_command.dart';
import 'package:supercalipso/plugin/utils.dart';
import 'package:supercalipso/services/installer.dart';

class AuthRepository {
  final BehaviorSubject<User?> authStreamController;
  final dataSource = Installer.instance.get<IUserDataSource>();
  User? loggedUser;

  AuthRepository() : authStreamController = BehaviorSubject<User?>();

  Future<Response> silentLogin({required String uid}) async {
    var user = await dataSource.getUserByUserId(userId: uid);
    user.ifSuccess((payload) => loggedUser = payload);
    user.ifSuccess((payload) => authStreamController.add(loggedUser));
    user.ifError((payload) => authStreamController.add(null));
    return user;
  }

  Future firebaseLogin({required firebase.UserCredential credentials}) async {
    var firebaseUser = credentials.user!;
    var user = await dataSource.getUserByUserId(userId: firebaseUser.uid);
    user.ifSuccess((payload) => loggedUser = payload);
    user.ifSuccess((payload) => authStreamController.add(loggedUser));
    if (!user.isError) return Future.value();
    var createdUser = await dataSource.registerUser(
      command: RegisterUserCommand(
        uid: firebaseUser.uid,
        displayName: firebaseUser.displayName!,
        email: firebaseUser.email!,
        imageURL: firebaseUser.photoURL,
      ),
    );
    createdUser.ifSuccess((payload) => loggedUser = payload);
    createdUser.ifSuccess((payload) => authStreamController.add(loggedUser));
    return Future.value();
  }

  Future<Response<User>> getUserByEmail({required String email}) async {
    var user = await dataSource.getUserByEmail(email: email);
    return user;
  }

  Future<Response<User>> getUserById({required String id}) async {
    var user = await dataSource.getUserByUserId(userId: id);
    return user;
  }

  Future logout() async {
    loggedUser = null;
    authStreamController.add(null);
  }

  Stream<User?> get loggedUserChanges => authStreamController.stream;
}
