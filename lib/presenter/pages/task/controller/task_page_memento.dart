import 'package:supercalipso/plugin/utils/memento/memento_state.dart';
import 'package:supercalipso/presenter/pages/task/controller/task_page_state.dart';

class TaskPageMementoState extends MementoState<TaskPageState> {
  TaskPageMementoState(super.state);
}

class TaskPageMementoStateCaretaker extends MementoStateCaretaker<TaskPageState> {
  TaskPageMementoStateCaretaker(super.mementoState);
}

class TaskPageMementoStateOriginator extends MementoStateOriginator<TaskPageState> {
  TaskPageMementoStateOriginator(super.state);

  @override
  MementoState<TaskPageState> saveToMemento() => TaskPageMementoState(state);
}
