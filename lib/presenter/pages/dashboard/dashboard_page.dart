import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:supercalipso/bloc/event/event_service.dart';
import 'package:supercalipso/bloc/note/note_service.dart';
import 'package:supercalipso/bloc/team/team_service.dart';
import 'package:supercalipso/plugin/utils.dart';
import 'package:supercalipso/presenter/components/form/keyboard_focus_wrapper.dart';
import 'package:supercalipso/presenter/components/scaffold/custom_app_bar.dart';
import 'package:supercalipso/presenter/components/scaffold/custom_scaffold.dart';
import 'package:supercalipso/presenter/pages/dashboard/components/team_invitations_icon.dart';
import 'package:supercalipso/presenter/pages/dashboard/sections/frequent_teams.dart';
import 'package:supercalipso/presenter/pages/dashboard/sections/latest_events.dart';
import 'package:supercalipso/presenter/pages/dashboard/sections/pinned_notes.dart';
import 'package:supercalipso/presenter/pages/events/sections/events_list.dart';
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
    var teamService = ref.read(teamServiceProvider);
    var eventsService = ref.read(eventServiceProvider);
    var notesService = ref.read(noteServiceProvider);
    teamService.getUserTeams();
    teamService.getTeamsInvitations();
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
          ref.read(teamServiceProvider).getUserTeams(),
          ref.read(teamServiceProvider).getTeamsInvitations(),
          ref.read(eventServiceProvider).getUserEvents(),
        ]),
        child: KeyboardFocusWrapper(
          child: CustomScrollView(
            physics: const AlwaysScrollableScrollPhysics(),
            slivers: [
              SliverPadding(
                padding: Dimensions.pageInsetsWithTop,
                sliver: const SliverToBoxAdapter(child: EventsList()),
              ),
              const SliverPadding(
                padding: Dimensions.pageInsets,
                sliver: SliverToBoxAdapter(child: TaskList()),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
