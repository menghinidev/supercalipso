import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:supercalipso/bloc/event/event_provider.dart';
import 'package:supercalipso/bloc/utils.dart';
import 'package:supercalipso/data/model/event/team_event.dart';
import 'package:supercalipso/presenter/pages/dashboard/sections/list_section.dart';
import 'package:supercalipso/presenter/pages/events/components/event_tile.dart';

class EventsList extends HookConsumerWidget {
  final Widget Function(List<TeamEvent> events)? mapper;
  const EventsList({super.key, this.mapper});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var events = ref.watch(latestEventsChangesProvider);
    return events.onValue(
      builder: mapper != null
          ? mapper!
          : (data) => BaseListSection<TeamEvent>(
                title: 'Events',
                items: data,
                builder: (item) => EventTile(event: item),
              ),
    );
  }
}
