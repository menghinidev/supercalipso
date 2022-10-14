import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:supercalipso/data/model/task/task.dart';
import 'package:supercalipso/presenter/pages/dashboard/sections/list_section.dart';
import 'package:supercalipso/presenter/pages/tasks/components/task_tile.dart';

class TaskList extends HookConsumerWidget {
  const TaskList({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return BaseListSection<Task>(
      title: 'Tasks',
      items: const <Task>[],
      builder: (data) => TaskTile(task: data),
    );
  }
}
