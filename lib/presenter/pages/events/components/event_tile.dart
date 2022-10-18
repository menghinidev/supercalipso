import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:supercalipso/bloc/auth/auth_service.dart';
import 'package:supercalipso/bloc/utils.dart';
import 'package:supercalipso/data/model/event/team_event.dart';
import 'package:supercalipso/presenter/components/tile/custom_tile.dart';
import 'package:supercalipso/presenter/pages/event/sections/name_section.dart';
import 'package:supercalipso/presenter/pages/profile/components/profile_avatar.dart';
import 'package:supercalipso/presenter/theme/colors.dart';
import 'package:supercalipso/presenter/theme/dimensions.dart';
import 'package:supercalipso/services/localization/date_formatter_delegate.dart';
import 'package:supercalipso/services/navigation/router_provider.dart';
import 'package:supercalipso/services/navigation/routes.dart';

class EventTile extends HookConsumerWidget {
  final TeamEvent event;

  const EventTile({super.key, required this.event});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var loggedUser = ref.watch(getUserByIdProvider(event.createdByUserId));
    return CustomTile(
      title: event.name,
      subtitle: EventTileSubtitle(event: event),
      leading: Icon(
        EventIconDataFactory.getIcon(event.iconName) ?? Icons.event,
        color: AppColors.black,
      ),
      trailing: loggedUser.onValue(
        builder: (data) => Padding(
          padding: Dimensions.allSPadding,
          child: ProfileAvatar(imageURL: data.imageURL),
        ),
      ),
      onTap: () => ref.read(routerProvider).push(EventPageRoute.pagePath, extra: event),
    );
  }
}

class EventTileSubtitle extends StatelessWidget with DateFormatter {
  final TeamEvent event;

  const EventTileSubtitle({super.key, required this.event});

  @override
  Widget build(BuildContext context) {
    return Text(
      event.endTime != null
          ? '${formatTime(event.startTime)} - ${formatDateAndTime(event.endTime!)}'
          : formatDateAndTime(event.startTime),
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
      style: Theme.of(context).textTheme.labelLarge?.copyWith(color: AppColors.grey),
    );
  }
}
