import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:supercalipso/services/navigation/routes.dart';

final navKeyProvider = Provider<GlobalKey<NavigatorState>>((ref) {
  return GlobalKey<NavigatorState>();
});

final routerProvider = Provider<GoRouter>((ref) {
  return GoRouter(
    routes: AppRoutes.routes,
    debugLogDiagnostics: kDebugMode,
    navigatorKey: ref.watch(navKeyProvider),
  );
});
