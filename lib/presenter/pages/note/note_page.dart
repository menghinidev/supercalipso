import 'package:flutter/material.dart';
import 'package:flutter_quill/flutter_quill.dart' as quill;
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:supercalipso/data/model/note/note.dart';
import 'package:supercalipso/presenter/components/button/primary_icon.dart';
import 'package:supercalipso/presenter/components/form/basic_text_field.dart';
import 'package:supercalipso/presenter/components/form/keyboard_focus_wrapper.dart';
import 'package:supercalipso/presenter/components/scaffold/custom_app_bar.dart';
import 'package:supercalipso/presenter/components/scaffold/custom_scaffold.dart';
import 'package:supercalipso/presenter/pages/note/controller/note_page_controller.dart';
import 'package:supercalipso/presenter/pages/note/controller/note_page_state.dart';
import 'package:supercalipso/presenter/pages/note/sections/editor.dart';
import 'package:supercalipso/presenter/theme/dimensions.dart';

class NotePage extends HookConsumerWidget {
  final Note? note;

  const NotePage({super.key, this.note});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var state = ref.watch(notePageControllerProvider(note));
    return KeyboardFocusWrapper(
      child: CustomScaffold(
        appBar: FlatAppBar(
          title: state.on(
            defaultValue: () => null,
            onEditing: (state) => state.title,
            onReading: (state) => state.note.title,
          ),
          showProfileAvatar: false,
          leading: const BackButton(),
          actions: [
            state.on(
              defaultValue: () => Container(),
              onEditing: (state) => PrimaryIconButton(
                icon: const Icon(Icons.save),
                onTap: state.on(
                  defaultValue: () => () => print('ciao'),
                  onReading: (state) => () => getNotifier(ref).save(),
                  onEditing: (state) => state.title == null ? null : () => getNotifier(ref).save(),
                ),
              ),
              onReading: (state) => PrimaryIconButton(
                icon: const Icon(Icons.edit),
                onTap: () => getNotifier(ref).switchToEdit(),
              ),
            ),
            PrimaryIconButton(
              icon: const Icon(Icons.delete),
              onTap: () => getNotifier(ref).delete(),
            ),
          ],
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: Dimensions.pageInsetsWithTop,
              child: BasicTextField(
                label: 'Title',
                onChanged: (title) => getNotifier(ref).editTitle(title),
              ),
            ),
            Expanded(
              child: Padding(
                padding: Dimensions.pageInsets,
                child: HtmlEditor(
                  placeholder: 'Nota',
                  initialValue: state.on(
                    defaultValue: () => null,
                    onEditing: (state) => state.content,
                    onReading: (state) => state.note.description,
                  ),
                  onContentChanged: (value) => getNotifier(ref).editContent(value),
                  isReadOnly: state.on(defaultValue: () => false, onReading: (state) => true),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  NotePageNotifier getNotifier(WidgetRef ref) => ref.read(notePageControllerProvider(note).notifier);
}
