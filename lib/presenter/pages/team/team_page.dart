import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:supercalipso/bloc/team/team_provider.dart';
import 'package:supercalipso/bloc/utils.dart';
import 'package:supercalipso/presenter/components/scaffold/custom_scaffold.dart';
import 'package:supercalipso/presenter/components/scaffold/page_header.dart';
import 'package:supercalipso/presenter/pages/dashboard/sections/latest_events.dart';
import 'package:supercalipso/presenter/pages/dashboard/sections/pinned_notes.dart';
import 'package:supercalipso/presenter/pages/team/sections/chip_bar.dart';
import 'package:supercalipso/presenter/theme/dimensions.dart';

class TeamPage extends HookConsumerWidget {
  final String teamId;

  const TeamPage({super.key, required this.teamId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var team = ref.watch(teamChangesProvider(teamId));
    return CustomScaffold(
      body: team.onValue(
        builder: (data) => CustomScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          slivers: [
            SliverToBoxAdapter(child: PageHeader(text: data.name)),
            SliverToBoxAdapter(child: TeamPageChipBar(team: data)),
            SliverPadding(
              padding: Dimensions.pageInsetsWithTop,
              sliver: const SliverToBoxAdapter(child: LatestEvents()),
            ),
            SliverPadding(
              padding: Dimensions.pageInsetsWithTop,
              sliver: const SliverToBoxAdapter(child: NotesSection()),
            ),
          ],
        ),
      ),
    );
  }
}
