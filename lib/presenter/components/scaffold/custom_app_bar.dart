import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget with PreferredSizeWidget {
  final String? title;
  final List<Widget> actions;
  final bool enableLeading;

  const CustomAppBar({
    this.title,
    this.actions = const <Widget>[],
    this.enableLeading = true,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(title ?? ''),
      actions: actions,
      leading: enableLeading ? null : Container(),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
