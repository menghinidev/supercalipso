import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:supercalipso/bloc/note/note_provider.dart';
import 'package:supercalipso/bloc/note/note_service.dart';
import 'package:supercalipso/bloc/utils.dart';
import 'package:supercalipso/data/model/note/note.dart';
import 'package:supercalipso/presenter/components/scaffold/custom_app_bar.dart';
import 'package:supercalipso/presenter/components/scaffold/custom_scaffold.dart';
import 'package:supercalipso/presenter/pages/dashboard/sections/list_section.dart';
import 'package:supercalipso/presenter/pages/notes/components/note_generator_sheet.dart';
import 'package:supercalipso/presenter/pages/notes/components/note_tile.dart';
import 'package:supercalipso/presenter/theme/colors.dart';
import 'package:supercalipso/presenter/theme/dimensions.dart';
import 'package:supercalipso/services/navigation/router_provider.dart';
import 'package:supercalipso/services/navigation/routes.dart';

class NotesPage extends HookConsumerWidget {
  const NotesPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var notes = ref.watch(notesProvider);
    return CustomScaffold(
      appBar: const FlatAppBar(title: 'Notes'),
      fab: const NotesPageFAB(),
      body: RefreshIndicator(
        onRefresh: () => ref.read(noteServiceProvider).askTeamNotes(),
        child: CustomScrollView(
          physics: const BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
          slivers: [
            notes.onValue(
              loading: () => SliverToBoxAdapter(child: Container()),
              builder: (data) => data.isEmpty
                  ? SliverFillRemaining(
                      child: Center(
                        child: Text(
                          'Empty Notepad',
                          style: Theme.of(context).textTheme.titleLarge,
                        ),
                      ),
                    )
                  : SliverPadding(
                      padding: Dimensions.pageInsetsWithTop,
                      sliver: SliverToBoxAdapter(
                        child: BaseListSection<Note>(
                          items: data,
                          builder: (note) => NoteTile(note: note),
                        ),
                      ),
                    ),
            ),
          ],
        ),
      ),
    );
  }
}

class NotesPageFAB extends HookConsumerWidget {
  const NotesPageFAB({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return FloatingActionButton(
      backgroundColor: AppColors.greyDarker,
      onPressed: () => ref.read(routerProvider).push(NotePageRoute.pagePath),
      child: const Icon(Icons.add),
    );
  }
}
