import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:supercalipso/bloc/team/team_provider.dart';
import 'package:supercalipso/data/model/team/team.dart';
import 'package:supercalipso/presenter/components/card/custom_card.dart';
import 'package:supercalipso/presenter/components/common/empty_data_widget.dart';
import 'package:supercalipso/presenter/components/common/loading_list.dart';
import 'package:supercalipso/presenter/components/tile/custom_tile.dart';
import 'package:supercalipso/presenter/pages/dashboard/components/team_tile.dart';
import 'package:supercalipso/presenter/pages/dashboard/sections/card_section.dart';
import 'package:supercalipso/presenter/theme/colors.dart';
import 'package:supercalipso/presenter/theme/dimensions.dart';

class FrequentTeamsList extends HookConsumerWidget {
  const FrequentTeamsList({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var teams = ref.watch(teamsChangesProvider);
    return teams.when(
      data: (value) => SliverToBoxAdapter(
        child: CardSection(
          title: 'Team frequenti',
          body: EmptyDataWidget(
            emptyCondition: value.isEmpty,
            emptyPlaceholder: Text(
              'Non hai nessuna iscrizione',
              style: Theme.of(context).textTheme.caption,
            ),
            child: ListView.separated(
              itemCount: value.length,
              shrinkWrap: true,
              itemBuilder: (context, index) => FrequentTeamAvatar(team: value[index]),
              separatorBuilder: (context, index) => const SizedBox(width: Dimensions.mediumSize),
            ),
          ),
        ),
      ),
      error: (error, stackTrace) => Text(error.toString()),
      loading: () => const SliverToBoxAdapter(
        child: Align(
          alignment: Alignment.centerLeft,
          child: LoadingList(),
        ),
      ),
    );
  }
}
