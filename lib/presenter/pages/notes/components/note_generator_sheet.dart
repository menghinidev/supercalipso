import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:supercalipso/bloc/note/note_service.dart';
import 'package:supercalipso/presenter/components/bottomsheet/custom_bottom_sheet.dart';
import 'package:supercalipso/presenter/components/button/primary_elevated.dart';
import 'package:supercalipso/presenter/components/button/primary_icon.dart';
import 'package:supercalipso/presenter/components/form/custom_text_field.dart';
import 'package:supercalipso/presenter/components/form/validators.dart';
import 'package:supercalipso/presenter/theme/dimensions.dart';

class NoteGeneratorBottomSheet extends HookConsumerWidget {
  final String teamId;

  const NoteGeneratorBottomSheet({super.key, required this.teamId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var titleController = useTextEditingController();
    var contentController = useTextEditingController();
    return CustomBottomSheet(
      builder: (context) => SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisSize: MainAxisSize.min,
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: PrimaryIconButton(
                onTap: () => Navigator.pop(context),
                icon: const Icon(Icons.arrow_back),
              ),
            ),
            Padding(
              padding: Dimensions.allMPadding,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  CustomTextField(
                    controller: titleController,
                    label: 'Title',
                    validator: (value) => FormValidators.nonEmptyValidator(value, context),
                  ),
                  CustomTextField(
                    padding: const EdgeInsets.only(top: Dimensions.smallSize),
                    controller: contentController,
                    label: 'Nota',
                    minLines: 5,
                    maxLines: 10,
                  ),
                ],
              ),
            ),
            Padding(
              padding: Dimensions.mHsBPadding,
              child: PrimaryElevatedButton(
                text: 'Create Note',
                onTap: () => ref
                    .read(noteServiceProvider)
                    .createNote(
                      teamId: teamId,
                      title: titleController.text,
                      content: contentController.text,
                    )
                    .then((value) => Navigator.pop(context)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
