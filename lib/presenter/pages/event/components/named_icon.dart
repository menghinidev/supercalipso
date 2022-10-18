import 'package:flutter/material.dart';
import 'package:supercalipso/presenter/theme/colors.dart';
import 'package:supercalipso/presenter/theme/dimensions.dart';

class NamedIcon extends StatelessWidget {
  final bool isSelected;
  final NamedIconData icon;
  final Function(String)? onSelected;

  const NamedIcon({super.key, required this.icon, this.onSelected, this.isSelected = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: Dimensions.allSPadding,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(color: isSelected ? AppColors.blue : Colors.transparent),
      ),
      child: GestureDetector(
        onTap: onSelected != null ? () => onSelected!(icon.name) : null,
        child: Icon(
          icon.icon,
          size: 36.0,
          color: isSelected ? AppColors.blue : AppColors.black,
        ),
      ),
    );
  }
}

class NamedIconData {
  final String name;
  final IconData icon;

  const NamedIconData(this.name, this.icon);
}
