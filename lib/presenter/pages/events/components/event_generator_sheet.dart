import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:supercalipso/bloc/event/event_service.dart';
import 'package:supercalipso/data/model/event/builder/event_builder.dart';
import 'package:supercalipso/presenter/components/bottomsheet/custom_bottom_sheet.dart';
import 'package:supercalipso/presenter/components/button/primary_elevated.dart';
import 'package:supercalipso/presenter/components/button/primary_icon.dart';
import 'package:supercalipso/presenter/components/form/custom_text_field.dart';
import 'package:supercalipso/presenter/components/form/validators.dart';
import 'package:supercalipso/presenter/components/picker/date_formfield_picker.dart';
import 'package:supercalipso/presenter/theme/dimensions.dart';

final eventBuilderProvider =
    StateNotifierProvider.family.autoDispose<EventGeneratorNotifier, EventBuilder, String>((ref, id) {
  return EventGeneratorNotifier(teamId: id);
});

class EventGeneratorNotifier extends StateNotifier<EventBuilder> {
  EventGeneratorNotifier({required String teamId}) : super(EventBuilder(teamId: teamId));

  setName(String name) => state = state.copyWith(name: name);
  setStartTime(DateTime time) => state = state.copyWith(startTime: time);
  setDuration({Duration? duration}) => state = state.copyWith(duration: duration);
  setDescription(String description) => state = state.copyWith(description: description);
}

class EventGeneratorSheet extends HookConsumerWidget {
  final String teamId;

  const EventGeneratorSheet({Key? key, required this.teamId}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var nameController = useTextEditingController();
    var descriptionController = useTextEditingController();
    var builder = ref.watch(eventBuilderProvider(teamId));
    return CustomBottomSheet(
      builder: (context) => SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisSize: MainAxisSize.min,
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: PrimaryIconButton(
                onTap: () => Navigator.pop(context),
                icon: const Icon(Icons.arrow_back),
              ),
            ),
            Padding(
              padding: Dimensions.allMPadding,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  CustomTextField(
                    controller: nameController,
                    label: 'Event name',
                    validator: (value) => FormValidators.nonEmptyValidator(value, context),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: Dimensions.smallSize),
                    child: CustomTextField(
                      controller: descriptionController,
                      label: 'Description',
                      minLines: 2,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: Dimensions.smallSize),
                    child: DayFormFieldPicker(
                      label: 'Select Date',
                      onSelected: (date) =>
                          ref.read(eventBuilderProvider(teamId).notifier).setStartTime(date.toDateTime()),
                    ),
                  ),
                ],
              ),
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Switch(
                  value: builder.duration != null,
                  onChanged: builder.startTime != null
                      ? (isOn) {
                          if (isOn) {
                            showTimePicker(
                              context: context,
                              initialTime: TimeOfDay.now(),
                            ).then(
                              (value) {
                                if (value == null) return Future.value();
                                var actualTime = builder.startTime;
                                actualTime!.add(Duration(hours: value.hour, minutes: value.minute));
                                var duration = actualTime.difference(builder.startTime!);
                                ref.read(eventBuilderProvider(teamId).notifier).setDuration(duration: duration);
                              },
                            );
                          } else {
                            ref.read(eventBuilderProvider(teamId).notifier).setDuration();
                          }
                        }
                      : null,
                ),
                Text(
                  'Has specific time',
                  style: Theme.of(context).textTheme.bodyText1,
                ),
              ],
            ),
            Padding(
              padding: Dimensions.allMPadding,
              child: PrimaryElevatedButton(
                text: 'Create Event',
                onTap: builder.startTime == null
                    ? null
                    : () => ref
                        .read(eventServiceProvider)
                        .createEvent(
                          name: nameController.text,
                          startTime: builder.startTime!,
                          duration: builder.duration,
                          description: descriptionController.text,
                          teamId: teamId,
                        )
                        .then((value) => Navigator.pop(context)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
