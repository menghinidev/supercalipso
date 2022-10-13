import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:supercalipso/data/model/team/team.dart';
import 'package:supercalipso/presenter/components/icon/custom_icon.dart';
import 'package:supercalipso/presenter/components/tile/custom_tile.dart';
import 'package:supercalipso/presenter/pages/dashboard/components/event_generator_sheet.dart';
import 'package:supercalipso/presenter/pages/dashboard/components/note_generator_sheet.dart';
import 'package:supercalipso/presenter/pages/dashboard/components/team_invitation_generator_sheet.dart';
import 'package:supercalipso/presenter/theme/dimensions.dart';
import 'package:supercalipso/services/navigation/router_provider.dart';
import 'package:supercalipso/services/navigation/routes.dart';

class TeamTile extends HookConsumerWidget {
  final Team team;

  const TeamTile({required this.team, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ConstrainedBox(
      constraints: const BoxConstraints(maxWidth: 200),
      child: CustomTile(
        leading: CircleAvatar(child: Text(team.name[0])),
        title: team.name,
        onTap: () => ref.read(routerProvider).go(TeamPageRoute.createPath(team.id)),
        subtitle: team.subscriptions.fold(
          '',
          (p, e) => p!.isEmpty ? e.subscribedUser.displayName : '$p, ${e.subscribedUser.displayName}',
        ),
        trailing: PopupMenuButton<String>(
          position: PopupMenuPosition.under,
          shape: Shapes.lowRoundedBorder,
          itemBuilder: (context) => [
            PopupMenuItem(
              value: 'Invite',
              onTap: () => showBottomSheet(
                context: context,
                builder: (_) => TeamInvitationGeneratorSheet(teamId: team.id),
              ),
              child: const CustomTile(
                title: 'Invite',
                leading: CustomIcon(icon: Icons.person_add_outlined),
              ),
            ),
            PopupMenuItem(
              value: 'Create Event',
              onTap: () => showBottomSheet(
                context: context,
                builder: (_) => EventGeneratorSheet(teamId: team.id),
              ),
              child: const CustomTile(
                title: 'Create Event',
                leading: CustomIcon(icon: Icons.event_available_outlined),
              ),
            ),
            PopupMenuItem(
              value: 'Create Note',
              onTap: () => showBottomSheet(
                context: context,
                builder: (_) => NoteGeneratorBottomSheet(teamId: team.id),
              ),
              child: const CustomTile(
                title: 'Create Note',
                leading: CustomIcon(icon: Icons.note_add_outlined),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
