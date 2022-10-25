import 'package:go_router/go_router.dart';
import 'package:supercalipso/data/model/event/team_event.dart';
import 'package:supercalipso/data/model/note/note.dart';
import 'package:supercalipso/data/model/task/task.dart';
import 'package:supercalipso/presenter/components/scaffold/bottom_navigator_shell.dart';
import 'package:supercalipso/presenter/pages/dashboard/dashboard_page.dart';
import 'package:supercalipso/presenter/pages/event/event_page.dart';
import 'package:supercalipso/presenter/pages/events/events_page.dart';
import 'package:supercalipso/presenter/pages/expenses/expenses_page.dart';
import 'package:supercalipso/presenter/pages/login/login_page.dart';
import 'package:supercalipso/presenter/pages/note/note_page.dart';
import 'package:supercalipso/presenter/pages/notes/notes_page.dart';
import 'package:supercalipso/presenter/pages/profile/profile_page.dart';
import 'package:supercalipso/presenter/pages/splash/splash_page.dart';
import 'package:supercalipso/presenter/pages/task/task_page.dart';
import 'package:supercalipso/presenter/pages/tasks/tasks_page.dart';
import 'package:supercalipso/presenter/pages/team/team_page.dart';
import 'package:supercalipso/services/navigation/router_provider.dart';
import 'package:supercalipso/services/navigation/transitions.dart';

class AppRoutes {
  static final splash = SplashPageRoute();
  static final home = HomeShellRoute();
  static final login = LoginPageRoute();
  static final team = TeamPageRoute();
  static final profile = ProfilePageRoute();

  static final unprotectedRoutes = [login.path, splash.path];

  static get routes => [
        splash,
        home,
        profile,
        login,
        team,
      ];
}

class HomeShellRoute extends ShellRoute {
  HomeShellRoute()
      : super(
          navigatorKey: RouterNotifier.homePageNavigatorKey,
          builder: (context, state, child) => BottomNavigatorShell(child: child),
          routes: [
            ExpensesPageRoute(),
            EventsPageRoute(),
            DashboardPageRoute(),
            TasksPageRoute(),
            NotesPageRoute(),
          ],
        );

  static int getHomeBottomBarIndex(String location) {
    if (location == ExpensesPageRoute.pagePath) return 0;
    if (location == EventsPageRoute.pagePath) return 1;
    if (location == DashboardPageRoute.pagePath) return 2;
    if (location == TasksPageRoute.pagePath) return 3;
    if (location == NotesPageRoute.pagePath) return 4;
    return 0;
  }

  static String getHomeBottomLocation(int index) {
    if (index == 0) return ExpensesPageRoute.pagePath;
    if (index == 1) return EventsPageRoute.pagePath;
    if (index == 2) return DashboardPageRoute.pagePath;
    if (index == 3) return TasksPageRoute.pagePath;
    if (index == 4) return NotesPageRoute.pagePath;
    return DashboardPageRoute.pageName;
  }
}

class ExpensesPageRoute extends GoRoute {
  static const String pageName = 'expenses';
  static const String pagePath = '/$pageName';

  ExpensesPageRoute()
      : super(
          path: pagePath,
          pageBuilder: (context, state) => const NoTransitionPage(child: ExpensesPage()),
        );
}

class EventsPageRoute extends GoRoute {
  static const String pageName = 'events';
  static const String pagePath = '/$pageName';

  EventsPageRoute()
      : super(
          path: pagePath,
          pageBuilder: (context, state) => const NoTransitionPage(child: EventsPage()),
          routes: [EventPageRoute()],
        );
}

class DashboardPageRoute extends GoRoute {
  static const String pageName = 'dashboard';
  static const String pagePath = '/$pageName';

  DashboardPageRoute()
      : super(
          path: pagePath,
          pageBuilder: (context, state) => const NoTransitionPage(child: Dashboard()),
        );
}

class TasksPageRoute extends GoRoute {
  static const String pageName = 'tasks';
  static const String pagePath = '/$pageName';

  TasksPageRoute()
      : super(
          path: pagePath,
          pageBuilder: (context, state) => const NoTransitionPage(child: TasksPage()),
          routes: [TaskPageRoute()],
        );
}

class NotesPageRoute extends GoRoute {
  static const String pageName = 'notes';
  static const String pagePath = '/$pageName';

  NotesPageRoute()
      : super(
          path: pagePath,
          pageBuilder: (context, state) => const NoTransitionPage(child: NotesPage()),
          routes: [NotePageRoute()],
        );
}

class EventPageRoute extends GoRoute {
  static const String pageName = 'event';
  static const String pagePath = '/$pageName';

  EventPageRoute()
      : super(
          path: pageName,
          parentNavigatorKey: RouterNotifier.mainNavigatorKey,
          pageBuilder: (context, state) => BasePageTransitionBuilder(
            child: EventPage(event: state.extra as TeamEvent?),
          ),
        );
}

class TaskPageRoute extends GoRoute {
  static const String pageName = 'task';
  static const String pagePath = '/$pageName';

  TaskPageRoute()
      : super(
          path: pageName,
          parentNavigatorKey: RouterNotifier.mainNavigatorKey,
          pageBuilder: (context, state) => BasePageTransitionBuilder(
            child: TaskPage(task: state.extra as Task?),
          ),
        );
}

class NotePageRoute extends GoRoute {
  static const String pageName = 'note';
  static const String pagePath = '/$pageName';

  NotePageRoute()
      : super(
          path: pageName,
          parentNavigatorKey: RouterNotifier.mainNavigatorKey,
          pageBuilder: (context, state) => BasePageTransitionBuilder(
            child: NotePage(note: state.extra as Note?),
          ),
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

class LoginPageRoute extends GoRoute {
  static const String pagePath = '/login';

  LoginPageRoute()
      : super(
          path: pagePath,
          pageBuilder: (context, state) => BasePageTransitionBuilder(child: const LoginPage()),
        );
}

class SplashPageRoute extends GoRoute {
  static const String pagePath = '/';

  SplashPageRoute()
      : super(
          path: pagePath,
          pageBuilder: (context, state) => BasePageTransitionBuilder(child: const SplashPage()),
        );
}
