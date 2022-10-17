import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:supercalipso/data/model/task/task.dart';
import 'package:supercalipso/presenter/components/scaffold/custom_app_bar.dart';
import 'package:supercalipso/presenter/components/scaffold/custom_scaffold.dart';
import 'package:supercalipso/presenter/pages/event/controller/event_page_controller.dart';
import 'package:supercalipso/presenter/pages/task/controller/task_page_controller.dart';
import 'package:supercalipso/presenter/pages/task/section/name_section.dart';
import 'package:supercalipso/presenter/theme/dimensions.dart';

class TaskPage extends HookConsumerWidget {
  final Task? task;

  const TaskPage({super.key, this.task});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var state = ref.watch(taskPageControllerProvider(task));
    return CustomScaffold(
      appBar: const FlatAppBar(
        showProfileAvatar: false,
        leading: BackButton(),
      ),
      body: Column(
        children: [
          Padding(
            padding: Dimensions.pageInsetsWithTop,
            child: TaskNameSection(
              state: state,
              onNameChanged: (name) => getNotifier(ref).editTaskTitle(name),
              onIconNameChanged: (icon) => getNotifier(ref).editIcon(icon),
            ),
          )
        ],
      ),
    );
  }

  TaskPageControllerNotifier getNotifier(WidgetRef ref) => ref.read(taskPageControllerProvider(task).notifier);
}
