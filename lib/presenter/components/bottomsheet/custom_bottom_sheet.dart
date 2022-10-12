import 'package:flutter/material.dart';

class CustomBottomSheet extends StatelessWidget {
  final Widget Function(BuildContext context) builder;
  final Function()? onClosing;
  final Color? backgroundColor;
  final double? elevation;
  final BoxConstraints? constraints;

  const CustomBottomSheet({
    super.key,
    required this.builder,
    this.onClosing,
    this.backgroundColor,
    this.elevation,
    this.constraints,
  });

  @override
  Widget build(BuildContext context) {
    return BottomSheet(
      onClosing: onClosing ?? () => print('Closing'),
      enableDrag: false,
      elevation: elevation ?? 20,
      backgroundColor: backgroundColor ?? Colors.white,
      constraints: constraints,
      builder: builder,
    );
  }
}
