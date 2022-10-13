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

  AuthService({required this.authRepository, required this.teamRepository, required this.eventRepository});

  Future silentLogin() => authRepository.silentLogin();

  Future loginWithGoogle() async {
    final googleUser = await GoogleSignIn(scopes: [
      'email',
      'profile',
    ]).signIn();

    final googleAuth = await googleUser?.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );
    // Once signed in, return the UserCredential
    var firebaseUser = await FirebaseAuth.instance.signInWithCredential(credential);
    return await authRepository.explicitLogin(email: firebaseUser.user!.email!, password: 'password');
  }

  Future logout() async {
    await authRepository.logout();
  }
}
