import 'package:flutter/material.dart';
import 'package:supercalipso/plugin/utils.dart';
import 'package:supercalipso/presenter/components/picker/date_formfield_picker.dart';
import 'package:supercalipso/presenter/components/picker/time_formfield_picker.dart';
import 'package:supercalipso/presenter/theme/dimensions.dart';

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
