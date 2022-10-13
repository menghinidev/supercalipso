import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:supercalipso/bloc/auth/auth_provider.dart';
import 'package:supercalipso/bloc/event/event_provider.dart';
import 'package:supercalipso/bloc/team/team_provider.dart';
import 'package:supercalipso/data/repository/auth_repository.dart';
import 'package:supercalipso/data/repository/event_repository.dart';
import 'package:supercalipso/data/repository/team_repository.dart';

final authServiceProvider = Provider<AuthService>((ref) {
  return AuthService(
    authRepository: ref.watch(authProvider),
    teamRepository: ref.watch(teamRepoProvider),
    eventRepository: ref.watch(eventRepositoryProvider),
  );
});

class AuthService {
  final AuthRepository authRepository;
  final TeamRepository teamRepository;
  final EventRepository eventRepository;

  final GoogleSignIn googleSignIn = GoogleSignIn(
    scopes: [
      'email',
      'profile',
    ],
  );

  AuthService({required this.authRepository, required this.teamRepository, required this.eventRepository});

  Future silentLogin() async {
    var uid = FirebaseAuth.instance.currentUser?.uid;
    if (uid == null) return await authRepository.logout();
    return await authRepository.silentLogin(uid: uid);
  }

  Future loginWithGoogle() async {
    final googleUser = await googleSignIn.signIn();
    final googleAuth = await googleUser?.authentication;
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );
    var firebaseUser = await FirebaseAuth.instance.signInWithCredential(credential);
    return await authRepository.firebaseLogin(credentials: firebaseUser);
  }

  Future logout() async {
    await FirebaseAuth.instance.signOut();
    await googleSignIn.disconnect();
    return await authRepository.logout();
  }
}
