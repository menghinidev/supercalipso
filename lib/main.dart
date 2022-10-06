import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:supercalipso/bloc/auth/auth_provider.dart';
import 'package:supercalipso/presenter/theme/theme_builder.dart';
import 'package:supercalipso/services/installer.dart';
import 'package:supercalipso/services/navigation/router_provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Installer.instance.launchStartPipeline();
  runApp(const ProviderScope(child: SuperCalipso()));
}

class SuperCalipso extends StatefulHookConsumerWidget {
  const SuperCalipso({Key? key}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SuperCalipsoState();
}

class _SuperCalipsoState extends ConsumerState<SuperCalipso> {
  @override
  void initState() {
    super.initState();
    ref.read(authProvider).silentLogin();
  }

  @override
  Widget build(BuildContext context) {
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
