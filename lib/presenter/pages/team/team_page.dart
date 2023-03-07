import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:supercalipso/application/team/team_provider.dart';
import 'package:supercalipso/application/team/team_service.dart';
import 'package:supercalipso/application/utils.dart';
import 'package:supercalipso/presenter/components/scaffold/custom_scaffold.dart';
import 'package:supercalipso/presenter/components/scaffold/page_header.dart';

class TeamPage extends HookConsumerWidget {
  final String teamId;

  const TeamPage({super.key, required this.teamId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var team = ref.watch(teamProvider(teamId));
    return CustomScaffold(
      body: team.onValue(
        builder: (data) => CustomScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          slivers: [
            SliverToBoxAdapter(child: PageHeader(text: data.name)),
          ],
        ),
      ),
    );
  }
}
