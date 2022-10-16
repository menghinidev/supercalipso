import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:supercalipso/bloc/auth/auth_provider.dart';
import 'package:supercalipso/bloc/event/event_provider.dart';
import 'package:supercalipso/bloc/team/team_provider.dart';
import 'package:supercalipso/data/model/event/team_event.dart';
import 'package:supercalipso/data/repository/auth_repository.dart';
import 'package:supercalipso/data/repository/event_repository.dart';
import 'package:supercalipso/data/repository/team_repository.dart';
import 'package:supercalipso/plugin/utils/response.dart';

final eventServiceProvider = Provider<EventService>((ref) {
  return EventService(
    authRepository: ref.watch(authProvider),
    teamRepository: ref.watch(teamRepoProvider),
    eventRepository: ref.watch(eventRepositoryProvider),
  );
});

class EventService {
  final AuthRepository authRepository;
  final TeamRepository teamRepository;
  final EventRepository eventRepository;

  EventService({required this.authRepository, required this.eventRepository, required this.teamRepository});

  Future<Response> createEvent({
    required String name,
    required DateTime startTime,
    Duration? duration,
    String? description,
  }) async {
    var userId = authRepository.loggedUser?.uid;
    if (userId == null) return Responses.failure([]);
    var teamId = teamRepository.loggedTeamId;
    if (teamId == null) return Responses.failure([]);
    return await eventRepository.createEvent(
      teamId: teamId,
      name: name,
      startTime: startTime,
      duration: duration,
      description: description,
      userId: userId,
    );
  }

  Future<Response> askUserEvents() async {
    var userId = authRepository.loggedUser?.uid;
    if (userId == null) return Responses.failure([]);
    return await eventRepository.getUserEvents(userId: userId);
  }

  Stream<List<TeamEvent>> get loggedTeamEvents {
    var currentTeamId = teamRepository.loggedTeamId;
    if (currentTeamId == null) return Stream.value(<TeamEvent>[]);
    return eventRepository.getTeamEventsChanges(teamId: currentTeamId);
  }
}
