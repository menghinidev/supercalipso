import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:supercalipso/application/auth/auth_provider.dart';
import 'package:supercalipso/application/auth/authstate.dart';
import 'package:supercalipso/services/navigation/routes.dart';

part 'router_notifier.g.dart';

/// This notifier exposes nothing (void) but implements [Listenable].
/// This notifier is meant to just access its internal [Notifier].
///
/// This notifier triggers our router's listener everytime is needed.
/// In this simple case, we do so when `auth` changes.
///
/// SIDE NOTE.
/// This might look overcomplicated at a first glance;
/// Instead, this method aims to follow some good some good practices:
///   1. It doesn't require us to pipe down any `ref` parameter
///   2. Since it's not meant to be _watched_, it uselessly rebuild a [GoRouter]
///      every time something changes
///   3. It works as a complete replacement for [ChangeNotifier] (it's a [Listenable] implementation)
///   4. It allows for listening to multiple providers if needed
@riverpod
class RouterNotifier extends _$RouterNotifier implements Listenable {
  VoidCallback? routerListener;

  @override
  Future<bool> build() async {
    // One could watch more providers and write logic accordingly

    final isAuth = ref.watch(authStateProvider.select((value) => !value.isLoading));

    ref.listenSelf((_, __) {
      // One could write more conditional logic for when to call redirection
      if (state.isLoading) return;
      routerListener?.call();
    });

    return isAuth;
  }

  /// Redirects the user when our authentication changes
  String? redirect(BuildContext context, GoRouterState state) {
    var authValue = ref.watch(authStateProvider);
    if (authValue.isLoading) return null;
    var loc = state.subloc;
    var isAuth = authValue.requireValue.map(auth: (value) => true, unauth: (value) => false);
    if (loc != '/login' && !isAuth) return LoginPageRoute.pagePath;
    if (loc == '/login' && isAuth) return DashboardPageRoute.pagePath;
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
