import 'package:supercalipso/presenter/theme/dimensions.dart';
import 'package:flutter/material.dart';

class CustomDialog extends StatelessWidget {
  final String title;
  final List<Widget>? children;

  const CustomDialog({required this.title, this.children, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SimpleDialog(
      insetPadding: Dimensions.pageInsets,
      title: Text(title, textAlign: TextAlign.center),
      titleTextStyle: Theme.of(context).textTheme.headline6,
      alignment: Alignment.center,
      titlePadding: const EdgeInsets.all(Dimensions.largeSize).copyWith(bottom: 0),
      contentPadding: const EdgeInsets.symmetric(horizontal: Dimensions.largeSize).copyWith(
        bottom: Dimensions.largeSize,
      ),
      children: children,
    );
  }
}
