import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:supercalipso/data/model/event/builder/event_builder.dart';
import 'package:supercalipso/data/model/event/team_event.dart';
import 'package:supercalipso/presenter/components/button/primary_elevated.dart';
import 'package:supercalipso/presenter/components/button/primary_icon.dart';
import 'package:supercalipso/presenter/components/button/primary_text.dart';
import 'package:supercalipso/presenter/components/form/keyboard_focus_wrapper.dart';
import 'package:supercalipso/presenter/components/scaffold/custom_app_bar.dart';
import 'package:supercalipso/presenter/components/scaffold/custom_scaffold.dart';
import 'package:supercalipso/presenter/pages/event/controller/event_page_controller.dart';
import 'package:supercalipso/presenter/pages/event/controller/event_page_state.dart';
import 'package:supercalipso/presenter/pages/event/sections/info_section.dart';
import 'package:supercalipso/presenter/pages/event/sections/name_section.dart';
import 'package:supercalipso/presenter/pages/event/sections/time_section.dart';
import 'package:supercalipso/presenter/theme/dimensions.dart';
import 'package:supercalipso/services/localization/date_formatter_delegate.dart';

class EventPage extends HookConsumerWidget with DateFormatter {
  final TeamEvent? event;

  const EventPage({super.key, this.event});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var state = ref.watch(eventPageControllerProvider(event));
    return KeyboardFocusWrapper(
      child: CustomScaffold(
        resizeOnKeyboard: false,
        appBar: FlatAppBar(
          showProfileAvatar: false,
          leading: const BackButton(),
          title: state.on(
            defaultValue: () => '',
            onEditing: (editing) => 'Create Event',
            onReading: (state) => state.event.name,
          ),
          actions: [
            state.on(
              defaultValue: () => Container(),
              onReading: (state) => PrimaryIconButton(
                icon: const Icon(Icons.edit),
                onTap: () => getNotifier(ref).switchToEdit(),
              ),
            ),
          ],
        ),
        body: Padding(
          padding: Dimensions.pageInsets,
          child: state.on(
            defaultValue: () => Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisSize: MainAxisSize.max,
              children: [
                EventNameSection(
                  state: state,
                  onIconNameChanged: (name) => getNotifier(ref).editIcon(name),
                  onNameChanged: (name) => getNotifier(ref).editEventName(name ?? ''),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: Dimensions.mediumSize),
                  child: TimeEventSection(
                    state: state,
                    onStartTimeChanged: (start) => getNotifier(ref).editEventStartTime(start),
                    onEndTimeChanged: (end) => getNotifier(ref).editEventEndTime(end),
                    onStartDateChanged: (start) => getNotifier(ref).editEventStartDate(start),
                    onEndDateChanged: (end) => getNotifier(ref).editEventEndDate(end),
                  ),
                ),
                EventInfoSection(state: state),
                Expanded(
                  child: state.on(
                    defaultValue: () => Container(),
                    onEditing: (state) => Align(
                      alignment: Alignment.bottomCenter,
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Expanded(
                            child: PrimaryTextButton(
                              text: 'Discard Changes',
                              onTap: () => getNotifier(ref).discard(),
                            ),
                          ),
                          Expanded(
                            child: PrimaryElevatedButton(
                              text: 'Save Event',
                              onTap: state.builder.canBuild ? () => getNotifier(ref).submit() : null,
                            ),
                          ),
                        ],
                      ),
                    ),
                    onReading: (state) => Align(
                      alignment: Alignment.bottomRight,
                      child: PrimaryElevatedButton(
                        text: 'Delete',
                        color: Colors.red,
                        onTap: () => getNotifier(ref).delete(),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  EventPageNotifier getNotifier(WidgetRef ref) => ref.read(eventPageControllerProvider(event).notifier);
}
