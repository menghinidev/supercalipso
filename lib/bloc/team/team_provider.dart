import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:supercalipso/bloc/auth/auth_provider.dart';
import 'package:supercalipso/data/model/team/invitation/invitation.dart';
import 'package:supercalipso/data/model/team/team.dart';
import 'package:supercalipso/data/repository/auth_repository.dart';
import 'package:supercalipso/data/repository/team_repository.dart';
import 'package:supercalipso/plugin/utils.dart';
import 'package:supercalipso/services/installer.dart';

/// Repo

final teamRepoProvider = Provider<TeamRepository>((ref) => Installer.instance.get<TeamRepository>());

/// Collection changes

final teamsChangesProvider = StreamProvider<List<Team>>((ref) {
  return ref.read(teamRepoProvider).teamsChanges;
});

final teamInvitationsChangesProvider = StreamProvider<List<TeamInvitation>>((ref) {
  return ref.read(teamRepoProvider).invitationsChanges;
});

final pendingTeamInvitationsChangesProvider = StreamProvider<List<TeamInvitation>>((ref) {
  return ref
      .read(teamInvitationsChangesProvider.stream)
      .map((event) => event.where((element) => element.status == TeamInvitationStatus.unknown).toList());
});

/// Item changes

final teamChangesProvider = StreamProviderFamily<Team, String>((ref, id) {
  var repo = ref.read(teamRepoProvider);
  return repo.teamChanges(id);
});

final teamProvider = FutureProvider.family<Response<Team>, String>((ref, teamId) async {
  var repo = ref.read(teamRepoProvider);
  return await repo.getTeam(teamId: teamId);
});
