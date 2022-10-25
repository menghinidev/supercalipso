import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:supercalipso/bloc/auth/auth_provider.dart';
import 'package:supercalipso/bloc/team/team_provider.dart';
import 'package:supercalipso/services/navigation/routes.dart';

var routerProvider = Provider<GoRouter>((ref) {
  var routerNotifer = RouterNotifier(ref);

  return GoRouter(
    routes: AppRoutes.routes,
    refreshListenable: routerNotifer,
    debugLogDiagnostics: kDebugMode,
    redirect: routerNotifer.redirectLogic,
  );
});

class RouterNotifier extends ChangeNotifier {
  final Ref ref;
  late StreamSubscription authChangesSub;
  late StreamSubscription loggedTeamChangesSub;
  static final mainNavigatorKey = GlobalKey<NavigatorState>();

  RouterNotifier(this.ref) {
    var authRepo = ref.read(authProvider);
    var teamRepo = ref.read(teamRepoProvider);
    authChangesSub = authRepo.loggedUserChanges.listen((event) {
      if (event == null) notifyListeners();
    });
    loggedTeamChangesSub = teamRepo.currentTeam.listen((event) {
      notifyListeners();
    });
  }

  String? redirectLogic(BuildContext context, GoRouterState state) {
    final user = ref.read(authProvider).loggedUser;
    final hasTeamId = ref.read(teamRepoProvider).loggedTeamId != null;

    // From here we can use the state and implement our custom logic
    final isInLoginPage = state.location == LoginPageRoute.pagePath;

    if (user == null) {
      return isInLoginPage ? null : LoginPageRoute.pagePath;
    }

    if (isInLoginPage && !hasTeamId) return ProfilePageRoute.pagePath;

    if (state.location == DashboardPageRoute.pagePath && !hasTeamId) return ProfilePageRoute.pagePath;

    if (isInLoginPage && hasTeamId) return '/';

    return null;
  }
}

extension PopFallback on GoRouter {
  popOrHome() {
    if (navigator?.canPop() ?? false) {
      pop();
      return;
    }
    go(DashboardPageRoute.pagePath);
  }
}
