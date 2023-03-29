import 'package:flutter/material.dart';
import 'package:supercalipso/presenter/components/picker/date_and_time_picker.dart';
import 'package:supercalipso/presenter/pages/home/dashboard/sections/card_section.dart';
import 'package:supercalipso/presenter/pages/event/controller/event_page_state.dart';
import 'package:supercalipso/presenter/theme/dimensions.dart';

class TimeEventSection extends StatelessWidget {
  final EventPageState state;
  final Function(DateTime) onStartTimeChanged;
  final Function(DateTime) onStartDateChanged;
  final Function(DateTime) onEndTimeChanged;
  final Function(DateTime) onEndDateChanged;

  const TimeEventSection({
    super.key,
    required this.state,
    required this.onStartTimeChanged,
    required this.onStartDateChanged,
    required this.onEndTimeChanged,
    required this.onEndDateChanged,
  });

  @override
  Widget build(BuildContext context) {
    return CardSection(
      title: 'Date',
      children: [
        Padding(
          padding: const EdgeInsets.only(top: Dimensions.mediumSize),
          child: DateAndTimePickers(
            onDateChanged: onStartDateChanged,
            onTimeChanged: onStartTimeChanged,
            dateLabel: 'Start',
            isReadOnly: state.on(defaultValue: () => false, onReading: (state) => true),
            initialDateTime: state.on(
              defaultValue: () => null,
              onReading: (state) => state.event.startTime,
              onEditing: (state) => state.builder.startTime,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: Dimensions.mediumSize),
          child: DateAndTimePickers(
            onDateChanged: onEndDateChanged,
            onTimeChanged: onEndTimeChanged,
            dateLabel: 'End',
            isReadOnly: state.on(defaultValue: () => false, onReading: (state) => true),
            from: state.on(
              defaultValue: () => null,
              onEditing: (state) => state.builder.startTime,
            ),
            initialDateTime: state.on(
              defaultValue: () => null,
              onEditing: (state) => state.builder.endTime,
              onReading: (state) => state.event.endTime,
            ),
          ),
        ),
      ],
    );
  }
}
