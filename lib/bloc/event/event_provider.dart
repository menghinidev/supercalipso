import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:supercalipso/bloc/auth/auth_provider.dart';
import 'package:supercalipso/bloc/team/team_provider.dart';
import 'package:supercalipso/data/model/event/team_event.dart';
import 'package:supercalipso/data/repository/event_repository.dart';
import 'package:supercalipso/services/installer.dart';
import 'package:supercalipso/data/model/team/team.dart';

final eventRepositoryProvider = Provider<EventRepository>((ref) {
  return Installer.instance.get<EventRepository>();
});

final teamEventsChangesProvider = StreamProvider.family<List<TeamEvent>, String>((ref, id) {
  return ref.watch(eventRepositoryProvider).getTeamEventsChanges(teamId: id);
});

final teamEventChangesProvider = StreamProvider.family<TeamEvent, String>((ref, id) {
  return ref.watch(eventRepositoryProvider).getEventChanges(eventId: id);
});

final latestEventsChangesProvider = StreamProvider<List<TeamEvent>>((ref) {
  ref.watch(teamsChangesProvider);
  return ref.watch(eventRepositoryProvider).eventsChanges;
});
