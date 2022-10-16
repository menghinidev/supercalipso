import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:supercalipso/bloc/team/team_provider.dart';
import 'package:supercalipso/presenter/components/icon/custom_icon.dart';
import 'package:supercalipso/presenter/pages/profile/components/team_invitation_sheet.dart';

class TeamInvitationIcon extends HookConsumerWidget {
  const TeamInvitationIcon({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var invitations = ref.watch(pendingTeamInvitationsChangesProvider);
    return IconButton(
      onPressed: () => Scaffold.of(context).showBottomSheet((context) => const TeamInvitationBottomSheet()),
      icon: CustomIcon(
        icon: Icons.notifications,
        badge: invitations.when(
          data: (data) => data.isEmpty ? null : data.length,
          error: (_, __) => null,
          loading: () => null,
        ),
      ),
    );
  }
}
