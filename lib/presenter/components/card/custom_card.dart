import 'package:flutter/material.dart';
import 'package:supercalipso/presenter/theme/dimensions.dart';

class CustomCard extends StatelessWidget {
  final Widget child;
  final Color color;

  const CustomCard({required this.child, this.color = Colors.white, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: Dimensions.lowElevation,
      shape: Shapes.lowRounded.copyWith(side: BorderSide(color: color)),
      margin: EdgeInsets.zero,
      color: color,
      shadowColor: color,
      child: child,
    );
  }
}
