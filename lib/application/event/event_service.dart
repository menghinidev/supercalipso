import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:supercalipso/application/auth/auth_provider.dart';
import 'package:supercalipso/application/auth/authstate.dart';
import 'package:supercalipso/application/event/event_provider.dart';
import 'package:supercalipso/application/team/team_service.dart';
import 'package:supercalipso/application/team/teamsessionstate.dart';
import 'package:supercalipso/data/model/event/team_event.dart';
import 'package:supercalipso/data/repository/event_repository.dart';
import 'package:supercalipso/plugin/utils/response.dart';

final teamEventControllerProvider = StateNotifierProvider<TeamEventController, AsyncValue<List<TeamEvent>>>((ref) {
  var auth = ref.watch(authStateProvider);
  var session = ref.watch(teamSessionStateProvider);
  return TeamEventController(
    authState: auth,
    teamState: session,
    eventRepository: ref.watch(eventRepositoryProvider),
  );
});

class TeamEventController extends StateNotifier<AsyncValue<List<TeamEvent>>> {
  final AuthState? authState;
  final TeamSessionState teamState;
  final EventRepository eventRepository;

  TeamEventController({
    required this.authState,
    required this.eventRepository,
    required this.teamState,
  }) : super(const AsyncData(<TeamEvent>[]));

  Future<Response> createEvent({
    required String name,
    required DateTime startTime,
    DateTime? endTime,
    String? description,
    String? iconName,
  }) async {
    var userId = authState?.whenOrNull(auth: (user) => user.uid);
    if (userId == null) return Responses.failure([]);
    var teamId = teamState.whenOrNull(logged: (team) => team.id);
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
    var userId = authState?.whenOrNull(auth: (user) => user.uid);
    if (userId == null) return Responses.failure([]);
    var teamId = teamState.whenOrNull(logged: (team) => team.id);
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
    var teamId = teamState.whenOrNull(logged: (team) => team.id);
    if (teamId == null) return Responses.failure([]);
    return await eventRepository.getTeamEvents(teamId: teamId);
  }
}
