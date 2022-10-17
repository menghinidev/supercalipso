import 'package:supercalipso/data/model/event/builder/event_builder.dart';
import 'package:supercalipso/data/model/event/team_event.dart';
import 'package:supercalipso/plugin/utils.dart';

abstract class EventPageState {
  static EventPageState create(TeamEvent? initialEvent) {
    if (initialEvent != null) return ConsultingEventPageState(event: initialEvent);
    return EditingEventPageState(
      builder: EventBuilder(
        description: initialEvent?.description,
        endTime: initialEvent?.endTime,
        name: initialEvent?.name,
        startTime: initialEvent?.startTime,
        teamId: initialEvent?.teamId,
        iconName: initialEvent?.iconName,
      ),
    );
  }
}

class EditingEventPageState extends EventPageState {
  final EventBuilder builder;

  EditingEventPageState({required this.builder});
}

class ConsultingEventPageState extends EventPageState {
  final TeamEvent event;

  ConsultingEventPageState({required this.event});

  EditingEventPageState switchToEdit() => EditingEventPageState(
        builder: EventBuilder(
          description: event.description,
          endTime: event.endTime,
          iconName: event.iconName,
          name: event.name,
          startTime: event.startTime,
          teamId: event.teamId,
        ),
      );
}

extension EventPageStateExt on EventPageState {
  T on<T>({
    required T Function() defaultValue,
    T Function(EditingEventPageState state)? onEditing,
    T Function(ConsultingEventPageState state)? onReading,
  }) {
    var copyThis = this;
    if (copyThis is EditingEventPageState && onEditing != null) return onEditing(copyThis);
    if (copyThis is ConsultingEventPageState && onReading != null) return onReading(copyThis);
    return defaultValue();
  }
}
