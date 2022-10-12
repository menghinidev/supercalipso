import 'package:duration/duration.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:supercalipso/bloc/event/event_provider.dart';
import 'package:supercalipso/bloc/utils.dart';
import 'package:supercalipso/data/model/event/team_event.dart';
import 'package:supercalipso/presenter/components/common/loading_list.dart';
import 'package:supercalipso/presenter/components/scaffold/custom_app_bar.dart';
import 'package:supercalipso/presenter/components/scaffold/custom_scaffold.dart';
import 'package:supercalipso/presenter/theme/colors.dart';
import 'package:supercalipso/presenter/theme/dimensions.dart';

class EventPage extends HookConsumerWidget {
  final String eventId;

  const EventPage({Key? key, required this.eventId}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var event = ref.watch(teamEventChangesProvider(eventId));
    return CustomScaffold(
      appBar: const CustomAppBar(title: 'Evento'),
      body: SingleChildScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        child: Padding(
          padding: Dimensions.pageInsetsWithTop,
          child: event.onDefault(
            defaultValue: const LoadingList(),
            builder: (data) => Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: Shapes.lowRoundedBorder.borderRadius,
                    border: Border.all(color: AppColors.lightBlueBackground),
                    color: AppColors.lightBlueBackground,
                  ),
                  padding: Dimensions.allMPadding,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text(
                        DateFormat.yMMMMd().format(data.startTime),
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                      if (!data.isDayEvent)
                        Text.rich(
                          TextSpan(
                            style: Theme.of(context).textTheme.labelLarge,
                            children: [
                              TextSpan(text: DateFormat.Hm().format(data.startTime)),
                              if (!data.isDayEvent)
                                TextSpan(text: ' - ${DateFormat.Hm().format(data.startTime.add(data.duration!))}')
                            ],
                          ),
                        ),
                      Text(
                        data.isDayEvent ? printDuration(const Duration(days: 1)) : printDuration(data.duration!),
                        style: Theme.of(context).textTheme.caption,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
