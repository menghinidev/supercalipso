import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:supercalipso/application/event/event_provider.dart';
import 'package:supercalipso/application/utils.dart';
import 'package:supercalipso/data/model/event/team_event.dart';
import 'package:supercalipso/presenter/components/common/empty_data_widget.dart';
import 'package:supercalipso/presenter/pages/dashboard/sections/list_section.dart';
import 'package:supercalipso/presenter/pages/events/components/event_tile.dart';
import 'package:supercalipso/presenter/theme/dimensions.dart';

class EventsList extends ConsumerWidget {
  const EventsList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var events = ref.watch(teamEventsChangesProvider);
    return events.onValue(
      builder: (data) => BaseListSection<TeamEvent>(
        title: 'Events',
        items: data,
        builder: (item) => EventTile(event: item),
      ),
    );
  }
}

class GroupdByDayEventsList extends HookConsumerWidget {
  const GroupdByDayEventsList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var events = ref.watch(teamEventsChangesProvider);
    return events.onValue(
      builder: (data) => EmptyDataWidgetBuilder(
        emptyCondition: () => data.isEmpty,
        builder: (context) => Column(
          children: data
              .groupByDay()
              .entries
              .map<Widget>((e) => Padding(
                    padding: const EdgeInsets.only(bottom: Dimensions.mediumSize),
                    child: BaseListSection<TeamEvent>(
                      title: DateFormat.yMMMMd().format(e.key),
                      items: e.value,
                      builder: (item) => EventTile(event: item),
                    ),
                  ))
              .toList(),
        ),
      ),
    );
  }
}
