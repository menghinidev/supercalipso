import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:supercalipso/application/team/team_provider.dart';
import 'package:supercalipso/application/team/team_service.dart';
import 'package:supercalipso/application/utils.dart';
import 'package:supercalipso/data/model/team/invitation/invitation.dart';
import 'package:supercalipso/presenter/components/tile/custom_tile.dart';
import 'package:supercalipso/presenter/pages/tasks/components/task_tile.dart';
import 'package:supercalipso/presenter/theme/colors.dart';

class TeamInvitationTile extends HookConsumerWidget {
  final TeamInvitation invitation;

  const TeamInvitationTile({Key? key, required this.invitation}) : super(key: key);
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var team = ref.watch(teamProvider(invitation.teamId));
    return team.onValue(
      builder: (data) => CustomTile(
        title: data.name,
        subtitle: UserNameTileSubtitle(userId: invitation.invitedByUserId),
        leading: const Icon(Icons.person_add_alt, color: AppColors.black),
        trailing: invitation.onStatus(
          () => ActionTileTrailing(
            color: AppColors.green,
            onTap: () => reply(ref, TeamInvitationStatus.accepted),
            child: const Icon(Icons.add, color: AppColors.white),
          ),
          onAccepted: () => const ActionTileTrailing(
            color: AppColors.blueDarker,
            child: Icon(Icons.done_all_outlined),
          ),
        ),
      ),
    );
  }

  reply(WidgetRef ref, TeamInvitationStatus status) => ref.read(teamSessionStateProvider.notifier).replyTeamInvitation(
        status: status,
        teamInvitationId: invitation.id,
      );
}
