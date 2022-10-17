import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:supercalipso/bloc/event/event_service.dart';
import 'package:supercalipso/data/model/event/builder/event_builder.dart';
import 'package:supercalipso/plugin/utils.dart';
import 'package:supercalipso/presenter/components/bottomsheet/custom_bottom_sheet.dart';
import 'package:supercalipso/presenter/components/button/primary_elevated.dart';
import 'package:supercalipso/presenter/components/button/primary_icon.dart';
import 'package:supercalipso/presenter/components/form/custom_text_field.dart';
import 'package:supercalipso/presenter/components/form/validators.dart';
import 'package:supercalipso/presenter/components/picker/date_formfield_picker.dart';
import 'package:supercalipso/presenter/components/picker/time_formfield_picker.dart';
import 'package:supercalipso/presenter/theme/dimensions.dart';

final eventBuilderProvider = StateNotifierProvider.autoDispose<EventGeneratorNotifier, EventBuilder>((ref) {
  return EventGeneratorNotifier();
});

class EventGeneratorNotifier extends StateNotifier<EventBuilder> {
  EventGeneratorNotifier() : super(const EventBuilder());

  setName(String name) => state = state.copyWith(name: name);
  setDate(DateTime date) => state = state.copyWith(startTime: date);
  setTime(DateTime time) => state = state.copyWith(
      startTime:
          DateTime.utc(state.startTime!.year, state.startTime!.month, state.startTime!.day, time.hour, time.minute));
  setDuration({Duration? duration}) => state = state.copyWith(duration: duration);
  setDescription(String description) => state = state.copyWith(description: description);
}

class EventGeneratorSheet extends HookConsumerWidget {
  const EventGeneratorSheet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var nameController = useTextEditingController();
    var descriptionController = useTextEditingController();
    var builder = ref.watch(eventBuilderProvider);
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
                    child: Row(
                      children: [
                        Expanded(
                          flex: 3,
                          child: DateFormFieldPicker(
                            label: 'Select Date',
                            onSelected: (date) => ref.read(eventBuilderProvider.notifier).setDate(date.toDateTime()),
                            validInterval: DateInterval(
                              start: Date.today(),
                              end: Date.today().increase(const Duration(days: 365)) as Date,
                            ),
                          ),
                        ),
                        const SizedBox(width: Dimensions.smallSize),
                        Expanded(
                          flex: 2,
                          child: TimeFormFieldPicker(
                            label: 'Select Time',
                            onSelected: (time) => ref.read(eventBuilderProvider.notifier).setTime(time.toDateTime()),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: Dimensions.allMPadding,
              child: PrimaryElevatedButton(
                text: 'Create Event',
                onTap: builder.canBuild
                    ? () => ref
                        .read(eventServiceProvider)
                        .createEvent(
                          name: nameController.text,
                          startTime: builder.startTime!,
                          duration: builder.duration,
                          description: descriptionController.text,
                        )
                        .then((value) => Navigator.pop(context))
                    : null,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
