import 'package:firebase_auth/firebase_auth.dart' as firebase;
import 'package:google_sign_in/google_sign_in.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:supercalipso/application/auth/authstate.dart';
import 'package:supercalipso/data/repository/auth_repository.dart';
import 'package:supercalipso/plugin/utils.dart';

class AuthStateNotifier extends StateNotifier<AuthState> {
  final AuthRepository authRepository;

  final GoogleSignIn googleSignIn = GoogleSignIn(
    scopes: [
      'email',
      'profile',
    ],
  );

  AuthStateNotifier({required this.authRepository}) : super(const AuthState.unauth());

  Future<Response> silentLogin() async {
    var uid = firebase.FirebaseAuth.instance.currentUser?.uid;
    if (uid == null) return Responses.failure([]);
    var user = await authRepository.getUserById(id: uid);
    user.ifSuccess((payload) => state = AuthState.auth(user: payload!));
    return user;
  }

  Future loginWithGoogle() async {
    final googleUser = await googleSignIn.signIn();
    final googleAuth = await googleUser?.authentication;
    final credential = firebase.GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );
    var firebaseUser = await firebase.FirebaseAuth.instance.signInWithCredential(credential);
    var user = await authRepository.getUserById(id: firebaseUser.user!.uid);
    user.ifSuccess((payload) => state = AuthState.auth(user: payload!));
    return Future.value();
  }

  Future logout() async {
    await firebase.FirebaseAuth.instance.signOut();
    return await googleSignIn.disconnect();
  }
}
