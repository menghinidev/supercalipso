import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:supercalipso/data/model/team/invitation/invitation.dart';
import 'package:supercalipso/data/model/team/team.dart';
import 'package:supercalipso/data/repository/team_repository.dart';
import 'package:supercalipso/plugin/utils.dart';
import 'package:supercalipso/services/installer.dart';

/// Repo

final teamRepoProvider = Provider<TeamRepository>((ref) => Installer.instance.get<TeamRepository>());

/// Collection changes

final teamsChangesProvider = StreamProvider<List<Team>>((ref) {
  return ref.watch(teamRepoProvider).teamsChanges;
});

final teamInvitationsChangesProvider = StreamProvider<List<TeamInvitation>>((ref) {
  return ref.watch(teamRepoProvider).invitationsChanges;
});

final pendingTeamInvitationsChangesProvider = StreamProvider<List<TeamInvitation>>((ref) {
  return ref
      .watch(teamRepoProvider)
      .invitationsChanges
      .map((event) => event.where((element) => element.status == TeamInvitationStatus.unknown).toList());
});

/// Item changes

final teamChangesProvider = StreamProviderFamily<Team, String>((ref, id) {
  return ref.watch(teamRepoProvider).teamChanges(id);
});

final teamProvider = FutureProvider.family<Team, String>((ref, id) async {
  return (await ref.read(teamRepoProvider).getTeam(teamId: id)).payload!;
});
