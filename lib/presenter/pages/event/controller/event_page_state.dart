import 'package:supercalipso/data/model/event/team_event.dart';

abstract class EventPageState {
  static EventPageState create(TeamEvent? initialEvent) {
    if (initialEvent != null) return ConsultingEventPageState();
    return EditingEventPageState();
  }
}

class EditingEventPageState extends EventPageState {}

class ConsultingEventPageState extends EventPageState {
  EditingEventPageState switchToEdit() => EditingEventPageState();
}
