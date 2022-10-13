import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:supercalipso/bloc/team/team_provider.dart';
import 'package:supercalipso/bloc/utils.dart';
import 'package:supercalipso/presenter/components/common/empty_data_widget.dart';
import 'package:supercalipso/presenter/pages/dashboard/components/team_tile.dart';
import 'package:supercalipso/presenter/pages/dashboard/sections/card_section.dart';
import 'package:supercalipso/presenter/theme/dimensions.dart';

class FrequentTeamsList extends HookConsumerWidget {
  const FrequentTeamsList({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var teams = ref.watch(teamsChangesProvider);
    return teams.onValue(
      builder: (data) => CardSection(
        title: 'Team frequenti',
        body: EmptyDataWidgetBuilder(
          emptyCondition: () => data.isEmpty,
          placeholderBuilder: (context) => Text(
            'Non hai nessuna iscrizione',
            style: Theme.of(context).textTheme.caption,
          ),
          builder: (context) => ListView.separated(
            physics: const NeverScrollableScrollPhysics(),
            itemCount: data.length,
            shrinkWrap: true,
            itemBuilder: (context, index) => TeamTile(team: data[index]),
            separatorBuilder: (context, index) => const SizedBox(width: Dimensions.mediumSize),
          ),
        ),
      ),
    );
  }
}
