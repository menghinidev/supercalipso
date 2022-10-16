import 'package:flutter/material.dart';
import 'package:supercalipso/presenter/components/card/custom_card.dart';
import 'package:supercalipso/presenter/theme/colors.dart';
import 'package:supercalipso/presenter/theme/dimensions.dart';

class BaseTile extends StatelessWidget {
  final String title;
  final Widget? leading;
  final String? subtitle;
  final Widget? trailing;
  final Function()? onTap;

  const BaseTile({
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
      subtitle: subtitle != null ? Text(subtitle!) : null,
      onTap: onTap,
      shape: Shapes.lowRoundedBorder,
      contentPadding: EdgeInsets.zero,
    );
  }
}

class CustomTile extends StatelessWidget {
  final String title;
  final Widget? subtitle;
  final Widget? leading;
  final Widget? trailing;
  final Function()? onTap;

  const CustomTile({
    super.key,
    required this.title,
    this.subtitle,
    this.leading,
    this.trailing,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: CustomCard(
        color: AppColors.white,
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxHeight: 75),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              if (leading != null)
                Padding(
                  padding: Dimensions.mHsVPadding,
                  child: CustomTileLeading(leading: leading!),
                ),
              Expanded(
                child: Container(
                  alignment: Alignment.centerLeft,
                  padding: Dimensions.mVPadding,
                  child: CustomTileBody(title: title, subtitle: subtitle),
                ),
              ),
              if (trailing != null) trailing!,
            ],
          ),
        ),
      ),
    );
  }
}

class CustomTileBody extends StatelessWidget {
  final String title;
  final Widget? subtitle;

  const CustomTileBody({super.key, required this.title, this.subtitle});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: subtitle != null ? MainAxisAlignment.spaceEvenly : MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(title, style: Theme.of(context).textTheme.titleMedium),
        if (subtitle != null)
          Padding(
            padding: const EdgeInsets.only(top: Dimensions.tinySize),
            child: subtitle!,
          ),
      ],
    );
  }
}

class CustomTileLeading extends StatelessWidget {
  final Widget leading;

  const CustomTileLeading({super.key, required this.leading});

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundColor: Colors.transparent,
      child: leading,
    );
  }
}

class ActionTileTrailing extends StatelessWidget {
  final Color color;
  final Widget child;
  final Function() onTap;

  const ActionTileTrailing({
    super.key,
    required this.color,
    required this.child,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: Dimensions.allSPadding,
      decoration: BoxDecoration(color: color, border: Border.all(color: color)),
      clipBehavior: Clip.hardEdge,
      child: child,
    );
  }
}
