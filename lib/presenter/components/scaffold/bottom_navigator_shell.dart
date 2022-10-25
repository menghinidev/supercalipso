import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:supercalipso/services/navigation/routes.dart';

final homeNavigationStateProvider = StateProvider<String>((ref) {
  return DashboardPageRoute.pagePath;
});

final homeLocationIndexProvider = Provider<int>((ref) {
  var location = ref.watch(homeNavigationStateProvider);
  if (location == ExpensesPageRoute.pagePath) return 0;
  if (location == EventsPageRoute.pagePath) return 1;
  if (location == DashboardPageRoute.pagePath) return 2;
  if (location == TasksPageRoute.pagePath) return 3;
  if (location == NotesPageRoute.pagePath) return 4;
  return 0;
});

class BottomNavigatorShell extends HookConsumerWidget {
  final Widget child;
  const BottomNavigatorShell({required this.child, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      children: [
        Expanded(child: child),
        BottomNavigationBar(
          currentIndex: ref.watch(homeLocationIndexProvider),
          onTap: (index) => onBottomBarItemTap(index, ref),
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

  setState(WidgetRef ref, String state) => ref.read(homeNavigationStateProvider.notifier).state = state;

  onBottomBarItemTap(int index, WidgetRef ref) => setState(ref, HomeShellRoute.getHomeBottomLocation(index));
}
