import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:supercalipso/presenter/components/form/style/decoration.dart';
import 'package:supercalipso/presenter/theme/colors.dart';
import 'package:supercalipso/presenter/theme/dimensions.dart';

class CustomDropdownTextField<T> extends StatelessWidget {
  final String label;
  final String? hint;
  final Function(T?) onSelected;
  final List<T> items;
  final T? currentValue;
  final DropdownMenuItem<T> Function(T value) optionsBuilder;

  const CustomDropdownTextField({
    required this.label,
    required this.onSelected,
    required this.items,
    required this.optionsBuilder,
    this.hint,
    this.currentValue,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: Dimensions.smallSize),
          child: Text(
            label,
            style: Theme.of(context).textTheme.bodyText1?.copyWith(color: AppColors.coolGrey11),
          ),
        ),
        DropdownButtonFormField2<T>(
          items: items.map((e) => optionsBuilder(e)).toList(),
          onChanged: onSelected,
          value: currentValue,
          decoration: DecorationFactory.instance.createInputDecoration(),
          hint: Text(hint ?? '', style: Theme.of(context).textTheme.bodyText1?.copyWith(color: AppColors.coolGrey10)),
          style: Theme.of(context).textTheme.bodyText1,
          offset: const Offset(0, -5),
          dropdownMaxHeight: 300,
          isExpanded: true,
          dropdownDecoration: BoxDecoration(
            borderRadius: Shapes.lowRoundedBorder.borderRadius,
            border: Border.all(
              color: AppColors.coolGrey4,
              width: 0.5,
            ),
          ),
        ),
      ],
    );
  }
}
