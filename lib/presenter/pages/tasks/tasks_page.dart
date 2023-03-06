import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:supercalipso/application/team/team_provider.dart';
import 'package:supercalipso/presenter/components/scaffold/custom_app_bar.dart';
import 'package:supercalipso/presenter/components/scaffold/custom_scaffold.dart';
import 'package:supercalipso/presenter/pages/tasks/section/task_list.dart';
import 'package:supercalipso/presenter/theme/colors.dart';
import 'package:supercalipso/presenter/theme/dimensions.dart';
import 'package:supercalipso/services/navigation/router_provider.dart';
import 'package:supercalipso/services/navigation/routes.dart';

class TasksPage extends HookConsumerWidget {
  const TasksPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.watch(teamsChangesProvider);
    return CustomScaffold(
      appBar: const FlatAppBar(title: 'Tasks'),
      fab: FloatingActionButton(
        backgroundColor: AppColors.greyDarker,
        onPressed: () => ref.read(routerProvider).push(TaskPageRoute.pagePath),
        child: const Icon(Icons.add),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: Dimensions.pageInsetsWithTop,
              child: const TaskList(),
            )
          ],
        ),
      ),
    );
  }
}
