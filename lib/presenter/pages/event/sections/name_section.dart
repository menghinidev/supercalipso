import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:supercalipso/plugin/utils/extensions/list_extensions.dart';
import 'package:supercalipso/presenter/components/card/custom_card.dart';
import 'package:supercalipso/presenter/components/form/basic_text_field.dart';
import 'package:supercalipso/presenter/components/form/custom_text_field.dart';
import 'package:supercalipso/presenter/components/form/validators.dart';
import 'package:supercalipso/presenter/pages/event/controller/event_page_controller.dart';
import 'package:supercalipso/presenter/pages/event/controller/event_page_state.dart';
import 'package:supercalipso/presenter/theme/colors.dart';
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
    return CustomCard(
      child: Padding(
        padding: Dimensions.allMPadding,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Choose Icon and Name',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            Padding(
              padding: Dimensions.mVPadding,
              child: Wrap(
                spacing: Dimensions.mediumSize,
                runSpacing: Dimensions.smallSize,
                children: [
                  ...EventIconDataFactory.availableIcons.map(
                    (e) => EventIcon(
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
        ),
      ),
    );
  }
}

class EventIcon extends StatelessWidget {
  final bool isSelected;
  final EventIconData icon;
  final Function(String)? onSelected;

  const EventIcon({super.key, required this.icon, this.onSelected, this.isSelected = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: Dimensions.allSPadding,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(color: isSelected ? AppColors.blue : Colors.transparent),
      ),
      child: GestureDetector(
        onTap: onSelected != null ? () => onSelected!(icon.name) : null,
        child: Icon(
          icon.icon,
          size: 36.0,
          color: isSelected ? AppColors.blue : AppColors.black,
        ),
      ),
    );
  }
}

class EventIconData {
  final String name;
  final IconData icon;

  const EventIconData(this.name, this.icon);
}

class EventIconDataFactory {
  static const availableIcons = [
    EventIconData('calendar', Icons.calendar_month_sharp),
    EventIconData('grill', Icons.outdoor_grill),
    EventIconData('movie', Icons.movie),
    EventIconData('drink', Icons.local_drink_rounded),
  ];

  static IconData? getIcon(String? name) => availableIcons.getWhere((element) => element.name == name)?.icon;
}
