import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:supercalipso/bloc/auth/auth_provider.dart';
import 'package:supercalipso/bloc/event/event_service.dart';
import 'package:supercalipso/bloc/team/team_provider.dart';
import 'package:supercalipso/bloc/team/team_service.dart';
import 'package:supercalipso/plugin/utils.dart';
import 'package:supercalipso/presenter/components/scaffold/custom_app_bar.dart';
import 'package:supercalipso/presenter/components/scaffold/custom_scaffold.dart';
import 'package:supercalipso/presenter/pages/dashboard/components/team_invitations_icon.dart';
import 'package:supercalipso/presenter/pages/dashboard/sections/frequent_teams.dart';
import 'package:supercalipso/presenter/pages/dashboard/sections/latest_events.dart';
import 'package:supercalipso/presenter/theme/dimensions.dart';

class Dashboard extends StatefulHookConsumerWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _DashboardState();
}

class _DashboardState extends ConsumerState<Dashboard> {
  @override
  void initState() {
    super.initState();
    var teamService = ref.read(teamServiceProvider);
    var eventsService = ref.read(eventServiceProvider);
    teamService.getUserTeams();
    teamService.getTeamsInvitations();
    eventsService.getTeamEvents();
  }

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      appBar: const CustomAppBar(
        title: 'DASHBOARD',
        implyLeading: false,
        actions: [TeamInvitationIcon()],
      ),
      body: RefreshIndicator(
        onRefresh: () => Future.wait<Response>([
          ref.read(teamServiceProvider).getUserTeams(),
          ref.read(teamServiceProvider).getTeamsInvitations(),
        ]),
        child: CustomScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          slivers: [
            SliverPadding(
              padding: Dimensions.pageInsetsWithTop,
              sliver: const FrequentTeamsList(),
            ),
            SliverPadding(
              padding: Dimensions.pageInsetsWithTop,
              sliver: const LatestEvents(),
            ),
          ],
        ),
      ),
    );
  }
}
