import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:supercalipso/services/navigation/router/router_notifier.dart';
import 'package:supercalipso/services/navigation/routes.dart';

part 'router.g.dart';

@riverpod
GlobalKey<NavigatorState> navigatorKey(NavigatorKeyRef ref) {
  return GlobalKey<NavigatorState>(debugLabel: 'routerKey');
}

@riverpod
GoRouter router(RouterRef ref) {
  var key = ref.watch(navigatorKeyProvider);
  final sub = ref.listen(routerNotifierProvider, (_, __) {});
  ref.onDispose(sub.close);

  final notifier = ref.read(routerNotifierProvider.notifier);
  return GoRouter(
    navigatorKey: key,
    debugLogDiagnostics: kDebugMode,
    initialLocation: LoginPageRoute.pagePath,
    refreshListenable: notifier,
    redirect: notifier.redirect,
    routes: [
      LoginPageRoute(),
      DashboardPageRoute(),
      SpeakerPageRoute(),
      EventPageRoute(),
      SpeakerPageRoute(),
      QAPageRoute(),
    ],
  );
}
