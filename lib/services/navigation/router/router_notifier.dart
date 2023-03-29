import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:supercalipso/application/auth/auth_provider.dart';
import 'package:supercalipso/application/auth/authstate.dart';
import 'package:supercalipso/services/navigation/routes.dart';

final routerNotifierProvider = AutoDisposeAsyncNotifierProvider<RouterNotifier, void>(() {
  return RouterNotifier();
});

class RouterNotifier extends AutoDisposeAsyncNotifier<void> implements Listenable {
  VoidCallback? routerListener;

  @override
  Future<void> build() async {
    // One could watch more providers and write logic accordingly

    final isAuth = ref.watch(authStateProvider);

    ref.listenSelf((_, __) {
      // One could write more conditional logic for when to call redirection
      if (state.isLoading) return;
      routerListener?.call();
    });
  }

  /// Redirects the user when our authentication changes
  String? redirect(BuildContext context, GoRouterState state) {
    var authValue = ref.read(authStateProvider);
    var loc = state.subloc;
    var isAuth = authValue.map(auth: (value) => true, unauth: (value) => false);
    if (loc != '/login' && !isAuth) return LoginPageRoute.pagePath;
    if (loc == '/login' && isAuth) return HomePageRoute.pagePath;
    return null;
  }

  /// Adds [GoRouter]'s listener as specified by its [Listenable].
  /// [GoRouteInformationProvider] uses this method on creation to handle its
  /// internal [ChangeNotifier].
  /// Check out the internal implementation of [GoRouter] and
  /// [GoRouteInformationProvider] to see this in action.
  @override
  void addListener(VoidCallback listener) {
    routerListener = listener;
  }

  /// Removes [GoRouter]'s listener as specified by its [Listenable].
  /// [GoRouteInformationProvider] uses this method when disposing,
  /// so that it removes its callback when destroyed.
  /// Check out the internal implementation of [GoRouter] and
  /// [GoRouteInformationProvider] to see this in action.
  @override
  void removeListener(VoidCallback listener) {
    routerListener = null;
  }
}
