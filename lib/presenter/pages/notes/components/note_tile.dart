import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:supercalipso/data/model/note/note.dart';
import 'package:supercalipso/presenter/components/card/custom_card.dart';
import 'package:supercalipso/presenter/pages/note/sections/editor.dart';
import 'package:supercalipso/presenter/theme/dimensions.dart';
import 'package:supercalipso/services/navigation/router_provider.dart';
import 'package:supercalipso/services/navigation/routes.dart';

class NoteTile extends HookConsumerWidget {
  final Note note;

  const NoteTile({super.key, required this.note});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return CustomCard(
      child: InkWell(
        onTap: () => ref.read(routerProvider).push(NotePageRoute.pagePath, extra: note),
        child: Padding(
          padding: Dimensions.allMPadding,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                note.title,
                style: Theme.of(context).textTheme.headlineSmall,
                softWrap: false,
                overflow: TextOverflow.fade,
              ),
              Flexible(
                child: AbsorbPointer(
                  child: Padding(
                    padding: const EdgeInsets.only(top: Dimensions.smallSize),
                    child: HtmlEditor(
                      key: ValueKey(note.description),
                      isReadOnly: true,
                      showToolBar: false,
                      initialValue: note.description,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
