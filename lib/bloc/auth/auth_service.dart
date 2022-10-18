import 'package:firebase_auth/firebase_auth.dart' as firebase;
import 'package:google_sign_in/google_sign_in.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:supercalipso/bloc/auth/auth_provider.dart';
import 'package:supercalipso/bloc/team/team_service.dart';
import 'package:supercalipso/data/model/user/user.dart';
import 'package:supercalipso/data/repository/auth_repository.dart';
import 'package:supercalipso/plugin/utils.dart';

final authServiceProvider = Provider<AuthService>((ref) {
  return AuthService(
    authRepository: ref.watch(authProvider),
    teamService: ref.watch(teamServiceProvider),
  );
});

final userServiceProvider = Provider<UserService>((ref) {
  return UserService(ref.watch(authProvider));
});

final getUserByIdProvider = FutureProvider.family<User, String>((ref, id) {
  return ref.watch(userServiceProvider).getUser(id);
});

class AuthService {
  final AuthRepository authRepository;
  final TeamService teamService;

  final GoogleSignIn googleSignIn = GoogleSignIn(
    scopes: [
      'email',
      'profile',
    ],
  );

  AuthService({required this.authRepository, required this.teamService});

  Future<Response> silentLogin() async {
    var uid = firebase.FirebaseAuth.instance.currentUser?.uid;
    if (uid == null) return await authRepository.logout();
    return await authRepository.silentLogin(uid: uid);
  }

  Future loginWithGoogle() async {
    final googleUser = await googleSignIn.signIn();
    final googleAuth = await googleUser?.authentication;
    final credential = firebase.GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );
    var firebaseUser = await firebase.FirebaseAuth.instance.signInWithCredential(credential);
    var loginResponse = await authRepository.firebaseLogin(credentials: firebaseUser);
    return await loginResponse.ifSuccessAsync((payload) => teamService.silentloginWithTeam());
  }

  Future hardLogin({required String userId}) async {
    return authRepository.silentLogin(uid: userId).ifSuccessAsync((payload) => teamService.silentloginWithTeam());
  }

  Future logout() async {
    await firebase.FirebaseAuth.instance.signOut();
    await googleSignIn.disconnect();
    return await authRepository.logout();
  }
}

class UserService {
  final AuthRepository authRepository;

  UserService(this.authRepository);

  Future<User> getUser(String userId) async {
    var response = await authRepository.getUserById(id: userId);
    if (response.isError) return Future.error('error');
    return response.payload!;
  }
}
