import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:supercalipso/bloc/note/note_provider.dart';
import 'package:supercalipso/bloc/utils.dart';
import 'package:supercalipso/presenter/components/common/empty_data_widget.dart';
import 'package:supercalipso/presenter/pages/dashboard/components/note_tile.dart';
import 'package:supercalipso/presenter/pages/dashboard/sections/card_section.dart';

class NotesSection extends HookConsumerWidget {
  const NotesSection({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var notesChanges = ref.watch(pinnedNotesChangesProvider('1'));
    return notesChanges.onValue(
      builder: (data) => CardSection(
        title: 'Favourite notes',
        body: EmptyDataWidgetBuilder(
          emptyCondition: () => data.isEmpty,
          placeholderBuilder: (context) => Text(
            'Non hai nessuna nota',
            style: Theme.of(context).textTheme.caption,
          ),
          builder: (context) => ListView.separated(
            itemCount: data.length,
            shrinkWrap: true,
            padding: EdgeInsets.zero,
            separatorBuilder: (context, index) => const Divider(),
            itemBuilder: (context, index) => NoteTile(note: data[index]),
          ),
        ),
      ),
    );
  }
}

class PinnedNotesSection extends HookConsumerWidget {
  const PinnedNotesSection({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var notesChanges = ref.watch(pinnedNotesChangesProvider('1'));
    return notesChanges.onValue(
      builder: (data) => CardSection(
        title: 'Favourite notes',
        body: EmptyDataWidgetBuilder(
          emptyCondition: () => data.isEmpty,
          placeholderBuilder: (context) => Text(
            'Non hai nessuna nota',
            style: Theme.of(context).textTheme.caption,
          ),
          builder: (context) => ListView.separated(
            itemCount: data.length,
            shrinkWrap: true,
            padding: EdgeInsets.zero,
            separatorBuilder: (context, index) => const Divider(),
            itemBuilder: (context, index) => NoteTile(note: data[index]),
          ),
        ),
      ),
    );
  }
}
