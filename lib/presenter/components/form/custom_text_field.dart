import 'package:supercalipso/presenter/components/form/style/form_field_properties.dart';
import 'package:flutter/material.dart';
import 'package:supercalipso/presenter/theme/colors.dart';

class CustomTextField extends StatelessWidget with FormFieldProperties {
  final TextEditingController controller;
  final String label;
  final EdgeInsets? padding;
  final TextInputType? keyboardType;
  final String? Function(String?)? validator;
  final Function(String)? onChanged;
  final bool isPassword;
  final Widget? trailing;
  final Widget? leading;
  final InputDecoration? customDecoration;
  final FocusNode? focusNode;
  final int? minLines;
  final int? maxLines;
  final bool enabled;
  final TextStyle? customTextStyle;

  CustomTextField({
    required this.controller,
    required this.label,
    this.onChanged,
    this.padding,
    this.keyboardType,
    this.validator,
    this.leading,
    this.trailing,
    this.isPassword = false,
    this.customDecoration,
    this.focusNode,
    this.minLines,
    this.maxLines,
    this.customTextStyle,
    this.enabled = true,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding ?? EdgeInsets.zero,
      child: TextFormField(
        focusNode: focusNode,
        validator: validator,
        onChanged: onChanged,
        keyboardType: keyboardType,
        controller: controller,
        obscureText: isPassword,
        style: Theme.of(context).textTheme.bodyText2?.copyWith(color: enabled ? AppColors.black : AppColors.grey),
        minLines: minLines,
        maxLines: maxLines,
        enabled: enabled,
        decoration: customDecoration ??
            decorationFactory
                .createInputDecoration(
                  label: label,
                  trailing: trailing,
                  leading: leading,
                )
                .copyWith(hintStyle: Theme.of(context).textTheme.bodyText1?.copyWith(color: AppColors.grey)),
      ),
    );
  }
}
