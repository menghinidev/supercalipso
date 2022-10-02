import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:supercalipso/data/model/team/team.dart';
import 'package:supercalipso/data/reposotory/team_repository.dart';

var teamRepoProvider = Provider<TeamRepository>((ref) => TeamRepository());

var loggedUserTeamsChangesProvider = StreamProvider<List<Team>>((ref) {
  var repo = ref.watch(teamRepoProvider);
  return repo.loggedUserTeamsChanges;
});

var teamChangesProvider = StreamProviderFamily<Team, String>((ref, id) {
  var repo = ref.watch(teamRepoProvider);
  return repo.teamChanges(id);
});
