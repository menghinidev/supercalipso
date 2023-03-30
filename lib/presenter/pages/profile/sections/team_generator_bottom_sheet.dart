import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:supercalipso/application/team/team_service.dart';
import 'package:supercalipso/presenter/components/bottomsheet/custom_bottom_sheet.dart';
import 'package:supercalipso/presenter/components/button/primary_elevated.dart';
import 'package:supercalipso/presenter/components/form/custom_text_field.dart';
import 'package:supercalipso/presenter/theme/dimensions.dart';

class TeamGeneratorBottomSheet extends HookConsumerWidget {
  const TeamGeneratorBottomSheet({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var nameController = useTextEditingController();
    return CustomBottomSheet(
      builder: (context) => Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.min,
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: IconButton(
              onPressed: () => Navigator.pop(context),
              icon: const Icon(Icons.arrow_back),
            ),
          ),
          Padding(
            padding: Dimensions.mHsTPadding.copyWith(top: 0),
            child: CustomTextField(controller: nameController, label: 'Name'),
          ),
          Padding(
            padding: Dimensions.allMPadding,
            child: PrimaryElevatedButton(
              text: 'Create',
              onTap: () {
                Navigator.pop(context);
                ref.read(teamSessionStateProvider.notifier).createTeam(name: nameController.text);
              },
            ),
          ),
        ],
      ),
    );
  }
}
