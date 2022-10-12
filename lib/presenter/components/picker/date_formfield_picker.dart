import 'package:flutter/material.dart';
import 'package:supercalipso/plugin/utils.dart';
import 'package:supercalipso/presenter/components/form/custom_text_field.dart';
import 'package:supercalipso/presenter/components/form/validators.dart';
import 'package:supercalipso/presenter/theme/colors.dart';

class DayFormFieldPicker extends StatefulWidget {
  final String? label;
  final Date? initialValue;
  final Function(Date) onSelected;
  final DateInterval? validInterval;

  const DayFormFieldPicker({required this.onSelected, this.initialValue, this.label, this.validInterval, Key? key})
      : super(key: key);

  @override
  State<DayFormFieldPicker> createState() => _DayFormFieldPickerState();
}

class _DayFormFieldPickerState extends State<DayFormFieldPicker> {
  late TextEditingController controller;

  @override
  void initState() {
    super.initState();
    var initialValue = '';
    if (widget.initialValue != null) {
      initialValue = widget.initialValue!.format();
    }
    controller = TextEditingController(text: initialValue);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => openDatePicker(context),
      child: AbsorbPointer(
        child: CustomTextField(
          controller: controller,
          validator: (value) => FormValidators.nonEmptyValidator(value, context),
          label: widget.label ?? 'Select Date',
          trailing: const Icon(Icons.calendar_month),
        ),
      ),
    );
  }

  Future openDatePicker(BuildContext context) {
    var validInterval = widget.validInterval ??
        DateInterval(
          start: Date.fromDateTime(DateTime.fromMillisecondsSinceEpoch(0)),
          end: Date.today(),
        );
    var initialDate = validInterval.contains(Date.today()) ? Date.today() : validInterval.start;
    return showDatePicker(
      context: context,
      initialDate: initialDate.toDateTime(),
      firstDate: validInterval.start.toDateTime(),
      lastDate: validInterval.end.toDateTime(),
      builder: (context, child) => Theme(
        data: Theme.of(context).copyWith(
          textTheme: Theme.of(context).textTheme.copyWith(
                overline: Theme.of(context).textTheme.overline?.copyWith(decoration: TextDecoration.none),
                caption: Theme.of(context).textTheme.labelSmall?.copyWith(decoration: TextDecoration.none),
              ),
          colorScheme: Theme.of(context).colorScheme.copyWith(primary: AppColors.green),
        ),
        child: child!,
      ),
    ).then((value) {
      if (value == null) return;
      var date = Date.fromDateTime(value);
      controller.text = date.format();
      setState(() {});
      widget.onSelected(date);
    });
  }
}
