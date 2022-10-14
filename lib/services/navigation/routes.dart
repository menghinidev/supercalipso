import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:supercalipso/presenter/pages/events/events_page.dart';
import 'package:supercalipso/presenter/pages/home/home_page.dart';
import 'package:supercalipso/presenter/pages/login/login_page.dart';
import 'package:supercalipso/presenter/pages/tasks/tasks_page.dart';
import 'package:supercalipso/presenter/pages/team/team_page.dart';

class AppRoutes {
  static final home = HomePageRoute();
  static final login = LoginPageRoute();

  static final unprotectedRoutes = [login.path];
}

class BasePageTransitionBuilder<T> extends CustomTransitionPage<T> {
  BasePageTransitionBuilder({required super.child, super.key})
      : super(
          transitionsBuilder: (context, primary, secondary, child) => FadeTransition(
            opacity: primary,
            child: child,
          ),
        );
}

class HomePageRoute extends GoRoute {
  static const String pagePath = '/';

  HomePageRoute()
      : super(
          path: pagePath,
          pageBuilder: (context, state) => BasePageTransitionBuilder(child: const HomePage()),
          routes: [
            ProfilePageRoute(),
            EventsPageRoute(),
            TeamPageRoute(),
            TasksPageRoute(),
          ],
        );
}

class LoginPageRoute extends GoRoute {
  static const String pagePath = '/login';

  LoginPageRoute()
      : super(
          path: pagePath,
          pageBuilder: (context, state) => BasePageTransitionBuilder(child: const LoginPage()),
        );
}

class ProfilePageRoute extends GoRoute {
  static const String pageName = 'profile';
  static const String pagePath = '/$pageName';

  ProfilePageRoute()
      : super(
          path: pageName,
          pageBuilder: (context, state) => BasePageTransitionBuilder(child: const HomePage()),
        );
}

class EventsPageRoute extends GoRoute {
  static const String pageName = 'events';
  static const String pagePath = '/$pageName';

  static String createPath(String eventId) => '$pagePath/$eventId';

  EventsPageRoute()
      : super(
          path: pageName,
          pageBuilder: (context, state) => BasePageTransitionBuilder(
            child: const HomePage(),
          ),
        );
}

class TasksPageRoute extends GoRoute {
  static const String pageName = 'tasks';
  static const String pagePath = '/$pageName';

  TasksPageRoute()
      : super(
          path: pageName,
          pageBuilder: (context, state) => BasePageTransitionBuilder(
            child: const HomePage(),
          ),
        );
}

class TeamPageRoute extends GoRoute {
  static const String pageName = 'team';
  static const String pagePath = '/$pageName';

  static String createPath(String eventId) => '$pagePath/$eventId';

  TeamPageRoute()
      : super(
          path: '$pageName/:id',
          pageBuilder: (context, state) => BasePageTransitionBuilder(
            child: TeamPage(teamId: state.params['id'] as String),
          ),
        );
}
