import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:supercalipso/bloc/team/team_provider.dart';
import 'package:supercalipso/data/model/event/team_event.dart';
import 'package:supercalipso/presenter/components/scaffold/custom_app_bar.dart';
import 'package:supercalipso/presenter/components/scaffold/custom_scaffold.dart';
import 'package:supercalipso/presenter/pages/dashboard/components/event_generator_sheet.dart';
import 'package:supercalipso/presenter/pages/dashboard/sections/list_section.dart';
import 'package:supercalipso/presenter/pages/events/components/event_tile.dart';
import 'package:supercalipso/presenter/pages/events/sections/events_list.dart';
import 'package:supercalipso/presenter/theme/colors.dart';
import 'package:supercalipso/presenter/theme/dimensions.dart';

class EventsPage extends HookConsumerWidget {
  const EventsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return CustomScaffold(
      appBar: const FlatAppBar(title: 'Events'),
      fab: Builder(builder: (context) {
        return FloatingActionButton(
          backgroundColor: AppColors.greyDarker,
          onPressed: () => print('ciao'),
          child: Icon(Icons.add),
        );
      }),
      body: SingleChildScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        child: Column(
          children: [
            Padding(
              padding: Dimensions.pageInsetsWithTop,
              child: EventsList(
                  mapper: (events) => Column(
                        children: events
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
                      )),
            ),
          ],
        ),
      ),
    );
  }
}
