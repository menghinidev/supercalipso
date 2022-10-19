import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:supercalipso/data/model/note/note.dart';
import 'package:supercalipso/presenter/components/button/primary_icon.dart';
import 'package:supercalipso/presenter/components/form/basic_text_field.dart';
import 'package:supercalipso/presenter/components/scaffold/custom_app_bar.dart';
import 'package:supercalipso/presenter/components/scaffold/custom_scaffold.dart';
import 'package:supercalipso/presenter/pages/note/controller/note_page_controller.dart';
import 'package:supercalipso/presenter/pages/note/controller/note_page_state.dart';
import 'package:supercalipso/presenter/theme/dimensions.dart';

class NotePage extends HookConsumerWidget {
  final Note note;

  const NotePage({super.key, required this.note});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var state = ref.watch(notePageControllerProvider(note));
    return CustomScaffold(
      appBar: FlatAppBar(
        title: note.title,
        showProfileAvatar: false,
        leading: const BackButton(),
        actions: [
          state.on(
            defaultValue: () => PrimaryIconButton(
              icon: const Icon(Icons.delete),
              onTap: () => getNotifier(ref).delete(),
            ),
            onEditing: (state) => PrimaryIconButton(
              icon: const Icon(Icons.save),
              onTap: () => getNotifier(ref).save(),
            ),
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: Dimensions.hPageInsets,
            child: Wrap(
              children: const [
                ActionChip(label: Text('Add Image')),
              ],
            ),
          ),
          const Divider(),
          Expanded(
            child: BasicTextField(
              label: 'Nota',
              onChanged: (nota) => getNotifier(ref).editContent(nota),
            ),
          )
        ],
      ),
    );
  }

  NotePageNotifier getNotifier(WidgetRef ref) => ref.read(notePageControllerProvider(note).notifier);
}
