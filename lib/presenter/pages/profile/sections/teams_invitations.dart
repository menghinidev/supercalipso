import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:supercalipso/application/team/team_provider.dart';
import 'package:supercalipso/application/utils.dart';
import 'package:supercalipso/data/model/team/invitation/invitation.dart';
import 'package:supercalipso/presenter/pages/home/dashboard/sections/list_section.dart';
import 'package:supercalipso/presenter/pages/profile/components/team_invitation_tile.dart';

class TeamsInvitationSection extends HookConsumerWidget {
  const TeamsInvitationSection({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var invitations = ref.watch(teamInvitationsChangesProvider);
    return invitations.onValue(
      builder: (data) => BaseListSection<TeamInvitation>(
        title: 'Team invitations',
        items: data,
        builder: (invitation) => TeamInvitationTile(invitation: invitation),
      ),
    );
  }
}
