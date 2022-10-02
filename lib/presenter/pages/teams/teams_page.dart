import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:supercalipso/bloc/team/team_provider.dart';
import 'package:supercalipso/presenter/components/button/primary_icon.dart';
import 'package:supercalipso/presenter/components/card/custom_card.dart';
import 'package:supercalipso/presenter/components/scaffold/custom_app_bar.dart';
import 'package:supercalipso/presenter/components/scaffold/custom_scaffold.dart';
import 'package:supercalipso/presenter/pages/teams/sections/teams_list.dart';
import 'package:supercalipso/presenter/theme/colors.dart';
import 'package:supercalipso/presenter/theme/dimensions.dart';

class TeamsPage extends ConsumerWidget {
  const TeamsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var teamsChanges = ref.watch(loggedUserTeamsChangesProvider);
    return CustomScaffold(
      appBar: const CustomAppBar(title: 'TEAMS', enableLeading: false),
      body: teamsChanges.when(
        data: (teams) => SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                padding: Dimensions.pageInsets.copyWith(top: Dimensions.largeSize),
                child: CustomCard(
                  color: AppColors.lightBlueBackground,
                  child: Padding(
                    padding: const EdgeInsets.all(Dimensions.mediumSize),
                    child: TeamsList(
                      label: 'I tuoi team',
                      teams: teams,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        error: (_, stack) => Text('ERROR: $stack'),
        loading: () => const CircularProgressIndicator(),
      ),
    );
  }
}
