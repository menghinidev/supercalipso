import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:supercalipso/application/team/team_provider.dart';
import 'package:supercalipso/application/team/team_service.dart';
import 'package:supercalipso/application/utils.dart';
import 'package:supercalipso/presenter/components/common/empty_data_widget.dart';
import 'package:supercalipso/presenter/pages/dashboard/sections/card_section.dart';
import 'package:supercalipso/presenter/pages/event/components/user_assegnee_avatar.dart';
import 'package:supercalipso/presenter/pages/task/controller/task_page_state.dart';
import 'package:supercalipso/presenter/theme/dimensions.dart';

class TaskAssignmentSection extends HookConsumerWidget {
  final TaskPageState state;
  final Function(String? id) onAssignedUser;

  const TaskAssignmentSection({super.key, required this.state, required this.onAssignedUser});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var users = ref.watch(loggedTeamMembersProvider);
    return CardSection(
      title: 'Assign to',
      children: [
        Padding(
          padding: const EdgeInsets.only(top: Dimensions.mediumSize),
          child: users.onValue(
            builder: (data) => EmptyDataWidgetBuilder(
              emptyCondition: () => data.isEmpty,
              placeholderBuilder: (_) => const Text('No Users'),
              builder: (context) => Wrap(
                spacing: Dimensions.mediumSize,
                runSpacing: Dimensions.smallSize,
                children: data
                    .map((e) => UserAssigneeAvatar(
                          user: e,
                          isSelected: state.on(
                            defaultValue: () => false,
                            onEditing: (state) => e.uid == state.builder.assignedUserId,
                            onReading: (state) => e.uid == state.task.assignedUserId,
                          ),
                          onSelected: onAssignedUser,
                        ))
                    .toList(),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
