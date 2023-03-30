import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:supercalipso/application/auth/auth_provider.dart';
import 'package:supercalipso/application/task/task_service.dart';
import 'package:supercalipso/application/utils.dart';
import 'package:supercalipso/data/model/task/task.dart';
import 'package:supercalipso/presenter/components/tile/custom_tile.dart';
import 'package:supercalipso/presenter/pages/event/sections/name_section.dart';
import 'package:supercalipso/presenter/theme/colors.dart';
import 'package:supercalipso/services/localization/date_formatter_delegate.dart';
import 'package:supercalipso/services/navigation/router/router.dart';
import 'package:supercalipso/services/navigation/routes.dart';

class TaskTile extends HookConsumerWidget with DateFormatter {
  final Task task;

  const TaskTile({super.key, required this.task});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return CustomTile(
      title: task.title,
      subtitle: task.assignedUserId == null ? null : UserNameTileSubtitle(userId: task.assignedUserId!),
      leading: Icon(
        EventIconDataFactory.getIcon(task.iconName) ?? Icons.task_alt_outlined,
        color: AppColors.black,
      ),
      trailing: task.onStatus(
        () => ActionTileTrailing(
          color: AppColors.green,
          onTap: () => ref.read(teamTaskStateProvider.notifier).completeTask(taskId: task.id),
          child: const Icon(Icons.done, color: AppColors.white),
        ),
        onDone: () => const ActionTileTrailing(
          color: AppColors.blueDarker,
          child: Icon(Icons.done_all_outlined, color: AppColors.white),
        ),
      ),
      onTap: () => ref.read(routerProvider).push(TaskPageRoute.pagePath, extra: task),
    );
  }
}

class UserNameTileSubtitle extends HookConsumerWidget with DateFormatter {
  final String userId;

  const UserNameTileSubtitle({super.key, required this.userId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var user = ref.watch(getUserByIdProvider(userId));
    return user.onValue(
      builder: (data) => Text(
        data.displayName,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        style: Theme.of(context).textTheme.labelLarge?.copyWith(color: AppColors.grey),
      ),
    );
  }
}
