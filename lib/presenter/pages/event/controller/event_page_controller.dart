import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:supercalipso/bloc/event/event_service.dart';
import 'package:supercalipso/data/model/event/team_event.dart';
import 'package:supercalipso/presenter/pages/event/controller/event_page_memento.dart';
import 'package:supercalipso/presenter/pages/event/controller/event_page_state.dart';

final eventPageControllerProvider =
    StateNotifierProvider.family.autoDispose<EventPageNotifier, EventPageState, TeamEvent?>((ref, event) {
  return EventPageNotifier(
    eventService: ref.watch(eventServiceProvider),
    initialEvent: event,
  );
});

class EventPageNotifier extends StateNotifier<EventPageState> {
  final TeamEvent? initialEvent;
  final EventService eventService;
  late EventPageMementoStateOriginator originator;
  late EventPageMementoStateCaretaker caretaker;

  EventPageNotifier({required this.eventService, this.initialEvent}) : super(EventPageState.create(initialEvent)) {
    originator = EventPageMementoStateOriginator(state);
    caretaker = EventPageMementoStateCaretaker(originator.saveToMemento());
  }

  switchToEdit() {
    var actualState = state;
    if (actualState is ConsultingEventPageState) {
      state = actualState.switchToEdit();
    }
  }

  editEventName(String name) {
    var actualState = state;
    if (actualState is EditingEventPageState) {
      var newState = EditingEventPageState(builder: actualState.builder.copyWith(name: name));
      __saveStep(newState);
    }
  }

  editEventDescription(String? description) {
    var actualState = state;
    if (actualState is EditingEventPageState) {
      var newState = EditingEventPageState(builder: actualState.builder.copyWith(description: description));
      __saveStep(newState);
    }
  }

  editEventStartDate(DateTime start) {
    var actualState = state;
    if (actualState is EditingEventPageState) {
      var old = actualState.builder.startTime;
      var updated = old != null ? DateTime.utc(start.year, start.month, start.day, old.hour, old.minute) : start;
      var newState = EditingEventPageState(builder: actualState.builder.copyWith(startTime: updated));
      __saveStep(newState);
    }
  }

  editEventStartTime(DateTime start) {
    var actualState = state;
    if (actualState is EditingEventPageState) {
      var old = actualState.builder.startTime;
      var updated = old != null ? DateTime.utc(old.year, old.month, old.day, start.hour, start.minute) : start;
      var newState = EditingEventPageState(builder: actualState.builder.copyWith(startTime: updated));
      __saveStep(newState);
    }
  }

  editEventEndDate(DateTime end) {
    var actualState = state;
    if (actualState is EditingEventPageState) {
      var old = actualState.builder.endTime;
      var updated = old != null ? DateTime.utc(end.year, end.month, end.day, old.hour, old.minute) : end;
      var newState = EditingEventPageState(builder: actualState.builder.copyWith(endTime: updated));
      __saveStep(newState);
    }
  }

  editEventEndTime(DateTime end) {
    var actualState = state;
    if (actualState is EditingEventPageState) {
      var old = actualState.builder.endTime;
      var updated = old != null ? DateTime.utc(old.year, old.month, old.day, end.hour, end.minute) : end;
      var newState = EditingEventPageState(builder: actualState.builder.copyWith(endTime: updated));
      __saveStep(newState);
    }
  }

  editIcon(String iconName) {
    var actualState = state;
    if (actualState is EditingEventPageState) {
      var newState = EditingEventPageState(builder: actualState.builder.copyWith(iconName: iconName));
      __saveStep(newState);
    }
  }

  Future submit() async {
    var actualState = state;
    if (actualState is EditingEventPageState) {
      var isNew = initialEvent == null;
      if (isNew) {
        return eventService.createEvent(
          name: actualState.builder.name!,
          startTime: actualState.builder.startTime!,
          description: actualState.builder.description,
          endTime: actualState.builder.endTime,
          iconName: actualState.builder.iconName,
        );
      } else {
        return eventService.updateEvent(
          eventId: initialEvent!.id,
          name: actualState.builder.name,
          startTime: actualState.builder.startTime,
          description: actualState.builder.description,
          endTime: actualState.builder.endTime,
          iconName: actualState.builder.iconName,
        );
      }
    }
  }

  __saveStep(EventPageState newState) {
    var mementoState = EventPageMementoState(newState);
    originator.changeState(mementoState.state);
    caretaker.saveMemento(mementoState);
    state = newState;
  }

  undo() {
    var backState = caretaker.rollback();
    originator.restoreFromMemento(backState);
    state = backState.state;
  }
}
