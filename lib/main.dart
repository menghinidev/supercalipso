import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';
import 'package:supercalipso/bloc/auth/auth_provider.dart';
import 'package:supercalipso/presenter/theme/theme_builder.dart';
import 'package:supercalipso/services/installer.dart';
import 'package:supercalipso/services/navigation/router_provider.dart';

import 'services/localization/date_formatting_localization_delegate.dart';

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
      locale: const Locale('it', ''),
      supportedLocales: const [Locale('it', '')],
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        DateFormatterLocalizationDelegate.instance,
      ],
      debugShowCheckedModeBanner: false,
      routerDelegate: router.routerDelegate,
      routeInformationParser: router.routeInformationParser,
    );
  }
}
