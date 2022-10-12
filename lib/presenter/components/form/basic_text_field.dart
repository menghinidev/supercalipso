import 'package:flutter/material.dart';
import 'package:supercalipso/presenter/components/form/custom_text_field.dart';

class BasicTextField extends StatefulWidget {
  final String label;
  final String? hint;
  final Function(String?) onChanged;

  const BasicTextField({required this.label, required this.onChanged, this.hint, Key? key}) : super(key: key);

  @override
  State<BasicTextField> createState() => _BasicTextFieldState();
}

class _BasicTextFieldState extends State<BasicTextField> {
  late TextEditingController controller;

  @override
  void initState() {
    super.initState();
    controller = TextEditingController();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CustomTextField(
      controller: controller,
      label: widget.label,
      onChanged: widget.onChanged,
    );
  }
}
