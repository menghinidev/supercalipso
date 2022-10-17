import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:supercalipso/data/model/event/team_event.dart';
import 'package:supercalipso/presenter/pages/event/controller/event_page_state.dart';

final eventPageControllerProvider = StateNotifierProvider<EventPageNotifier, EventPageState>((ref) {
  return EventPageNotifier();
});

class EventPageNotifier extends StateNotifier<EventPageState> {
  final TeamEvent? initialEvent;

  EventPageNotifier({this.initialEvent}) : super(EventPageState.create(initialEvent));

  switchToEdit() {
    var actualState = state;
    if (actualState is ConsultingEventPageState) {
      state = actualState.switchToEdit();
    }
  }
}
