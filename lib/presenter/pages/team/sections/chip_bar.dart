import 'package:flutter/material.dart';
import 'package:supercalipso/data/model/team/team.dart';
import 'package:supercalipso/presenter/pages/events/components/event_generator_sheet.dart';
import 'package:supercalipso/presenter/pages/notes/components/note_generator_sheet.dart';
import 'package:supercalipso/presenter/theme/dimensions.dart';

class TeamPageChipBar extends StatelessWidget {
  final Team team;

  const TeamPageChipBar({super.key, required this.team});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: Dimensions.pageInsetsWithTop,
      child: ChipTheme(
        data: const ChipThemeData(
          elevation: Dimensions.lowElevation,
          padding: EdgeInsets.all(Dimensions.smallSize),
        ),
        child: Wrap(
          spacing: Dimensions.smallSize,
          children: [
            ActionChip(
              avatar: const Icon(Icons.event_available_outlined, size: 22),
              label: const Text('Create Event'),
              onPressed: () => showBottomSheet(
                context: context,
                builder: (context) => EventGeneratorSheet(teamId: team.id),
              ),
            ),
            ActionChip(
              avatar: const Icon(Icons.note_add_outlined, size: 22),
              label: const Text('Create Note'),
              onPressed: () => showBottomSheet(
                context: context,
                builder: (context) => NoteGeneratorBottomSheet(teamId: team.id),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
