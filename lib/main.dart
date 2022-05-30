import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:supercalipso/presenter/pages/home/home_page.dart';
import 'package:supercalipso/presenter/pages/login/login_page.dart';
import 'package:supercalipso/presenter/theme/theme_builder.dart';
import 'package:supercalipso/services/navigation/navigation_bloc.dart';

void main() {
  runApp(const SuperCalipso());
}

class SuperCalipso extends StatefulWidget {
  const SuperCalipso({Key? key}) : super(key: key);

  @override
  State<SuperCalipso> createState() => _SuperCalipsoState();
}

class _SuperCalipsoState extends State<SuperCalipso> {
  late GoRouter router;

  @override
  void initState() {
    super.initState();
    router = GoRouter(routes: [
      GoRoute(
        path: '/',
        builder: (BuildContext context, GoRouterState state) => const LoginPage(),
      ),
      GoRoute(
        path: '/home',
        builder: (BuildContext context, GoRouterState state) => const HomePage(),
      ),
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => NavigationBloc()),
      ],
      child: MaterialApp.router(
        title: 'SuperCalipso',
        theme: ThemeBuilder.buildTheme(context),
        routerDelegate: router.routerDelegate,
        routeInformationParser: router.routeInformationParser,
      ),
    );
  }
}
