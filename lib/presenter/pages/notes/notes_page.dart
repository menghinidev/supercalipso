import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:supercalipso/bloc/note/note_service.dart';
import 'package:supercalipso/presenter/components/scaffold/custom_app_bar.dart';
import 'package:supercalipso/presenter/components/scaffold/custom_scaffold.dart';

class NotesPage extends HookConsumerWidget {
  const NotesPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var teams = ref.watch(noteServiceProvider);
    return CustomScaffold(
      appBar: const FlatAppBar(title: 'Notes'),
      body: SingleChildScrollView(
        child: Column(),
      ),
    );
  }
}
