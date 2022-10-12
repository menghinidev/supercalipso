import 'package:flutter/material.dart';
import 'package:supercalipso/presenter/theme/dimensions.dart';
import 'package:supercalipso/presenter/components/card/custom_card.dart';

class CardSection extends StatelessWidget {
  final String title;
  final Widget body;

  const CardSection({super.key, required this.title, required this.body});

  @override
  Widget build(BuildContext context) {
    return CustomCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: Dimensions.mHsTPadding,
            child: Text(
              title,
              style: Theme.of(context).textTheme.titleLarge,
            ),
          ),
          Container(
            margin: Dimensions.mHsBPadding.copyWith(top: Dimensions.smallSize),
            child: body,
          ),
        ],
      ),
    );
  }
}
