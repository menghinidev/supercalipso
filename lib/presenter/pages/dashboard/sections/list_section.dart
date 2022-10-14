import 'package:flutter/material.dart';
import 'package:supercalipso/presenter/components/common/empty_data_widget.dart';
import 'package:supercalipso/presenter/theme/dimensions.dart';

class BaseListSection<T> extends StatelessWidget {
  final String title;
  final List<T> items;
  final Widget Function(T) builder;

  const BaseListSection({
    super.key,
    required this.title,
    required this.items,
    required this.builder,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: Dimensions.smallSize),
          child: Text(
            title,
            style: Theme.of(context).textTheme.subtitle1?.copyWith(fontWeight: FontWeight.bold),
          ),
        ),
        EmptyDataWidgetBuilder(
            emptyCondition: () => items.isEmpty,
            placeholderBuilder: (_) => const Text('Empty section'),
            builder: (context) {
              return ListView.separated(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) => builder(items[index]),
                separatorBuilder: (context, index) => const Divider(),
                itemCount: items.length,
              );
            })
      ],
    );
  }
}
