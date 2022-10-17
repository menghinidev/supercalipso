import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:supercalipso/plugin/utils.dart';
import 'package:supercalipso/presenter/components/form/custom_text_field.dart';
import 'package:supercalipso/presenter/components/form/validators.dart';

class TimeFormFieldPicker extends HookWidget {
  final String label;
  final Time? initialValue;
  final Function(Time) onSelected;

  const TimeFormFieldPicker({
    required this.onSelected,
    this.initialValue,
    this.label = 'Select Time',
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var controller = useTextEditingController(text: initialValue?.format());
    return GestureDetector(
      onTap: () => openTimePicker(context, controller),
      child: AbsorbPointer(
        child: CustomTextField(
          controller: controller,
          validator: (value) => FormValidators.nonEmptyValidator(value, context),
          label: label,
          trailing: const Icon(Icons.access_time_rounded),
        ),
      ),
    );
  }

  Future openTimePicker(BuildContext context, TextEditingController textController) {
    var initialDateTime = initialValue?.toDateTime() ?? Time.now().toDateTime();
    return showTimePicker(
      context: context,
      initialTime: TimeOfDay.fromDateTime(initialDateTime),
    ).then((value) {
      if (value == null) return Future.value();
      var time = Time(hour: value.hour, minute: value.minute);
      textController.text = time.format();
      onSelected(time);
    });
  }
}
