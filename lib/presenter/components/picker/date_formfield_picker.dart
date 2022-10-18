import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:supercalipso/plugin/utils.dart';
import 'package:supercalipso/presenter/components/form/custom_text_field.dart';
import 'package:supercalipso/presenter/components/form/validators.dart';

class DateFormFieldPicker extends HookWidget {
  final String label;
  final Date? initialValue;
  final Function(Date) onSelected;
  final DateInterval? validInterval;
  final bool readOnly;

  const DateFormFieldPicker({
    required this.onSelected,
    this.initialValue,
    this.label = 'Select Date',
    this.readOnly = false,
    this.validInterval,
    super.key,
  });

  DateInterval get defaultInterval => DateInterval(
        start: Date.fromDateTime(DateTime.fromMillisecondsSinceEpoch(0)),
        end: Date.today().increase(const Duration(days: 365)) as Date,
      );

  @override
  Widget build(BuildContext context) {
    var controller = useTextEditingController(text: initialValue?.format());
    return GestureDetector(
      onTap: readOnly ? null : () => openDatePicker(context, controller),
      child: AbsorbPointer(
        child: CustomTextField(
          controller: controller,
          validator: (value) => FormValidators.nonEmptyValidator(value, context),
          label: label,
          enabled: !readOnly,
          trailing: const Icon(Icons.calendar_month),
        ),
      ),
    );
  }

  Future openDatePicker(BuildContext context, TextEditingController controller) {
    var validDates = validInterval ?? defaultInterval;
    var initialDate = validDates.contains(Date.today()) ? Date.today() : validDates.start;
    return showDatePicker(
      context: context,
      initialDate: initialDate.toDateTime(),
      firstDate: validDates.start.toDateTime(),
      lastDate: validDates.end.toDateTime(),
    ).then((value) {
      if (value == null) return;
      var date = Date.fromDateTime(value);
      controller.text = date.format();
      onSelected(date);
    });
  }
}
