import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:supercalipso/firebase_options.dart';
import 'package:supercalipso/presenter/theme/theme_builder.dart';
import 'package:supercalipso/services/localization/date_formatter_delegate.dart';
import 'package:supercalipso/services/navigation/router_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
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
      locale: const Locale('it', ''),
      supportedLocales: const [Locale('it', '')],
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        DateFormatterLocalizationDelegate(),
      ],
      debugShowCheckedModeBanner: false,
      routerDelegate: router.routerDelegate,
      routeInformationParser: router.routeInformationParser,
    );
  }
}
