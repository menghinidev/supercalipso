import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:supercalipso/presenter/pages/events/events_page.dart';
import 'package:supercalipso/presenter/pages/home/home_page.dart';
import 'package:supercalipso/presenter/pages/login/login_page.dart';
import 'package:supercalipso/presenter/pages/profile/profile_page.dart';
import 'package:supercalipso/presenter/pages/tasks/tasks_page.dart';
import 'package:supercalipso/presenter/pages/team/team_page.dart';

class AppRoutes {
  static final home = HomePageRoute();
  static final login = LoginPageRoute();
  static final profile = ProfilePageRoute();
  static final events = EventsPageRoute();
  static final team = TeamPageRoute();
  static final tasks = TasksPageRoute();
  static final notes = NotesPageRoute();
  static final expenses = ExpensesPageRoute();

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
          path: pagePath,
          pageBuilder: (context, state) => BasePageTransitionBuilder(child: const ProfilePage()),
        );
}

class EventsPageRoute extends GoRoute {
  static const String pageName = 'events';
  static const String pagePath = '/$pageName';

  EventsPageRoute()
      : super(
          path: pagePath,
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
          path: pagePath,
          pageBuilder: (context, state) => BasePageTransitionBuilder(
            child: const HomePage(),
          ),
        );
}

class NotesPageRoute extends GoRoute {
  static const String pageName = 'notes';
  static const String pagePath = '/$pageName';

  NotesPageRoute()
      : super(
          path: pagePath,
          pageBuilder: (context, state) => BasePageTransitionBuilder(
            child: const HomePage(),
          ),
        );
}

class ExpensesPageRoute extends GoRoute {
  static const String pageName = 'expenses';
  static const String pagePath = '/$pageName';

  ExpensesPageRoute()
      : super(
          path: pagePath,
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
          path: '$pagePath/:id',
          pageBuilder: (context, state) => BasePageTransitionBuilder(
            child: TeamPage(teamId: state.params['id'] as String),
          ),
        );
}
