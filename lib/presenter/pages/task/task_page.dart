import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:supercalipso/data/model/task/task.dart';
import 'package:supercalipso/presenter/components/scaffold/custom_app_bar.dart';
import 'package:supercalipso/presenter/components/scaffold/custom_scaffold.dart';

class TaskPage extends HookConsumerWidget {
  final Task? task;

  const TaskPage({super.key, this.task});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return CustomScaffold(
      appBar: const FlatAppBar(
        showProfileAvatar: false,
        leading: BackButton(),
      ),
      body: Column(),
    );
  }
}
