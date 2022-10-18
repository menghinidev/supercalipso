import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:supercalipso/plugin/utils/extensions/list_extensions.dart';
import 'package:supercalipso/presenter/components/form/custom_text_field.dart';
import 'package:supercalipso/presenter/components/form/validators.dart';
import 'package:supercalipso/presenter/pages/dashboard/sections/card_section.dart';
import 'package:supercalipso/presenter/pages/event/components/named_icon.dart';
import 'package:supercalipso/presenter/pages/event/sections/name_section.dart';
import 'package:supercalipso/presenter/pages/task/controller/task_page_state.dart';
import 'package:supercalipso/presenter/theme/dimensions.dart';

class TaskNameSection extends HookConsumerWidget with EventIconDataFactory {
  final TaskPageState state;
  final Function(String?) onNameChanged;
  final Function(String) onIconNameChanged;

  TaskNameSection({
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
        onReading: (state) => state.task.title,
        onEditing: (state) => state.builder.title,
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
              ...TaskIconDataFactory.availableIcons.map(
                (e) => NamedIcon(
                  icon: e,
                  onSelected: state.on(defaultValue: () => null, onEditing: (state) => onIconNameChanged),
                  isSelected: state.on(
                    defaultValue: () => false,
                    onEditing: (state) => state.builder.iconName == e.name,
                    onReading: (state) => state.task.iconName == e.name,
                  ),
                ),
              ),
            ],
          ),
        ),
        CustomTextField(
          controller: nameController,
          label: 'Task name',
          onChanged: onNameChanged,
          enabled: state.on(defaultValue: () => true, onReading: (_) => false),
          validator: (value) => FormValidators.nonEmptyValidator(value, context),
        ),
      ],
    );
  }
}

class TaskIconDataFactory {
  static const availableIcons = [
    NamedIconData('calendar', Icons.calendar_month_sharp),
    NamedIconData('grill', Icons.outdoor_grill),
    NamedIconData('movie', Icons.movie),
    NamedIconData('drink', Icons.local_drink_rounded),
  ];

  static IconData? getIcon(String? name) => availableIcons.getWhere((element) => element.name == name)?.icon;
}
