import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:supercalipso/presenter/pages/dashboard/dashboard_page.dart';
import 'package:supercalipso/presenter/pages/events/events_page.dart';
import 'package:supercalipso/presenter/pages/expenses/expenses_page.dart';
import 'package:supercalipso/presenter/pages/notes/notes_page.dart';
import 'package:supercalipso/presenter/pages/tasks/tasks_page.dart';
import 'package:supercalipso/services/navigation/router_provider.dart';
import 'package:supercalipso/services/navigation/routes.dart';

class HomePage extends HookConsumerWidget {
  const HomePage({Key? key}) : super(key: key);
  final pages = const [ExpensesPage(), EventsPage(), Dashboard(), TasksPage(), NotesPage()];

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var router = ref.watch(routerProvider);
    return Column(
      children: [
        Expanded(child: pages[getIndex(router)]),
        BottomNavigationBar(
          currentIndex: getIndex(router),
          onTap: (index) => _navigateToIndex(index, router),
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.attach_money), label: ''),
            BottomNavigationBarItem(icon: Icon(Icons.calendar_month_outlined), label: ''),
            BottomNavigationBarItem(icon: Icon(Icons.home), label: ''),
            BottomNavigationBarItem(icon: Icon(Icons.done), label: ''),
            BottomNavigationBarItem(icon: Icon(Icons.notes_rounded), label: ''),
          ],
        ),
      ],
    );
  }

  int getIndex(GoRouter router) {
    switch (router.location) {
      case ExpensesPageRoute.pagePath:
        return 0;
      case EventsPageRoute.pagePath:
        return 1;
      case HomePageRoute.pagePath:
        return 2;
      case TasksPageRoute.pagePath:
        return 3;
      case NotesPageRoute.pagePath:
        return 4;
      default:
        return 0;
    }
  }

  void _navigateToIndex(int index, GoRouter router) {
    late String path;
    if (index == 0) path = ExpensesPageRoute.pagePath;
    if (index == 1) path = EventsPageRoute.pagePath;
    if (index == 2) path = HomePageRoute.pagePath;
    if (index == 3) path = TasksPageRoute.pagePath;
    if (index == 4) path = NotesPageRoute.pagePath;
    router.go(path);
  }
}
