import 'package:flutter/material.dart';
import 'package:supercalipso/data/model/team/team.dart';
import 'package:supercalipso/presenter/pages/teams/components/team_tile.dart';
import 'package:supercalipso/presenter/theme/dimensions.dart';

class TeamsList extends StatelessWidget {
  final String? label;
  final List<Team> teams;

  const TeamsList({required this.teams, this.label, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        if (label != null) ...[
          Padding(
            padding: const EdgeInsets.only(bottom: Dimensions.mediumSize),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                label!,
                style: Theme.of(context).textTheme.headlineSmall,
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(bottom: Dimensions.mediumSize),
            child: Divider(),
          ),
        ],
        ListView.separated(
          itemBuilder: (context, index) => TeamTile(team: teams[index]),
          separatorBuilder: (context, index) => const SizedBox(height: Dimensions.mediumSize),
          itemCount: teams.length,
          shrinkWrap: true,
        ),
      ],
    );
  }
}
