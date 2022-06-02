import 'package:go_router/go_router.dart';
import 'package:supercalipso/presenter/pages/home/home_page.dart';
import 'package:supercalipso/presenter/pages/login/login_page.dart';

class AppRoutes {
  static final home = HomePageRoute();
  static final login = LoginPageRoute();

  static final unprotectedRoutes = [login.path];
}

class HomePageRoute extends GoRoute {
  static const String pagePath = '/';

  HomePageRoute()
      : super(
          path: pagePath,
          builder: (context, state) => const HomePage(),
          routes: [
            TeamsPageRoute(),
            ProfilePageRoute(),
          ],
        );
}

class LoginPageRoute extends GoRoute {
  static const String pagePath = '/login';

  LoginPageRoute()
      : super(
          path: pagePath,
          builder: (context, state) => const LoginPage(),
        );
}

class TeamsPageRoute extends GoRoute {
  static const String pageName = 'teams';
  static const String pagePath = '/$pageName';

  TeamsPageRoute()
      : super(
          path: pageName,
          builder: (context, state) => const HomePage(index: 1),
        );
}

class ProfilePageRoute extends GoRoute {
  static const String pageName = 'profile';
  static const String pagePath = '/$pageName';

  ProfilePageRoute()
      : super(
          path: pageName,
          builder: (context, state) => const HomePage(index: 2),
        );
}
