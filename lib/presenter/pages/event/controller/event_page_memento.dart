import 'package:supercalipso/plugin/utils.dart';
import 'package:supercalipso/presenter/pages/event/controller/event_page_state.dart';

class EventPageMementoState extends MementoState<EventPageState> {
  EventPageMementoState(super.state);
}

class EventPageMementoStateCaretaker extends MementoStateCaretaker<EventPageState> {
  EventPageMementoStateCaretaker(super.mementoState);
}

class EventPageMementoStateOriginator extends MementoStateOriginator<EventPageState> {
  EventPageMementoStateOriginator(super.state);

  @override
  MementoState<EventPageState> saveToMemento() => EventPageMementoState(state);
}
