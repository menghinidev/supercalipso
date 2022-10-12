import 'package:duration/duration.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:supercalipso/bloc/team/team_provider.dart';
import 'package:supercalipso/bloc/utils.dart';
import 'package:supercalipso/data/model/event/team_event.dart';
import 'package:supercalipso/presenter/theme/colors.dart';
import 'package:supercalipso/presenter/theme/dimensions.dart';
import 'package:supercalipso/services/navigation/router_provider.dart';
import 'package:supercalipso/services/navigation/routes.dart';

class EventTile extends HookConsumerWidget {
  final TeamEvent event;

  const EventTile({super.key, required this.event});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var team = ref.watch(teamChangesProvider(event.team.id));
    return GestureDetector(
      onTap: () => ref.read(routerProvider).go(EventPageRoute.createPath(event.eventId)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: Dimensions.sVPadding,
            child: EventTimeComponent(from: event.startTime, forHowLong: event.duration),
          ),
          Text(
            event.name,
            style: Theme.of(context).textTheme.titleMedium,
          ),
          if (event.description != null)
            Padding(
              padding: Dimensions.sVPadding,
              child: Text(
                event.description!,
                style: Theme.of(context).textTheme.bodyText2,
              ),
            ),
          Container(
            margin: const EdgeInsets.only(top: Dimensions.mediumSize),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ActionChip(
                  elevation: Dimensions.lowElevation,
                  avatar: const Icon(Icons.people_outline_outlined),
                  onPressed: () => ref.read(routerProvider).go(TeamPageRoute.createPath(event.team.id)),
                  label: team.onValue(
                    builder: (data) => Text(
                      data.name,
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                  ),
                ),
                PopupMenuButton(
                  itemBuilder: (context) => <PopupMenuEntry>[],
                  padding: EdgeInsets.zero,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class EventTimeComponent extends StatelessWidget {
  final DateTime from;
  final Duration? forHowLong;

  const EventTimeComponent({super.key, required this.from, this.forHowLong});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: Dimensions.allSPadding,
      decoration: BoxDecoration(
        borderRadius: Shapes.lowRoundedBorder.borderRadius,
        border: Border.all(color: AppColors.lightBlueBackground),
        color: AppColors.lightBlueBackground,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            formatDate(),
            style: Theme.of(context).textTheme.titleSmall,
          ),
          if (forHowLong != null)
            Text.rich(
              TextSpan(
                style: Theme.of(context).textTheme.labelSmall,
                children: [
                  const TextSpan(text: 'Lasts for: '),
                  TextSpan(
                    text: printDuration(forHowLong!),
                    style: Theme.of(context).textTheme.labelSmall?.copyWith(fontWeight: FontWeight.bold),
                  )
                ],
              ),
            ),
        ],
      ),
    );
  }

  String formatDate() {
    if (from.hour != 0) return DateFormat.yMMMMd().add_Hm().format(from);
    return DateFormat.yMMMMd().format(from);
  }
}
