import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:supercalipso/bloc/event/event_service.dart';
import 'package:supercalipso/data/model/event/team_event.dart';
import 'package:supercalipso/data/repository/event_repository.dart';
import 'package:supercalipso/services/installer.dart';

final eventRepositoryProvider = Provider<EventRepository>((ref) {
  return Installer.instance.get<EventRepository>();
});

final teamEventsChangesProvider = StreamProvider<List<TeamEvent>>((ref) {
  return ref.watch(eventServiceProvider).loggedTeamEvents;
});

final teamEventChangesProvider = StreamProvider.family<TeamEvent, String>((ref, id) {
  return ref.watch(eventRepositoryProvider).getEventChanges(eventId: id);
});
