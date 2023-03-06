import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:supercalipso/bloc/auth/auth_provider.dart';
import 'package:supercalipso/bloc/auth/authstate.dart';
import 'package:supercalipso/bloc/event/event_provider.dart';
import 'package:supercalipso/bloc/team/team_provider.dart';
import 'package:supercalipso/data/repository/event_repository.dart';
import 'package:supercalipso/data/repository/team_repository.dart';
import 'package:supercalipso/plugin/utils/response.dart';

final eventServiceProvider = Provider<EventService>((ref) {
  var auth = ref.watch(authStateProvider);
  return EventService(
    authState: auth,
    teamRepository: ref.watch(teamRepoProvider),
    eventRepository: ref.watch(eventRepositoryProvider),
  );
});

class EventService {
  final AuthState authState;
  final TeamRepository teamRepository;
  final EventRepository eventRepository;

  EventService({required this.authState, required this.eventRepository, required this.teamRepository});

  Future<Response> createEvent({
    required String name,
    required DateTime startTime,
    DateTime? endTime,
    String? description,
    String? iconName,
  }) async {
    var userId = authRepository.loggedUser?.uid;
    if (userId == null) return Responses.failure([]);
    var teamId = teamRepository.loggedTeamId;
    if (teamId == null) return Responses.failure([]);
    return await eventRepository.createEvent(
      teamId: teamId,
      name: name,
      startTime: startTime,
      endTime: endTime,
      description: description,
      userId: userId,
      iconName: iconName,
    );
  }

  Future<Response> updateEvent({
    required String eventId,
    String? name,
    DateTime? startTime,
    DateTime? endTime,
    String? description,
    String? iconName,
  }) async {
    var userId = authRepository.loggedUser?.uid;
    if (userId == null) return Responses.failure([]);
    var teamId = teamRepository.loggedTeamId;
    if (teamId == null) return Responses.failure([]);
    return await eventRepository.updateEvent(
      eventId: eventId,
      description: description,
      endTime: endTime,
      name: name,
      startTime: startTime,
      iconName: iconName,
    );
  }

  Future<Response> deleteEvent({required String eventId}) => eventRepository.deleteEvent(eventId: eventId);

  Future<Response> askTeamEvents() async {
    var teamId = teamRepository.loggedTeamId;
    if (teamId == null) return Responses.failure([]);
    return await eventRepository.getTeamEvents(teamId: teamId);
  }
}
