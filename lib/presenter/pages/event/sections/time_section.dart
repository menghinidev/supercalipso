import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:supercalipso/plugin/utils.dart';
import 'package:supercalipso/presenter/components/card/custom_card.dart';
import 'package:supercalipso/presenter/components/picker/date_formfield_picker.dart';
import 'package:supercalipso/presenter/components/picker/time_formfield_picker.dart';
import 'package:supercalipso/presenter/pages/event/controller/event_page_state.dart';
import 'package:supercalipso/presenter/theme/dimensions.dart';

class TimeEventSection extends StatelessWidget {
  final EventPageState state;
  final Function(DateTime) onStartTimeChanged;
  final Function(DateTime) onStartDateChanged;
  final Function(DateTime) onEndTimeChanged;
  final Function(DateTime) onEndDateChanged;

  const TimeEventSection(
      {super.key,
      required this.state,
      required this.onStartTimeChanged,
      required this.onStartDateChanged,
      required this.onEndTimeChanged,
      required this.onEndDateChanged});

  @override
  Widget build(BuildContext context) {
    return CustomCard(
      child: Padding(
        padding: Dimensions.allMPadding,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Date',
              style: Theme.of(context).textTheme.titleLarge,
            ),
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
        ),
      ),
    );
  }
}

class DateAndTimePickers extends StatelessWidget {
  final String dateLabel;
  final Function(DateTime) onDateChanged;
  final Function(DateTime) onTimeChanged;
  final DateTime? from;
  final DateTime? initialDateTime;
  final bool isReadOnly;

  const DateAndTimePickers({
    super.key,
    required this.onDateChanged,
    required this.onTimeChanged,
    this.dateLabel = 'Date',
    this.isReadOnly = false,
    this.initialDateTime,
    this.from,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 3,
          child: DateFormFieldPicker(
            label: dateLabel,
            initialValue: initialDateTime != null ? Date.fromDateTime(initialDateTime!) : null,
            onSelected: (date) => onDateChanged(date.toDateTime()),
            readOnly: isReadOnly,
            validInterval: DateInterval(
              start: from != null ? Date.fromDateTime(from!) : Date.today(),
              end: Date.today().increase(const Duration(days: 365)) as Date,
            ),
          ),
        ),
        const SizedBox(width: Dimensions.smallSize),
        Expanded(
          flex: 2,
          child: TimeFormFieldPicker(
            label: 'Time',
            isReadOnly: isReadOnly,
            initialValue: initialDateTime != null ? Time.fromDateTime(initialDateTime!) : null,
            onSelected: (time) => onTimeChanged(time.toDateTime()),
          ),
        )
      ],
    );
  }
}
