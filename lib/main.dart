import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:supercalipso/bloc/auth/auth_bloc.dart';
import 'package:supercalipso/bloc/auth/states.dart';
import 'package:supercalipso/bloc/team/teams_bloc.dart';
import 'package:supercalipso/presenter/theme/theme_builder.dart';
import 'package:supercalipso/services/intaller.dart';
import 'package:supercalipso/services/navigation/navigation_bloc.dart';
import 'package:supercalipso/services/navigation/routes.dart';

void main() {
  Installer.instance.launchStartPipeline();
  runApp(const SuperCalipso());
}

class SuperCalipso extends StatefulWidget {
  const SuperCalipso({Key? key}) : super(key: key);

  @override
  State<SuperCalipso> createState() => _SuperCalipsoState();
}

class _SuperCalipsoState extends State<SuperCalipso> {
  late GoRouter router;
  late AuthenticationBloc authBloc;
  late TeamsBloc teamsBloc;
  late NavigationBloc navigationBloc;

  @override
  void initState() {
    super.initState();
    authBloc = AuthenticationBloc();
    teamsBloc = TeamsBloc(authenticationBloc: authBloc);
    router = GoRouter(
      routes: [
        AppRoutes.home,
        AppRoutes.login,
      ],
      redirect: (state) {
        if (!AppRoutes.unprotectedRoutes.contains(state.location) && authBloc.state is Unauthenticated) {
          return LoginPageRoute.pagePath;
        }
        return null;
      },
    );
    navigationBloc = NavigationBloc(router: router, authenticationBloc: authBloc);
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider.value(value: navigationBloc),
        BlocProvider.value(value: authBloc),
        BlocProvider.value(value: teamsBloc),
      ],
      child: MaterialApp.router(
        title: 'SuperCalipso',
        theme: ThemeBuilder.buildTheme(context),
        debugShowCheckedModeBanner: false,
        routerDelegate: router.routerDelegate,
        routeInformationParser: router.routeInformationParser,
      ),
    );
  }
}
