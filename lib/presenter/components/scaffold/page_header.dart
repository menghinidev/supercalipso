import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:supercalipso/presenter/theme/colors.dart';
import 'package:supercalipso/presenter/theme/dimensions.dart';

class PageHeader extends StatelessWidget {
  final BoxConstraints? constraints;
  final Color color;
  final String text;

  const PageHeader({
    super.key,
    required this.text,
    this.constraints,
    this.color = Colors.blue,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: constraints ?? const BoxConstraints(maxHeight: 200),
      padding: Dimensions.allMPadding,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          end: Alignment.topRight,
          begin: Alignment.bottomLeft,
          colors: [color.withOpacity(0.3), color.withOpacity(0.6), color.withOpacity(0.9)],
        ),
      ),
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            GestureDetector(
              onTap: () => Navigator.maybePop(context),
              child: const BackButtonIcon(),
            ),
            Text(
              text,
              style: Theme.of(context).textTheme.titleLarge,
            ),
          ],
        ),
      ),
    );
  }
}
