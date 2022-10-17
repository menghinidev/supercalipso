import 'package:flutter/material.dart';
import 'package:supercalipso/bloc/auth/auth_service.dart';
import 'package:supercalipso/bloc/utils.dart';
import 'package:supercalipso/data/model/task/task.dart';
import 'package:supercalipso/data/model/user/user.dart';
import 'package:supercalipso/presenter/components/tile/custom_tile.dart';
import 'package:supercalipso/presenter/pages/event/sections/name_section.dart';
import 'package:supercalipso/presenter/pages/events/components/event_tile.dart';
import 'package:supercalipso/presenter/pages/profile/components/profile_avatar.dart';
import 'package:supercalipso/presenter/theme/colors.dart';
import 'package:supercalipso/presenter/theme/dimensions.dart';
import 'package:supercalipso/services/localization/date_formatter_delegate.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class TaskTile extends HookConsumerWidget with DateFormatter {
  final Task task;

  const TaskTile({super.key, required this.task});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var user = ref.watch(getUserByIdProvider(task.assignedUserId));
    return CustomTile(
      title: task.title,
      subtitle: user.onValue(builder: (data) => TaskTileSubtitle(user: data)),
      leading: Icon(EventIconDataFactory.getIcon(task.iconName)),
      trailing: ActionTileTrailing(
        color: AppColors.green,
        onTap: () => print(task.status.name),
        child: const Icon(Icons.done),
      ),
    );
  }
}

class TaskTileSubtitle extends StatelessWidget with DateFormatter {
  final User user;

  const TaskTileSubtitle({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return Text(
      user.displayName,
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
      style: Theme.of(context).textTheme.labelLarge?.copyWith(color: AppColors.grey),
    );
  }
}
