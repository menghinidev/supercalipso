import 'package:flutter/material.dart';

class FormValidators {
  static String? nonEmptyValidator(String? value, BuildContext context) {
    if (value == null || value.isEmpty) return 'Can not be empty';
    return null;
  }
}
