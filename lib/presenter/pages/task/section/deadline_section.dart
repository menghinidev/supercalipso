import 'package:flutter/material.dart';
import 'package:supercalipso/plugin/utils.dart';
import 'package:supercalipso/presenter/components/picker/date_formfield_picker.dart';
import 'package:supercalipso/presenter/pages/home/dashboard/sections/card_section.dart';
import 'package:supercalipso/presenter/pages/task/controller/task_page_state.dart';
import 'package:supercalipso/presenter/theme/dimensions.dart';

class TaskDeadlineSection extends StatelessWidget {
  final TaskPageState state;
  final Function(DateTime? deadline) onDeadlineChanged;

  const TaskDeadlineSection({
    super.key,
    required this.state,
    required this.onDeadlineChanged,
  });

  @override
  Widget build(BuildContext context) {
    return CardSection(
      title: 'Set Deadline',
      children: [
        Padding(
          padding: const EdgeInsets.only(top: Dimensions.mediumSize),
          child: DateFormFieldPicker(
            readOnly: state.on(defaultValue: () => false, onReading: (state) => true),
            onSelected: (date) => onDeadlineChanged(date.toDateTime()),
            validInterval: DateInterval(start: Date.today(), end: Date.today().nextYear()),
            initialValue: state.on(
              defaultValue: () => null,
              onReading: (state) => state.task.deadline == null ? null : Date.fromDateTime(state.task.deadline!),
              onEditing: (state) => state.builder.deadline == null ? null : Date.fromDateTime(state.builder.deadline!),
            ),
          ),
        ),
      ],
    );
  }
}
