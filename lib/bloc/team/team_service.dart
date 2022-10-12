import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:supercalipso/bloc/auth/auth_provider.dart';
import 'package:supercalipso/bloc/event/event_provider.dart';
import 'package:supercalipso/bloc/note/note_provider.dart';
import 'package:supercalipso/bloc/team/team_provider.dart';
import 'package:supercalipso/bloc/user/user_provider.dart';
import 'package:supercalipso/data/model/event/team_event.dart';
import 'package:supercalipso/data/model/note/note.dart';
import 'package:supercalipso/data/model/team/invitation/invitation.dart';
import 'package:supercalipso/data/model/team/team.dart';
import 'package:supercalipso/data/repository/auth_repository.dart';
import 'package:supercalipso/data/repository/event_repository.dart';
import 'package:supercalipso/data/repository/note_repository.dart';
import 'package:supercalipso/data/repository/note_repository.dart';
import 'package:supercalipso/data/repository/team_repository.dart';
import 'package:supercalipso/data/repository/user_repository.dart';
import 'package:supercalipso/plugin/utils.dart';

var teamServiceProvider = Provider<TeamService>((ref) => TeamService(
      teamRepository: ref.watch(teamRepoProvider),
      authRepository: ref.watch(authProvider),
      userRepository: ref.watch(userRepoProvider),
      eventRepository: ref.watch(eventRepositoryProvider),
      noteRepository: ref.watch(noteRepoProvider),
    ));

final teamInvitationsProvider = FutureProvider<Response<List<TeamInvitation>>>((ref) async {
  return ref.watch(teamServiceProvider).getTeamsInvitations();
});

class TeamService {
  final TeamRepository teamRepository;
  final EventRepository eventRepository;
  final AuthRepository authRepository;
  final UserRepository userRepository;
  final NoteRepository noteRepository;

  TeamService({
    required this.teamRepository,
    required this.authRepository,
    required this.userRepository,
    required this.eventRepository,
    required this.noteRepository,
  });

  Future<Response<List<Team>>> getUserTeams() async {
    var userId = authRepository.loggedUser?.id;
    if (userId == null) return Responses.failure([]);
    var response = await teamRepository.getUserTeams(userId: userId);
    return response;
  }

  Future<Response<List<TeamInvitation>>> getTeamsInvitations() async {
    var userId = authRepository.loggedUser?.id;
    if (userId == null) return Responses.failure([]);
    var response = await teamRepository.getUserTeamInvitations(userId: userId);
    return response;
  }

  Future<Response> replyTeamInvitation({
    required TeamInvitationStatus status,
    required String teamInvitationId,
  }) async {
    var userId = authRepository.loggedUser?.id;
    if (userId == null) return Responses.failure([]);
    var response = await teamRepository.replyToTeamInvitation(
      status: status,
      teamInvitationId: teamInvitationId,
      userId: userId,
    );
    var teams = await response.flatMapAsync((t) => teamRepository.getUserTeams(userId: userId));
    await teams.flatAndCollectAsync<List<TeamEvent>, Team>(
      teams.payload!,
      (source) => eventRepository.getTeamEvents(teamId: source.id),
    );
    await teams.flatAndCollectAsync<List<Note>, Team>(
      teams.payload!,
      (source) => noteRepository.getTeamNotes(teamId: source.id),
    );
    return Future.value(Responses.success(null));
  }

  Future<Response> inviteUserToTeam({required String email, required String teamId}) async {
    var userId = authRepository.loggedUser?.id;
    if (userId == null) return Responses.failure([]);
    var toInvite = await userRepository.getUserByEmail(email: email);
    var response = await toInvite.flatMapAsync((t) => teamRepository.createTeamInvitation(
          ownerUserId: userId,
          invitedUserId: t!.id,
          teamId: teamId,
        ));
    return response;
  }
}
