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
    return Padding(
      padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
      child: BottomSheet(
        onClosing: onClosing ?? () {},
        enableDrag: false,
        elevation: elevation ?? 20,
        backgroundColor: backgroundColor ?? Colors.white,
        constraints: constraints,
        builder: builder,
      ),
    );
  }
}
