import 'package:flutter/material.dart';

class EmptyDataWidget extends StatelessWidget {
  final bool emptyCondition;
  final Widget child;
  final Widget? emptyPlaceholder;
  final bool applySliver;

  const EmptyDataWidget({
    required this.emptyCondition,
    required this.child,
    this.emptyPlaceholder,
    this.applySliver = false,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (!emptyCondition) return child;
    if (emptyPlaceholder != null) return emptyPlaceholder!;
    if (applySliver) return SliverToBoxAdapter(child: Container());
    return Container();
  }
}
