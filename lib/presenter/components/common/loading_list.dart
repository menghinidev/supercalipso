import 'package:flutter/material.dart';

class LoadingList extends StatelessWidget {
  final bool isSliver;
  const LoadingList({super.key, this.isSliver = false});

  @override
  Widget build(BuildContext context) {
    if (isSliver) return const SliverToBoxAdapter(child: CircularProgressIndicator());
    return const Center(child: CircularProgressIndicator());
  }
}
