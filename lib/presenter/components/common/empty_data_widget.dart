import 'package:flutter/material.dart';

class EmptyDataWidgetBuilder extends StatelessWidget {
  final bool Function() emptyCondition;
  final Widget Function(BuildContext) builder;
  final Widget Function(BuildContext)? placeholderBuilder;
  final bool applySliver;

  const EmptyDataWidgetBuilder({
    required this.emptyCondition,
    required this.builder,
    this.placeholderBuilder,
    this.applySliver = false,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (!emptyCondition()) return builder(context);
    if (placeholderBuilder != null) return placeholderBuilder!(context);
    if (applySliver) return SliverToBoxAdapter(child: Container());
    return Container();
  }
}
