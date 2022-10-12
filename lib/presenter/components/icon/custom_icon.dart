import 'package:flutter/material.dart';
import 'package:supercalipso/presenter/theme/colors.dart';

class CustomIcon extends StatelessWidget {
  final IconData icon;
  final Color? color;
  final double? size;
  final int? badge;

  const CustomIcon({required this.icon, this.color, this.size, this.badge, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var iconWidget = Icon(icon, size: size, color: color);
    if (badge != null && badge != 0) {
      return Stack(
        fit: StackFit.loose,
        clipBehavior: Clip.none,
        children: [
          iconWidget,
          Positioned(
            top: 0,
            right: 0,
            height: 8,
            width: 8,
            child: Container(
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: AppColors.green,
              ),
            ),
          ),
        ],
      );
    }
    return iconWidget;
  }
}
