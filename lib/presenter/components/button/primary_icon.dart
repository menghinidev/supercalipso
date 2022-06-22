import 'package:flutter/material.dart';
import 'package:supercalipso/presenter/theme/dimensions.dart';

class PrimaryIconButton extends StatelessWidget {
  final Widget icon;
  final Function()? onTap;

  const PrimaryIconButton({required this.icon, this.onTap, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onTap,
      icon: icon,
      padding: const EdgeInsets.all(Dimensions.smallSize),
    );
  }
}
