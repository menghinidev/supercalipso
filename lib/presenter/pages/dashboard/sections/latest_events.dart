import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:supercalipso/bloc/event/event_provider.dart';
import 'package:supercalipso/bloc/team/team_provider.dart';
import 'package:supercalipso/data/model/event/team_event.dart';
import 'package:supercalipso/presenter/components/common/empty_data_widget.dart';
import 'package:supercalipso/presenter/components/common/loading_list.dart';
import 'package:supercalipso/presenter/components/tile/custom_tile.dart';
import 'package:supercalipso/presenter/pages/dashboard/sections/card_section.dart';

class LatestEvents extends HookConsumerWidget {
  const LatestEvents({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var events = ref.watch(latestEventsChangesProvider);
    return events.when(
      data: (data) => SliverToBoxAdapter(
        child: CardSection(
          title: 'Eventi',
          body: EmptyDataWidget(
            emptyCondition: data.isEmpty,
            emptyPlaceholder: Text(
              'Non hai nessun evento',
              style: Theme.of(context).textTheme.caption,
            ),
            child: ListView.builder(
              itemCount: data.length,
              shrinkWrap: true,
              itemBuilder: (context, index) => LatestEventTile(event: data[index]),
            ),
          ),
        ),
      ),
      error: (_, __) => SliverToBoxAdapter(child: Container()),
      loading: () => SliverToBoxAdapter(child: Container()),
    );
  }
}

class LatestEventTile extends HookConsumerWidget {
  final TeamEvent event;

  const LatestEventTile({super.key, required this.event});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var team = ref.watch(teamChangesProvider(event.team.id));
    return CustomTile(
      title: event.name,
      subtitle: event.startTime.toString(),
      leading: team.when(
        data: (data) => CircleAvatar(child: Text(data.name[0])),
        error: (_, __) => const SizedBox(width: 24),
        loading: () => const SizedBox(width: 24),
      ),
      trailing: PopupMenuButton(itemBuilder: (_) => []),
    );
  }
}
