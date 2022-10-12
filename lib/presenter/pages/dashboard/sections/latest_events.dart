import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:supercalipso/bloc/event/event_provider.dart';
import 'package:supercalipso/bloc/utils.dart';
import 'package:supercalipso/presenter/components/common/empty_data_widget.dart';
import 'package:supercalipso/presenter/pages/dashboard/components/event_tile.dart';
import 'package:supercalipso/presenter/pages/dashboard/sections/card_section.dart';

class LatestEvents extends HookConsumerWidget {
  const LatestEvents({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var events = ref.watch(latestEventsChangesProvider);
    return events.onValue(
      builder: (data) => CardSection(
        title: 'Eventi',
        body: EmptyDataWidgetBuilder(
          emptyCondition: () => data.isEmpty,
          placeholderBuilder: (context) => Text(
            'Non hai nessun evento',
            style: Theme.of(context).textTheme.caption,
          ),
          builder: (context) => ListView.separated(
            physics: const NeverScrollableScrollPhysics(),
            itemCount: data.length,
            padding: EdgeInsets.zero,
            shrinkWrap: true,
            itemBuilder: (context, index) => EventTile(event: data[index]),
            separatorBuilder: (context, index) => const Divider(),
          ),
        ),
      ),
    );
  }
}
