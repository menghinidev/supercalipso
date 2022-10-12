import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:supercalipso/bloc/auth/auth_provider.dart';
import 'package:supercalipso/services/navigation/routes.dart';

var routerProvider = Provider<GoRouter>((ref) {
  var routerNotifer = RouterNotifier(ref);

  return GoRouter(
    routes: [AppRoutes.home, AppRoutes.login],
    refreshListenable: routerNotifer,
    debugLogDiagnostics: kDebugMode,
    redirect: routerNotifer.redirectLogic,
  );
});

class RouterNotifier extends ChangeNotifier {
  final Ref ref;
  late StreamSubscription authChangesSub;

  RouterNotifier(this.ref) {
    var repo = ref.read(authProvider);
    authChangesSub = repo.loggedUserChanges.listen((event) => notifyListeners());
  }

  String? redirectLogic(GoRouterState state) {
    final user = ref.read(authProvider).loggedUser;

    // From here we can use the state and implement our custom logic
    final areWeLoggingIn = state.location == AppRoutes.login.path;

    if (user == null) {
      return areWeLoggingIn ? null : AppRoutes.login.path;
    }
    // We're logged in

    // At this point, IF we're in the login page, go to the home page
    if (areWeLoggingIn) return '/';

    // There's no need for a redirect at this point.
    return null;
  }
}
