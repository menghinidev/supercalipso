import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:supercalipso/application/auth/auth_provider.dart';
import 'package:supercalipso/application/task/task_service.dart';
import 'package:supercalipso/data/model/task/builder/task_builder.dart';
import 'package:supercalipso/data/model/task/task.dart';
import 'package:supercalipso/data/model/user/user.dart';
import 'package:supercalipso/data/repository/auth_repository.dart';
import 'package:supercalipso/presenter/components/dialog/confirm_dialog.dart';
import 'package:supercalipso/presenter/pages/task/controller/task_page_memento.dart';
import 'package:supercalipso/presenter/pages/task/controller/task_page_state.dart';
import 'package:supercalipso/services/modals/dialog/dialog_service.dart';

final taskPageControllerProvider =
    StateNotifierProvider.family.autoDispose<TaskPageControllerNotifier, TaskPageState, Task?>((ref, task) {
  return TaskPageControllerNotifier(
    authRepo: ref.watch(authRepoProvider),
    taskService: ref.watch(teamTaskStateProvider.notifier),
    dialogService: ref.watch(dialogServiceProvider),
    initialTask: task,
  );
});

class TaskPageControllerNotifier extends StateNotifier<TaskPageState> {
  final Task? initialTask;
  final List<User>? assignedUsers;
  final AuthRepository authRepo;
  final TeamTaskController taskService;
  final DialogService dialogService;
  late TaskPageMementoStateOriginator originator;
  late TaskPageMementoStateCaretaker caretaker;

  TaskPageControllerNotifier({
    required this.authRepo,
    required this.taskService,
    required this.dialogService,
    this.initialTask,
    this.assignedUsers,
  }) : super(TaskPageState.create(initialTask, assignedUsers)) {
    originator = TaskPageMementoStateOriginator(state);
    caretaker = TaskPageMementoStateCaretaker(originator.saveToMemento());
    init();
  }

  Future init() async {
    if (initialTask == null) {
      state = EditingTaskPageState(builder: TaskBuilder());
      return Future.value();
    }
    if (initialTask?.assignedUserId == null) {
      state = ConsultingTaskPageState(task: initialTask!);
      return Future.value();
    }
    var users = await authRepo.getUserById(id: initialTask!.assignedUserId!);
    return users.ifSuccess((payload) => state = ConsultingTaskPageState(assignedUsers: [payload!], task: initialTask!));
  }

  editTaskTitle(String? title) {
    var actualState = state;
    if (actualState is EditingTaskPageState) {
      var newState = EditingTaskPageState(builder: actualState.builder.copyWith(title: title));
      __saveStep(newState);
    }
  }

  editTaskDeadline(DateTime? deadline) {
    var actualState = state;
    if (actualState is EditingTaskPageState) {
      var newState = EditingTaskPageState(builder: actualState.builder.copyWith(deadline: deadline));
      __saveStep(newState);
    }
  }

  editTaskAssignment(String? userId) {
    var actualState = state;
    if (actualState is EditingTaskPageState) {
      var newState = EditingTaskPageState(builder: actualState.builder.copyWith(assignedUserId: userId));
      __saveStep(newState);
    }
  }

  editIcon(String? iconName) {
    var actualState = state;
    if (actualState is EditingTaskPageState) {
      var newState = EditingTaskPageState(builder: actualState.builder.copyWith(iconName: iconName));
      __saveStep(newState);
    }
  }

  switchToEdit() {
    var actualState = state;
    if (actualState is ConsultingTaskPageState) {
      state = actualState.switchToEdit();
    }
  }

  Future submit() async {
    var actualState = state;
    if (actualState is EditingTaskPageState) {
      var isNew = initialTask == null;
      if (isNew) {
        return await dialogService.showConfirmDialog(
          dialogBuilder: (_) => const ConfirmDialog(
            title: 'Confirm',
            textBody: 'This task will be available inside your Team',
          ),
          onConfirmed: () => taskService.createTask(
            title: actualState.builder.title!,
            assignedUserId: actualState.builder.assignedUserId,
            deadline: actualState.builder.deadline,
            iconName: actualState.builder.iconName,
          ),
        );
      } else {
        return await dialogService.showConfirmDialog(
          dialogBuilder: (_) => const ConfirmDialog(
            title: 'Confirm',
            textBody: 'This task will be changed',
          ),
          onConfirmed: () => taskService.updateTask(
            taskId: initialTask!.id,
            assignedUserId: actualState.builder.assignedUserId,
            deadline: actualState.builder.deadline,
            iconName: actualState.builder.iconName,
            title: actualState.builder.title,
          ),
        );
      }
    }
  }

  Future delete() async {
    var id = state.on(defaultValue: () => null, onReading: (state) => state.task.id);
    if (id == null) return Future.value();
    var dialogResponse = await dialogService.showConfirmDialog(
      dialogBuilder: (_) => const ConfirmDialog(
        title: 'Are you sure',
        textBody: 'This task will be deleted',
      ),
    );
    if (dialogResponse.hasConfirmed) {
      return await taskService.deleteTask(taskId: id);
    }
    return Future.value();
  }

  discard() {
    var actualState = state;
    if (actualState is EditingTaskPageState) {
      state = ConsultingTaskPageState(task: initialTask!, assignedUsers: assignedUsers);
    }
  }

  undo() {
    var backState = caretaker.rollback();
    originator.restoreFromMemento(backState);
    state = backState.state;
  }

  __saveStep(TaskPageState newState) {
    var mementoState = TaskPageMementoState(newState);
    originator.changeState(mementoState.state);
    caretaker.saveMemento(mementoState);
    state = newState;
  }
}
