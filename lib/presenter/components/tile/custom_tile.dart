import 'package:flutter/material.dart';
import 'package:supercalipso/presenter/theme/dimensions.dart';

class CustomTile extends StatelessWidget {
  final String title;
  final Widget? leading;
  final String? subtitle;
  final Widget? trailing;
  final Function()? onTap;

  const CustomTile({
    required this.title,
    this.onTap,
    this.leading,
    this.subtitle,
    this.trailing,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: leading,
      title: Text(title),
      subtitle: subtitle != null ? Text(subtitle!, maxLines: 1) : null,
      trailing: trailing,
      onTap: onTap,
      shape: Shapes.lowRoundedBorder,
      contentPadding: EdgeInsets.zero,
    );
  }
}
