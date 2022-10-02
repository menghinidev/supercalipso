import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:supercalipso/presenter/theme/theme_builder.dart';
import 'package:supercalipso/services/installer.dart';
import 'package:supercalipso/services/navigation/router_provider.dart';
import 'package:supercalipso/services/navigation/routes.dart';

void main() {
  Installer.instance.launchStartPipeline();
  runApp(const ProviderScope(child: SuperCalipso()));
}

class SuperCalipso extends ConsumerWidget {
  const SuperCalipso({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var router = ref.watch(routerProvider);
    return MaterialApp.router(
      title: 'SuperCalipso',
      theme: ThemeBuilder.buildTheme(context),
      debugShowCheckedModeBanner: false,
      routerDelegate: router.routerDelegate,
      routeInformationParser: router.routeInformationParser,
    );
  }
}
