import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:supercalipso/bloc/event/event_service.dart';
import 'package:supercalipso/bloc/note/note_service.dart';
import 'package:supercalipso/bloc/task/task_service.dart';
import 'package:supercalipso/plugin/utils.dart';
import 'package:supercalipso/presenter/components/form/keyboard_focus_wrapper.dart';
import 'package:supercalipso/presenter/components/scaffold/custom_app_bar.dart';
import 'package:supercalipso/presenter/components/scaffold/custom_scaffold.dart';
import 'package:supercalipso/presenter/pages/events/sections/events_list.dart';
import 'package:supercalipso/presenter/pages/profile/components/team_invitations_icon.dart';
import 'package:supercalipso/presenter/pages/tasks/section/task_list.dart';
import 'package:supercalipso/presenter/theme/dimensions.dart';

class Dashboard extends HookConsumerWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return CustomScaffold(
      appBar: const FlatAppBar(
        title: 'House Feed',
        actions: [TeamInvitationIcon()],
      ),
      body: RefreshIndicator(
        onRefresh: () => Future.wait<Response>([
          ref.read(eventServiceProvider).askTeamEvents(),
          ref.read(noteServiceProvider).askTeamNotes(),
          ref.read(taskServiceProvider).askTeamTasks(),
        ]),
        child: KeyboardFocusWrapper(
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
            child: Column(
              children: [
                Padding(
                  padding: Dimensions.pageInsetsWithTop,
                  child: const EventsList(),
                ),
                Padding(
                  padding: Dimensions.pageInsetsWithTop,
                  child: const TaskList(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
