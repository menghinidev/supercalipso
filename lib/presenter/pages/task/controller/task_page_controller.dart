import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:supercalipso/data/model/task/builder/task_builder.dart';
import 'package:supercalipso/data/model/task/task.dart';
import 'package:supercalipso/data/model/user/user.dart';
import 'package:supercalipso/data/repository/auth_repository.dart';
import 'package:supercalipso/presenter/pages/task/controller/task_page_memento.dart';
import 'package:supercalipso/presenter/pages/task/controller/task_page_state.dart';

class TaskPageControllerNotifier extends StateNotifier<TaskPageState> {
  final Task? initialTask;
  final List<User>? assignedUsers;
  final AuthRepository authRepo;
  late TaskPageMementoStateOriginator originator;
  late TaskPageMementoStateCaretaker caretaker;

  TaskPageControllerNotifier({
    required this.authRepo,
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
    var users = await authRepo.getUserById(id: initialTask!.assignedUserId);
    return users.ifSuccess((payload) => state = ConsultingTaskPageState(assignedUsers: [payload!], task: initialTask!));
  }

  switchToEdit() {
    var actualState = state;
    if (actualState is ConsultingTaskPageState) {
      state = actualState.switchToEdit();
    }
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
