import 'package:firebase_auth/firebase_auth.dart' as firebase;
import 'package:firebase_auth/firebase_auth.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:supercalipso/application/auth/authstate.dart';
import 'package:supercalipso/data/repository/auth_repository.dart';
import 'package:supercalipso/plugin/utils.dart';

class AuthStateNotifier extends StateNotifier<AuthState> {
  final AuthRepository authRepository;

  AuthStateNotifier({required this.authRepository}) : super(const AuthState.unauth());

  Future<Response> silentLogin() async {
    var uid = firebase.FirebaseAuth.instance.currentUser?.uid;
    if (uid == null) return Responses.failure([]);
    var user = await authRepository.getUserById(id: uid);
    user.ifSuccess((payload) => state = AuthState.auth(user: payload!));
    return user;
  }

  Future loginWithGoogle() async {
    var identityProvider = GoogleAuthProvider().addScope('email').addScope('profile');
    var credential = await firebase.FirebaseAuth.instance.signInWithProvider(identityProvider);
    var firebaseUser = await firebase.FirebaseAuth.instance.signInWithCredential(credential.credential!);
    var user = await authRepository.getUserById(id: firebaseUser.user!.uid);
    user.ifSuccess((payload) => state = AuthState.auth(user: payload!));
    return Future.value();
  }

  Future logout() async {
    await firebase.FirebaseAuth.instance.signOut();
  }
}
