import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:supercalipso/bloc/team/team_provider.dart';
import 'package:supercalipso/bloc/utils.dart';
import 'package:supercalipso/data/model/team/team.dart';
import 'package:supercalipso/presenter/pages/profile/components/team_tile.dart';
import 'package:supercalipso/presenter/pages/dashboard/sections/list_section.dart';

class TeamsList extends HookConsumerWidget {
  const TeamsList({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var teams = ref.watch(teamsChangesProvider);
    return teams.onValue(
      builder: (data) => BaseListSection<Team>(
        title: 'Enrolled teams',
        items: data,
        builder: (team) => TeamTile(team: team),
      ),
    );
  }
}
