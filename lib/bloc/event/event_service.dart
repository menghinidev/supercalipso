import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:supercalipso/bloc/auth/auth_provider.dart';
import 'package:supercalipso/bloc/event/event_provider.dart';
import 'package:supercalipso/bloc/team/team_provider.dart';
import 'package:supercalipso/data/model/event/team_event.dart';
import 'package:supercalipso/data/model/team/team.dart';
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

  Future<Response> createEvent({required String name, required DateTime startTime, required String teamId}) async {
    var team = await teamRepository.getTeam(teamId: teamId);
    return await team.flatMapAsync((t) => eventRepository.createEvent(team: t!, name: name, startTime: startTime));
  }

  Future<Response> getTeamEvents() async {
    var userId = authRepository.loggedUser?.id;
    if (userId == null) return Responses.failure([]);
    var teams = await teamRepository.getUserTeams(userId: userId);
    return await teams.flatAndCollectAsync<List<TeamEvent>, Team>(
      teams.payload!,
      (source) => eventRepository.getTeamEvents(teamId: source.id),
    );
  }
}
