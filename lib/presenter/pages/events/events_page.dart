import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:supercalipso/presenter/components/scaffold/custom_app_bar.dart';
import 'package:supercalipso/presenter/components/scaffold/custom_scaffold.dart';
import 'package:supercalipso/presenter/pages/events/sections/events_list.dart';
import 'package:supercalipso/presenter/theme/colors.dart';
import 'package:supercalipso/presenter/theme/dimensions.dart';
import 'package:supercalipso/services/navigation/router_provider.dart';
import 'package:supercalipso/services/navigation/routes.dart';

class EventsPage extends HookConsumerWidget {
  const EventsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return CustomScaffold(
      appBar: const FlatAppBar(title: 'Events'),
      fab: FloatingActionButton(
        backgroundColor: AppColors.greyDarker,
        onPressed: () => ref.read(routerProvider).push(EventPageRoute.pagePath),
        child: const Icon(Icons.add),
      ),
      body: SingleChildScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        child: Column(
          children: [
            Padding(
              padding: Dimensions.pageInsetsWithTop,
              child: const GroupdByDayEventsList(),
            ),
          ],
        ),
      ),
    );
  }
}
