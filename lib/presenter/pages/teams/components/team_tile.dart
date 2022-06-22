import 'package:flutter/material.dart';
import 'package:supercalipso/data/model/team/team.dart';
import 'package:supercalipso/presenter/components/avatar/custom_avatar.dart';
import 'package:supercalipso/presenter/components/button/primary_icon.dart';
import 'package:supercalipso/presenter/components/tile/custom_tile.dart';

class TeamTile extends StatelessWidget {
  final Team team;

  const TeamTile({required this.team, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomTile(
      title: team.name,
      leading: CustomAvatar(
        name: team.name,
        radius: 32,
        textStyle: Theme.of(context).textTheme.subtitle1!.copyWith(color: Colors.white),
      ),
      subtitle: team.enrolledUsers.fold<String>(
        '',
        (previousValue, element) => previousValue.isNotEmpty ? '$previousValue, ${element.name}' : element.name,
      ),
      trailing: PrimaryIconButton(
        icon: const Icon(Icons.more_vert_rounded, color: Colors.black),
        onTap: () => print('ciao'),
      ),
    );
  }
}
