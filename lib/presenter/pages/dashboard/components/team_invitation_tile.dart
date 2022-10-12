import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:supercalipso/bloc/team/team_provider.dart';
import 'package:supercalipso/bloc/team/team_service.dart';
import 'package:supercalipso/bloc/utils.dart';
import 'package:supercalipso/data/model/team/invitation/invitation.dart';
import 'package:supercalipso/presenter/components/button/primary_outlined.dart';
import 'package:supercalipso/presenter/theme/colors.dart';
import 'package:supercalipso/presenter/theme/dimensions.dart';

class TeamInvitationTile extends HookConsumerWidget {
  final TeamInvitation invitation;

  const TeamInvitationTile({Key? key, required this.invitation}) : super(key: key);
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var team = ref.watch(teamProvider(invitation.team.id));
    return team.onValue(
      builder: (data) => Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(text: 'Invitation for: ', style: Theme.of(context).textTheme.titleSmall),
                      TextSpan(text: data.name),
                    ],
                  ),
                ),
                Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(text: 'Invited by: ', style: Theme.of(context).textTheme.titleSmall),
                      TextSpan(text: invitation.invitedBy.name),
                    ],
                  ),
                ),
              ],
            ),
          ),
          if (invitation.status == TeamInvitationStatus.unknown)
            Row(
              children: [
                PrimaryOutlinedButton(
                  onTap: () => reply(ref, TeamInvitationStatus.accepted),
                  backgroudColor: AppColors.confirmColor,
                  text: 'Accept',
                ),
                const SizedBox(width: Dimensions.smallSize),
                PrimaryOutlinedButton(
                  onTap: () => reply(ref, TeamInvitationStatus.declied),
                  text: 'Decline',
                ),
              ],
            ),
        ],
      ),
    );
  }

  reply(WidgetRef ref, TeamInvitationStatus status) => ref.read(teamServiceProvider).replyTeamInvitation(
        status: status,
        teamInvitationId: invitation.invitationId,
      );
}