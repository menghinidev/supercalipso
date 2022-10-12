import 'package:flutter/material.dart';
import 'package:supercalipso/presenter/theme/colors.dart';
import 'package:supercalipso/presenter/theme/dimensions.dart';

class TextFieldLabel extends StatelessWidget {
  final String label;

  const TextFieldLabel({required this.label, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: Dimensions.smallSize),
      child: Text(
        label,
        style: Theme.of(context).textTheme.bodyText1?.copyWith(color: AppColors.coolGrey10),
      ),
    );
  }
}
