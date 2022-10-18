import 'package:flutter/material.dart';
import 'package:supercalipso/presenter/components/card/custom_card.dart';
import 'package:supercalipso/presenter/theme/dimensions.dart';

class CardSection extends StatelessWidget {
  final String title;
  final List<Widget> children;

  const CardSection({super.key, required this.title, required this.children});

  @override
  Widget build(BuildContext context) {
    return CustomCard(
      child: Padding(
        padding: Dimensions.allMPadding,
        child: Column(children: [
          Text(
            title,
            style: Theme.of(context).textTheme.titleLarge,
          ),
          ...children,
        ]),
      ),
    );
  }
}
