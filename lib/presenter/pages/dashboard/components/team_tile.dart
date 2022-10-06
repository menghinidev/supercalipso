import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:supercalipso/bloc/event/event_service.dart';
import 'package:supercalipso/data/model/team/team.dart';
import 'package:supercalipso/presenter/components/icon/custom_icon.dart';
import 'package:supercalipso/presenter/components/tile/custom_tile.dart';
import 'package:supercalipso/presenter/pages/dashboard/components/team_invitation_generator_sheet.dart';
import 'package:supercalipso/presenter/theme/dimensions.dart';

class FrequentTeamAvatar extends StatelessWidget {
  final Team team;

  const FrequentTeamAvatar({required this.team, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(maxWidth: 200),
      child: CustomTile(
        leading: CircleAvatar(child: Text(team.name[0])),
        title: team.name,
        subtitle: team.subscriptions.fold(
          '',
          (p, e) => p!.isEmpty ? e.subscribedUser.name : '$p, ${e.subscribedUser.name}',
        ),
        trailing: PopupMenuButton<String>(
          //offset: const Offset(-12, 32),
          position: PopupMenuPosition.under,
          shape: Shapes.lowRounded,
          itemBuilder: (context) => [
            PopupMenuItem(
              value: 'Invite',
              onTap: () => showBottomSheet(
                context: context,
                builder: (_) => TeamInvitationGeneratorSheet(teamId: team.id),
              ),
              child: const CustomTile(
                title: 'Invite',
                leading: CustomIcon(icon: Icons.add),
              ),
            ),
            PopupMenuItem(
              value: 'Create Event',
              child: Consumer(
                builder: (context, ref, _) => CustomTile(
                  title: 'Create Event',
                  leading: const CustomIcon(icon: Icons.remove_circle_outline),
                  onTap: () => ref
                      .read(eventServiceProvider)
                      .createEvent(teamId: team.id, name: 'Nome', startTime: DateTime.now()),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
