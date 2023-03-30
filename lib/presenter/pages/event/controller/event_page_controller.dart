import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:supercalipso/application/auth/auth_provider.dart';
import 'package:supercalipso/application/event/event_service.dart';
import 'package:supercalipso/data/model/event/builder/event_builder.dart';
import 'package:supercalipso/data/model/event/team_event.dart';
import 'package:supercalipso/data/model/user/user.dart';
import 'package:supercalipso/data/repository/auth_repository.dart';
import 'package:supercalipso/presenter/components/dialog/confirm_dialog.dart';
import 'package:supercalipso/presenter/pages/event/controller/event_page_memento.dart';
import 'package:supercalipso/presenter/pages/event/controller/event_page_state.dart';
import 'package:supercalipso/services/modals/dialog/dialog_service.dart';

final eventPageControllerProvider =
    StateNotifierProvider.family.autoDispose<EventPageNotifier, EventPageState, TeamEvent?>((ref, event) {
  return EventPageNotifier(
    eventService: ref.watch(teamEventControllerProvider.notifier),
    authRepo: ref.watch(authRepoProvider),
    dialogService: ref.watch(dialogServiceProvider),
    initialEvent: event,
  );
});

class EventPageNotifier extends StateNotifier<EventPageState> {
  final TeamEvent? initialEvent;
  final User? creator;
  final TeamEventController eventService;
  final DialogService dialogService;
  final AuthRepository authRepo;
  late EventPageMementoStateOriginator originator;
  late EventPageMementoStateCaretaker caretaker;

  EventPageNotifier({
    required this.eventService,
    required this.dialogService,
    required this.authRepo,
    this.creator,
    this.initialEvent,
  }) : super(EventPageState.create(initialEvent, creator)) {
    originator = EventPageMementoStateOriginator(state);
    caretaker = EventPageMementoStateCaretaker(originator.saveToMemento());
    init();
  }

  Future init() async {
    if (initialEvent == null) {
      state = EditingEventPageState(builder: const EventBuilder());
      return Future.value();
    }
    var user = await authRepo.getUserById(id: initialEvent!.createdByUserId);
    return user.ifSuccess((payload) => state = ConsultingEventPageState(creator: payload!, event: initialEvent!));
  }

  switchToEdit() {
    var actualState = state;
    if (actualState is ConsultingEventPageState) {
      state = actualState.switchToEdit();
    }
  }

  discard() {
    var actualState = state;
    if (actualState is EditingEventPageState) {
      state = ConsultingEventPageState(event: initialEvent!, creator: creator);
    }
  }

  editEventName(String name) {
    var actualState = state;
    if (actualState is EditingEventPageState) {
      var newState = EditingEventPageState(builder: actualState.builder.copyWith(name: name));
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
      var confirm = await dialogService.showDialog(
        dialog: const ConfirmDialog(
          title: 'Confirm',
          textBody: 'This event will be available inside your Team',
        ),
      );
      if (confirm.hasDismissed) return Future.value();
      if (isNew) {
        return eventService.createEvent(
          name: actualState.builder.name!,
          startTime: actualState.builder.startTime!,
          description: actualState.builder.description,
          endTime: actualState.builder.endTime,
          iconName: actualState.builder.iconName,
        ) /* .ifSuccess((payload) => router.pop()) */;
      } else {
        return eventService.updateEvent(
          eventId: initialEvent!.id,
          name: actualState.builder.name,
          startTime: actualState.builder.startTime,
          description: actualState.builder.description,
          endTime: actualState.builder.endTime,
          iconName: actualState.builder.iconName,
        ) /* .ifSuccess((payload) => router.pop()) */;
      }
    }
  }

  Future delete() async {
    var id = state.on(defaultValue: () => null, onReading: (state) => state.event.id);
    if (id == null) return Future.value();
    var dialogResponse = await dialogService.showDialog(
      dialog: const ConfirmDialog(
        title: 'Are you sure',
        textBody: 'This event will be deleted',
      ),
    );
    if (dialogResponse.hasConfirmed) {
      return await eventService.deleteEvent(eventId: id) /* .ifSuccess((payload) => router.pop()) */;
    }
    return Future.value();
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
