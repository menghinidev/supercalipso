import 'package:flutter/material.dart';
import 'package:supercalipso/presenter/theme/colors.dart';
import 'package:supercalipso/presenter/theme/dimensions.dart';

class CustomCard extends StatelessWidget {
  final Widget child;
  final Color color;
  final double? elevation;
  final Color? shadowColor;

  const CustomCard({required this.child, this.color = AppColors.white, this.elevation, this.shadowColor, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: elevation ?? Dimensions.lowElevation,
      shape: Shapes.lowRoundedBorder.copyWith(side: BorderSide(color: color)),
      margin: EdgeInsets.zero,
      color: color,
      clipBehavior: Clip.hardEdge,
      borderOnForeground: false,
      shadowColor: shadowColor ?? color,
      child: child,
    );
  }
}
