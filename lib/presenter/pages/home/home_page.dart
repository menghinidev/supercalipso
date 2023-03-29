import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:supercalipso/presenter/components/scaffold/bottom_navigator_shell.dart';
import 'package:supercalipso/presenter/components/scaffold/custom_app_bar.dart';
import 'package:supercalipso/presenter/components/scaffold/custom_scaffold.dart';
import 'package:supercalipso/presenter/pages/home/dashboard/dashboard_page.dart';
import 'package:supercalipso/presenter/pages/home/events/events_page.dart';
import 'package:supercalipso/presenter/pages/home/expenses/expenses_page.dart';
import 'package:supercalipso/presenter/pages/home/notes/notes_page.dart';
import 'package:supercalipso/presenter/pages/home/tasks/tasks_page.dart';
import 'package:supercalipso/presenter/theme/colors.dart';

final homeLocationIndexProvider = StateProvider<int>((ref) {
  return 2;
});

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var index = ref.watch(homeLocationIndexProvider);
    return Column(
      children: [
        Expanded(
          child: [
            const ExpensesPage(),
            const EventsPage(),
            const Dashboard(),
            const TasksPage(),
            const NotesPage(),
          ][index],
        ),
        BottomNavigatorBar(
          index: index,
          onTap: (index) => ref.read(homeLocationIndexProvider.notifier).state = index,
        ),
      ],
    );
  }
}
