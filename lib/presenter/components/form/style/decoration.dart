import 'package:supercalipso/presenter/theme/colors.dart';
import 'package:supercalipso/presenter/theme/dimensions.dart';
import 'package:flutter/material.dart';

class DecorationFactory {
  static DecorationFactory get instance => _singleton;

  static final _singleton = DecorationFactory._();

  DecorationFactory._();

  InputDecoration createInputDecoration({String? label, Widget? trailing, Widget? leading, Color? color}) {
    return InputDecoration(
      border: const OutlineInputBorder(borderSide: BorderSide(color: AppColors.green)),
      hintText: label,
      suffixIcon: trailing,
      prefixIcon: leading,
      alignLabelWithHint: true,
      isDense: true,
      contentPadding: const EdgeInsets.all(12.0),
    );
  }

  InputDecoration createSearchFieldDecoration({String? label, Widget? trailing, Widget? leading, Color? color}) {
    return InputDecoration(
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: color ?? Colors.white),
        borderRadius: Shapes.smallRadius,
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: color ?? Colors.black),
        borderRadius: BorderRadius.vertical(top: Shapes.smallRadius.topLeft),
      ),
      hintText: label,
      fillColor: color,
      filled: true,
      suffixIcon: trailing,
      prefixIcon: leading,
      alignLabelWithHint: true,
    );
  }
}
