import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:supercalipso/application/event/event_service.dart';
import 'package:supercalipso/application/note/note_service.dart';
import 'package:supercalipso/application/task/task_service.dart';
import 'package:supercalipso/plugin/utils.dart';
import 'package:supercalipso/presenter/components/bottomsheet/custom_bottom_sheet.dart';
import 'package:supercalipso/presenter/components/button/primary_icon.dart';
import 'package:supercalipso/presenter/components/form/keyboard_focus_wrapper.dart';
import 'package:supercalipso/presenter/components/scaffold/custom_app_bar.dart';
import 'package:supercalipso/presenter/components/scaffold/custom_scaffold.dart';
import 'package:supercalipso/presenter/pages/events/sections/events_list.dart';
import 'package:supercalipso/presenter/pages/notifications/notifications_page.dart';
import 'package:supercalipso/presenter/pages/tasks/section/task_list.dart';
import 'package:supercalipso/presenter/theme/colors.dart';
import 'package:supercalipso/presenter/theme/dimensions.dart';

class Dashboard extends HookConsumerWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return CustomScaffold(
      appBar: FlatAppBar(
        title: 'House Feed',
        actions: [
          Builder(
            builder: (context) => PrimaryIconButton(
              icon: const Icon(Icons.notifications),
              onTap: () => showModalBottomSheet(
                context: context,
                builder: (context) => CustomBottomSheet(
                  builder: (context) => const NotificationsPage(),
                  elevation: Dimensions.lowElevation * 2,
                  backgroundColor: AppColors.whiteDarker,
                  constraints: BoxConstraints(maxHeight: MediaQuery.of(context).size.height * 0.75),
                ),
              ),
            ),
          ),
        ],
      ),
      body: RefreshIndicator(
        onRefresh: () => Future.wait<Response>([
          ref.read(teamEventControllerProvider.notifier).askTeamEvents(),
          ref.read(loggedTeamNotesProvider.notifier).askTeamNotes(),
          ref.read(teamTaskStateProvider.notifier).askTeamTasks(),
        ]),
        child: KeyboardFocusWrapper(
          child: CustomScrollView(
            physics: const BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
            slivers: [
              SliverPadding(
                padding: Dimensions.pageInsetsWithTop,
                sliver: const SliverToBoxAdapter(child: EventsList()),
              ),
              SliverPadding(
                padding: Dimensions.pageInsetsWithTop,
                sliver: const SliverToBoxAdapter(child: TaskList()),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
