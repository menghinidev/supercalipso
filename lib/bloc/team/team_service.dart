import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:supercalipso/bloc/auth/auth_provider.dart';
import 'package:supercalipso/bloc/event/event_provider.dart';
import 'package:supercalipso/bloc/note/note_provider.dart';
import 'package:supercalipso/bloc/team/team_provider.dart';
import 'package:supercalipso/data/model/event/team_event.dart';
import 'package:supercalipso/data/model/note/note.dart';
import 'package:supercalipso/data/model/team/invitation/invitation.dart';
import 'package:supercalipso/data/model/team/subscription/subscription.dart';
import 'package:supercalipso/data/model/team/team.dart';
import 'package:supercalipso/data/model/user/user.dart';
import 'package:supercalipso/data/repository/auth_repository.dart';
import 'package:supercalipso/data/repository/event_repository.dart';
import 'package:supercalipso/data/repository/note_repository.dart';
import 'package:supercalipso/data/repository/team_repository.dart';
import 'package:supercalipso/plugin/utils.dart';

var teamServiceProvider = Provider<TeamService>((ref) => TeamService(
      teamRepository: ref.watch(teamRepoProvider),
      authRepository: ref.watch(authProvider),
      eventRepository: ref.watch(eventRepositoryProvider),
      noteRepository: ref.watch(noteRepoProvider),
    ));

final teamInvitationsProvider = FutureProvider<Response<List<TeamInvitation>>>((ref) async {
  return ref.watch(teamServiceProvider).getTeamsInvitations();
});

final teamMembersProvider = FutureProvider.family<List<User>, String>((ref, id) async {
  return ref.watch(teamServiceProvider).getTeamMembers(teamId: id);
});

class TeamService {
  final TeamRepository teamRepository;
  final EventRepository eventRepository;
  final AuthRepository authRepository;
  final NoteRepository noteRepository;

  TeamService({
    required this.teamRepository,
    required this.authRepository,
    required this.eventRepository,
    required this.noteRepository,
  });

  Future<List<User>> getTeamMembers({required String teamId}) async {
    var userId = authRepository.loggedUser?.uid;
    if (userId == null) return Future.error('error');
    var team = await teamRepository.getTeamSubscriptions(teamId: teamId);
    var users = await team.flatAndCollectAsync<User, TeamSubscription>(
      team.payload!,
      (source) => authRepository.getUserById(id: source.subscribedUserId),
    );
    return users.isError ? Future.error('error') : Future.value(users.payload!);
  }

  Future<Response<List<Team>>> getUserTeams() async {
    var userId = authRepository.loggedUser?.uid;
    if (userId == null) return Responses.failure([]);
    var response = await teamRepository.getUserTeams(userId: userId);
    return response;
  }

  Future<Response<List<TeamInvitation>>> getTeamsInvitations() async {
    var userId = authRepository.loggedUser?.uid;
    if (userId == null) return Responses.failure([]);
    var response = await teamRepository.getUserTeamInvitations(userId: userId);
    return response;
  }

  Future<Response> replyTeamInvitation({required TeamInvitationStatus status, required String teamInvitationId}) async {
    var userId = authRepository.loggedUser?.uid;
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
    var userId = authRepository.loggedUser?.uid;
    if (userId == null) return Responses.failure([]);
    var toInvite = await authRepository.getUserByEmail(email: email);
    var response = await toInvite.flatMapAsync((t) => teamRepository.createTeamInvitation(
          ownerUserId: userId,
          invitedUserId: t!.uid,
          teamId: teamId,
        ));
    return response;
  }

  Future<Response> createTeam({required String name}) async {
    var userId = authRepository.loggedUser?.uid;
    if (userId == null) return Responses.failure([]);
    return await teamRepository.createTeam(name: name, userId: userId);
  }
}
