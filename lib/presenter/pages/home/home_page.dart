import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:supercalipso/presenter/components/scaffold/custom_app_bar.dart';
import 'package:supercalipso/presenter/components/scaffold/custom_scaffold.dart';
import 'package:supercalipso/presenter/pages/profile/profile_page.dart';
import 'package:supercalipso/presenter/pages/teams/teams_page.dart';
import 'package:supercalipso/services/navigation/router_provider.dart';
import 'package:supercalipso/services/navigation/routes.dart';

class HomePage extends ConsumerWidget {
  final int index;

  const HomePage({this.index = 0, Key? key}) : super(key: key);
  final pages = const [Dashboard(), TeamsPage(), ProfilePage()];

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var pageController = usePageController(initialPage: index);
    var router = ref.watch(routerProvider);
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
          currentIndex: index,
          onTap: (index) => _navigateToIndex(index, router),
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'HOME'),
            BottomNavigationBarItem(icon: Icon(Icons.people_alt_outlined), label: 'TEAMS'),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: 'PROFILE'),
          ],
        ),
      ],
    );
  }

  void _navigateToIndex(int index, GoRouter router) {
    late String path;
    if (index == index) return;
    if (index == 0) path = HomePageRoute.pagePath;
    if (index == 1) path = TeamsPageRoute.pagePath;
    if (index == 2) path = ProfilePageRoute.pagePath;
    router.go(path);
  }
}

class Dashboard extends StatelessWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      appBar: const CustomAppBar(title: 'DASHBOARD'),
      body: Container(),
    );
  }
}
