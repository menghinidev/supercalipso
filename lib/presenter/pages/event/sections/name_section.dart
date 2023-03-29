import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:supercalipso/plugin/utils/extensions/list_extensions.dart';
import 'package:supercalipso/presenter/components/form/custom_text_field.dart';
import 'package:supercalipso/presenter/components/form/validators.dart';
import 'package:supercalipso/presenter/pages/home/dashboard/sections/card_section.dart';
import 'package:supercalipso/presenter/pages/event/components/named_icon.dart';
import 'package:supercalipso/presenter/pages/event/controller/event_page_state.dart';
import 'package:supercalipso/presenter/theme/dimensions.dart';

class EventNameSection extends HookConsumerWidget with EventIconDataFactory {
  final EventPageState state;
  final Function(String?) onNameChanged;
  final Function(String) onIconNameChanged;

  EventNameSection({
    super.key,
    required this.state,
    required this.onNameChanged,
    required this.onIconNameChanged,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var nameController = useTextEditingController(
      text: state.on(
        defaultValue: () => '',
        onReading: (state) => state.event.name,
        onEditing: (state) => state.builder.name,
      ),
    );
    return CardSection(
      title: 'Choose Icon and Name',
      children: [
        Padding(
          padding: Dimensions.mVPadding,
          child: Wrap(
            spacing: Dimensions.mediumSize,
            runSpacing: Dimensions.smallSize,
            children: [
              ...EventIconDataFactory.availableIcons.map(
                (e) => NamedIcon(
                  icon: e,
                  onSelected: state.on(defaultValue: () => null, onEditing: (state) => onIconNameChanged),
                  isSelected: state.on(
                    defaultValue: () => false,
                    onEditing: (state) => state.builder.iconName == e.name,
                    onReading: (state) => state.event.iconName == e.name,
                  ),
                ),
              ),
            ],
          ),
        ),
        CustomTextField(
          controller: nameController,
          label: 'Event name',
          onChanged: onNameChanged,
          enabled: state.on(defaultValue: () => true, onReading: (_) => false),
          validator: (value) => FormValidators.nonEmptyValidator(value, context),
        ),
      ],
    );
  }
}

class EventIconDataFactory {
  static const availableIcons = [
    NamedIconData('calendar', Icons.calendar_month_sharp),
    NamedIconData('grill', Icons.outdoor_grill),
    NamedIconData('movie', Icons.movie),
    NamedIconData('drink', Icons.local_drink_rounded),
  ];

  static IconData? getIcon(String? name) => availableIcons.getWhere((element) => element.name == name)?.icon;
}
