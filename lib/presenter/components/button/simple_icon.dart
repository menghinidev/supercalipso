import 'package:flutter/material.dart';
import 'package:supercalipso/presenter/theme/dimensions.dart';

class SimpleIconButton extends StatelessWidget {
  final Function()? onTap;
  final Widget icon;
  final Color? color;
  final double? padding;

  const SimpleIconButton({required this.icon, this.color, this.onTap, this.padding, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipOval(
      child: Material(
        color: color ?? Colors.transparent,
        child: Padding(
          padding: EdgeInsets.all(padding ?? Dimensions.smallSize),
          child: InkWell(
            onTap: onTap,
            child: icon,
          ),
        ),
      ),
    );
  }
}
