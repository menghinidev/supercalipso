import 'package:flutter/material.dart';
import 'package:supercalipso/data/model/task/task.dart';
import 'package:supercalipso/presenter/components/tile/custom_tile.dart';
import 'package:supercalipso/presenter/pages/profile/components/profile_avatar.dart';
import 'package:supercalipso/presenter/theme/dimensions.dart';

class TaskTile extends StatelessWidget {
  final Task task;

  const TaskTile({super.key, required this.task});

  @override
  Widget build(BuildContext context) {
    return CustomTile(
      title: task.title,
      subtitle: RichText(
        text: TextSpan(
          style: Theme.of(context).textTheme.labelLarge,
          children: [
            const TextSpan(text: 'Sottotitolo'),
            TextSpan(
              text: ' stile',
              style: Theme.of(context).textTheme.labelLarge?.copyWith(fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
      leading: const Icon(Icons.add_a_photo_outlined),
      trailing: Padding(
        padding: Dimensions.allSPadding,
        child: const ProfileAvatar(),
      ),
    );
  }
}
