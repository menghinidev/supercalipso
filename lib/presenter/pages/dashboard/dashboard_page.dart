import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:supercalipso/bloc/event/event_service.dart';
import 'package:supercalipso/bloc/note/note_service.dart';
import 'package:supercalipso/bloc/team/team_service.dart';
import 'package:supercalipso/plugin/utils.dart';
import 'package:supercalipso/presenter/components/form/keyboard_focus_wrapper.dart';
import 'package:supercalipso/presenter/components/scaffold/custom_app_bar.dart';
import 'package:supercalipso/presenter/components/scaffold/custom_scaffold.dart';
import 'package:supercalipso/presenter/pages/events/sections/events_list.dart';
import 'package:supercalipso/presenter/pages/profile/components/team_invitations_icon.dart';
import 'package:supercalipso/presenter/pages/tasks/section/task_list.dart';
import 'package:supercalipso/presenter/theme/dimensions.dart';

class Dashboard extends StatefulHookConsumerWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _DashboardState();
}

class _DashboardState extends ConsumerState<Dashboard> {
  @override
  void initState() {
    super.initState();
    var eventsService = ref.read(eventServiceProvider);
    var notesService = ref.read(noteServiceProvider);
    eventsService.getUserEvents();
    notesService.getUserNotes();
  }

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      appBar: const FlatAppBar(
        title: 'House Feed',
        actions: [TeamInvitationIcon()],
      ),
      body: RefreshIndicator(
        onRefresh: () => Future.wait<Response>([
          ref.read(eventServiceProvider).getUserEvents(),
          ref.read(noteServiceProvider).getUserNotes(),
        ]),
        child: KeyboardFocusWrapper(
          child: SingleChildScrollView(
            physics: const AlwaysScrollableScrollPhysics(),
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
