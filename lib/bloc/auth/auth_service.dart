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

  Future explicitLogin({required String email, required String password}) => authRepository.explicitLogin(
        email: email,
        password: password,
      );

  Future logout() async {
    await authRepository.logout();
  }
}
