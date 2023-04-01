import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:supercalipso/application/auth/auth_provider.dart';
import 'package:supercalipso/presenter/pages/splash/splash_page.dart';
import 'package:supercalipso/services/navigation/router/router_notifier.dart';
import 'package:supercalipso/services/navigation/routes.dart';

part 'router.g.dart';

final navigatorKeyProvider = Provider<GlobalKey<NavigatorState>>((ref) {
  return GlobalKey<NavigatorState>(debugLabel: 'routerKey');
});

@riverpod
GoRouter router(RouterRef ref) {
  var key = ref.watch(navigatorKeyProvider);
  var notifier = ref.watch(routerNotifierProvider.notifier);
  return GoRouter(
    navigatorKey: key,
    debugLogDiagnostics: kDebugMode,
    redirect: notifier.redirect,
    refreshListenable: notifier,
    routes: [
      SplashPageRoute(),
      LoginPageRoute(),
      HomePageRoute(),
      ProfilePageRoute(),
      NotePageRoute(),
      TaskPageRoute(),
      TeamPageRoute(),
      EventPageRoute(),
    ],
  );
}
