import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:supercalipso/presenter/pages/dashboard/dashboard_page.dart';
import 'package:supercalipso/presenter/pages/profile/profile_page.dart';
import 'package:supercalipso/services/navigation/router_provider.dart';
import 'package:supercalipso/services/navigation/routes.dart';

class HomePage extends HookConsumerWidget {
  const HomePage({Key? key}) : super(key: key);
  final pages = const [Dashboard(), ProfilePage()];

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var router = ref.watch(routerProvider);
    var pageController = usePageController(initialPage: getIndex(router));
    return Column(
      children: [
        Expanded(
          child: PageView(
            controller: pageController,
            physics: const NeverScrollableScrollPhysics(),
            children: pages,
          ),
        ),
        BottomNavigationBar(
          currentIndex: getIndex(router),
          onTap: (index) => _navigateToIndex(index, router),
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'HOME'),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: 'PROFILE'),
          ],
        ),
      ],
    );
  }

  int getIndex(GoRouter router) {
    if (router.location == HomePageRoute.pagePath) return 0;
    return 1;
  }

  void _navigateToIndex(int index, GoRouter router) {
    late String path;
    if (index == 0) path = HomePageRoute.pagePath;
    if (index == 1) path = ProfilePageRoute.pagePath;
    router.go(path);
  }
}
