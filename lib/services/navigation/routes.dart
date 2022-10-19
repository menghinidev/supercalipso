import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:supercalipso/data/model/event/team_event.dart';
import 'package:supercalipso/data/model/note/note.dart';
import 'package:supercalipso/data/model/task/task.dart';
import 'package:supercalipso/presenter/pages/event/event_page.dart';
import 'package:supercalipso/presenter/pages/home/home_page.dart';
import 'package:supercalipso/presenter/pages/login/login_page.dart';
import 'package:supercalipso/presenter/pages/note/note_page.dart';
import 'package:supercalipso/presenter/pages/profile/profile_page.dart';
import 'package:supercalipso/presenter/pages/task/task_page.dart';
import 'package:supercalipso/presenter/pages/team/team_page.dart';
import 'package:supercalipso/services/modals/dialog/dialog_manager.dart';
import 'package:supercalipso/services/modals/dialog/dialog_service.dart';

class AppRoutes {
  static final home = HomePageRoute();
  static final login = LoginPageRoute();
  static final profile = ProfilePageRoute();
  static final events = EventsPageRoute();
  static final team = TeamPageRoute();
  static final tasks = TasksPageRoute();
  static final task = TaskPageRoute();
  static final notes = NotesPageRoute();
  static final note = NotePageRoute();
  static final expenses = ExpensesPageRoute();
  static final event = EventPageRoute();

  static final unprotectedRoutes = [login.path];
}

class BasePageTransitionBuilder<T> extends CustomTransitionPage<T> {
  BasePageTransitionBuilder({required super.child, super.key})
      : super(
          transitionsBuilder: (context, primary, secondary, child) => FadeTransition(
            opacity: primary,
            child: Consumer(
              builder: (context, ref, _) => DialogManager(
                service: ref.watch(dialogServiceProvider),
                child: child,
              ),
            ),
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

class EventPageRoute extends GoRoute {
  static const String pageName = 'event';
  static const String pagePath = '/$pageName';

  EventPageRoute()
      : super(
          path: pagePath,
          pageBuilder: (context, state) => BasePageTransitionBuilder(
            child: EventPage(event: state.extra as TeamEvent?),
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

class TaskPageRoute extends GoRoute {
  static const String pageName = 'task';
  static const String pagePath = '/$pageName';

  TaskPageRoute()
      : super(
          path: pagePath,
          pageBuilder: (context, state) => BasePageTransitionBuilder(
            child: TaskPage(task: state.extra as Task?),
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

class NotePageRoute extends GoRoute {
  static const String pageName = 'note';
  static const String pagePath = '/$pageName';

  NotePageRoute()
      : super(
          path: pagePath,
          pageBuilder: (context, state) => BasePageTransitionBuilder(
            child: NotePage(note: state.extra as Note?),
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
