import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:supercalipso/data/model/event/builder/event_builder.dart';
import 'package:supercalipso/data/model/event/team_event.dart';
import 'package:supercalipso/presenter/components/scaffold/custom_scaffold.dart';
import 'package:supercalipso/presenter/pages/event/controller/event_page_controller.dart';

class EventPage extends HookConsumerWidget {
  const EventPage({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var controller = ref.watch(eventPageControllerProvider);
    return CustomScaffold(
      body: SingleChildScrollView(
        child: Column(),
      ),
    );
  }
}
