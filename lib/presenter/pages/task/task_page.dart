import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:supercalipso/bloc/task/task_provider.dart';
import 'package:supercalipso/data/model/task/builder/task_builder.dart';
import 'package:supercalipso/data/model/task/task.dart';
import 'package:supercalipso/presenter/components/button/primary_elevated.dart';
import 'package:supercalipso/presenter/components/button/primary_icon.dart';
import 'package:supercalipso/presenter/components/button/primary_text.dart';
import 'package:supercalipso/presenter/components/form/keyboard_focus_wrapper.dart';
import 'package:supercalipso/presenter/components/scaffold/custom_app_bar.dart';
import 'package:supercalipso/presenter/components/scaffold/custom_scaffold.dart';
import 'package:supercalipso/presenter/pages/task/controller/task_page_controller.dart';
import 'package:supercalipso/presenter/pages/task/controller/task_page_state.dart';
import 'package:supercalipso/presenter/pages/task/section/assignment_section.dart';
import 'package:supercalipso/presenter/pages/task/section/deadline_section.dart';
import 'package:supercalipso/presenter/pages/task/section/name_section.dart';
import 'package:supercalipso/presenter/theme/dimensions.dart';

class TaskPage extends HookConsumerWidget {
  final Task? task;

  const TaskPage({super.key, this.task});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var state = ref.watch(taskPageControllerProvider(task));
    return KeyboardFocusWrapper(
      child: CustomScaffold(
        appBar: FlatAppBar(
          showProfileAvatar: false,
          leading: const BackButton(),
          actions: [
            state.on(
              defaultValue: () => Container(),
              onReading: (state) => PrimaryIconButton(
                icon: const Icon(Icons.edit),
                onTap: () => getNotifier(ref).switchToEdit(),
              ),
            ),
          ],
        ),
        resizeOnKeyboard: false,
        body: Padding(
          padding: Dimensions.pageInsets,
          child: Column(
            children: [
              TaskNameSection(
                state: state,
                onNameChanged: (name) => getNotifier(ref).editTaskTitle(name),
                onIconNameChanged: (icon) => getNotifier(ref).editIcon(icon),
              ),
              Padding(
                padding: const EdgeInsets.only(top: Dimensions.pageInsetsSize),
                child: TaskDeadlineSection(
                  state: state,
                  onDeadlineChanged: (deadline) => getNotifier(ref).editTaskDeadline(deadline),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: Dimensions.pageInsetsSize),
                child: TaskAssignmentSection(
                  state: state,
                  onAssignedUser: (id) => getNotifier(ref).editTaskAssignment(id),
                ),
              ),
              Expanded(
                child: state.on(
                  defaultValue: () => Container(),
                  onEditing: (state) => Align(
                    alignment: Alignment.bottomCenter,
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Expanded(
                          child: PrimaryTextButton(
                            text: 'Discard Changes',
                            onTap: () => getNotifier(ref).discard(),
                          ),
                        ),
                        Expanded(
                          child: PrimaryElevatedButton(
                            text: 'Save Task',
                            onTap: state.builder.canBuild
                                ? () => getNotifier(ref).submit().then((value) => Navigator.maybePop(context))
                                : null,
                          ),
                        ),
                      ],
                    ),
                  ),
                  onReading: (state) => Align(
                    alignment: Alignment.bottomRight,
                    child: PrimaryElevatedButton(
                      text: 'Delete',
                      color: Colors.red,
                      onTap: () => ref
                          .read(taskRepoProvider)
                          .deleteTask(taskId: state.task.id)
                          .then((value) => Navigator.maybePop(context)),
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

  TaskPageControllerNotifier getNotifier(WidgetRef ref) => ref.read(taskPageControllerProvider(task).notifier);
}
