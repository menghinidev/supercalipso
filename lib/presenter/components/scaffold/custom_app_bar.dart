import 'package:flutter/material.dart';
import 'package:supercalipso/presenter/theme/colors.dart';
import 'package:supercalipso/presenter/theme/dimensions.dart';

class CustomAppBar extends StatelessWidget with PreferredSizeWidget {
  final String? title;
  final List<Widget> actions;
  final Widget? leading;
  final bool implyLeading;
  final double borderHeight = 1;

  const CustomAppBar({
    this.title,
    this.actions = const <Widget>[],
    this.implyLeading = true,
    this.leading,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(title ?? ''),
      actions: actions
          .map<Widget>((e) => actions.last == e
              ? Padding(
                  padding: const EdgeInsets.only(right: Dimensions.mediumSize),
                  child: e,
                )
              : e)
          .toList(),
      leading: implyLeading ? null : leading ?? Container(),
      centerTitle: true,
      bottom: PreferredSize(
        preferredSize: Size.fromHeight(borderHeight),
        child: Container(
          color: AppColors.lightBlueBackground,
          height: borderHeight,
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
