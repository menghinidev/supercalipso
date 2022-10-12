import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:supercalipso/bloc/note/note_provider.dart';
import 'package:supercalipso/data/model/note/note.dart';
import 'package:supercalipso/presenter/components/button/simple_icon.dart';
import 'package:supercalipso/presenter/theme/colors.dart';
import 'package:supercalipso/presenter/theme/dimensions.dart';

class NoteTile extends HookConsumerWidget {
  final Note note;

  const NoteTile({super.key, required this.note});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      constraints: const BoxConstraints(maxHeight: 200),
      padding: Dimensions.mHsBPadding,
      decoration: BoxDecoration(
        borderRadius: Shapes.containerRadius,
        color: AppColors.lightBlueBackground,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: Text(
                  note.title,
                  style: Theme.of(context).textTheme.titleSmall,
                ),
              ),
              SimpleIconButton(
                onTap: () => ref.read(noteRepoProvider).deleteNote(noteId: note.noteId),
                icon: const Icon(Icons.delete),
              ),
            ],
          ),
          Text(
            note.description ?? 'No',
            softWrap: true,
            maxLines: 3,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}
