import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:supercalipso/application/auth/auth_provider.dart';
import 'package:supercalipso/application/team/team_provider.dart';
import 'package:supercalipso/application/team/team_service.dart';
import 'package:supercalipso/services/navigation/routes.dart';

var routerProvider = Provider<GoRouter>((ref) {
  var routerNotifer = RouterNotifier(ref);

  return GoRouter(
    navigatorKey: RouterNotifier.mainNavigatorKey,
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
  static final homePageNavigatorKey = GlobalKey<NavigatorState>();

  RouterNotifier(this.ref);

  String? redirectLogic(BuildContext context, GoRouterState state) {
    final isLogged = ref.read(authStateProvider).whenOrNull(
              data: (value) => value.map(auth: (value) => true, unauth: (value) => false),
            ) ??
        false;
    final hasTeamId = ref.read(teamSessionStateProvider).mapOrNull(logged: (value) => true) ?? false;

    // From here we can use the state and implement our custom logic
    final isInLoginPage = state.location == LoginPageRoute.pagePath;

    if (!isLogged) {
      return isInLoginPage ? null : LoginPageRoute.pagePath;
    }

    if (isInLoginPage && !hasTeamId) return ProfilePageRoute.pagePath;

    if (state.location == DashboardPageRoute.pagePath && !hasTeamId) return ProfilePageRoute.pagePath;

    if (isInLoginPage && hasTeamId) return DashboardPageRoute.pagePath;

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
