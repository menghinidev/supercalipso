import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:supercalipso/bloc/auth/auth_bloc.dart';
import 'package:supercalipso/bloc/auth/states.dart';
import 'package:supercalipso/plugin/bloc.dart';
import 'package:supercalipso/services/navigation/events.dart';
import 'package:supercalipso/services/navigation/routes.dart';

class NavigationBlocIdle extends BlocState {}

class NavigationBlocOperating extends BlocState {
  final String location;
  final bool needsAuth;

  NavigationBlocOperating({required this.location, required this.needsAuth});
}

class NavigationBloc extends Bloc<BlocEvent, BlocState> {
  final GoRouter router;
  final AuthenticationBloc authenticationBloc;

  NavigationBloc({required this.authenticationBloc, required this.router}) : super(NavigationBlocIdle()) {
    on<HomePageRequested>((event, emit) => __handleGoToEvent(HomePageRoute.pagePath, emit));
    on<LoginPageRequested>((event, emit) => __handleGoToEvent(LoginPageRoute.pagePath, emit));
    on<ProfilePageRequested>((event, emit) => __handleGoToEvent(ProfilePageRoute.pagePath, emit));
    on<TeamsPageRequested>((event, emit) => __handleGoToEvent(TeamsPageRoute.pagePath, emit));
    on<RouterUpdated>((event, emit) => __handleRouterUpdated(emit));
    router.addListener(() => add(RouterUpdated()));
    authenticationBloc.stream.listen((event) {
      if (event is Authenticated) add(HomePageRequested());
    });
  }

  Future __handleGoToEvent(String url, Emitter<BlocState> emitter, {Object? extra}) {
    router.go(url, extra: extra);
    return Future.value();
  }

  Future __handlePushEvent(String url, Emitter<BlocState> emitter, {Object? extra}) {
    router.push(url, extra: extra);
    return Future.value();
  }

  Future __handleRouterUpdated(Emitter<BlocState> emitter) {
    emitter.call(NavigationBlocOperating(
      location: router.location,
      needsAuth: !AppRoutes.unprotectedRoutes.contains(router.location),
    ));
    return Future.value();
  }
}
