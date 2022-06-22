import 'package:flutter/material.dart';
import 'package:supercalipso/bloc/team/states.dart';
import 'package:supercalipso/bloc/team/teams_bloc.dart';
import 'package:supercalipso/plugin/bloc.dart';
import 'package:supercalipso/presenter/components/button/primary_icon.dart';
import 'package:supercalipso/presenter/components/card/custom_card.dart';
import 'package:supercalipso/presenter/components/scaffold/custom_app_bar.dart';
import 'package:supercalipso/presenter/components/scaffold/custom_scaffold.dart';
import 'package:supercalipso/presenter/pages/teams/sections/teams_list.dart';
import 'package:supercalipso/presenter/theme/colors.dart';
import 'package:supercalipso/presenter/theme/dimensions.dart';

class TeamsPage extends StatelessWidget {
  const TeamsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      appBar: CustomAppBar(
        title: 'TEAMS',
        enableLeading: false,
        actions: [
          BlocStateBuilder<TeamsBloc>(
            stateBinders: [
              BlocStateBuilderBinder<TeamsLoaded>(
                builder: (context, state) => PrimaryIconButton(
                  icon: const Icon(Icons.group_add_outlined),
                  onTap: () => print('ciap'),
                ),
              ),
            ],
          ),
        ],
      ),
      body: BlocStateBuilder<TeamsBloc>(
        stateBinders: [
          BlocStateBuilderBinder<TeamsLoaded>(
            builder: (context, state) => SingleChildScrollView(
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
                          teams: state.enrolledTeams,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
