import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:supercalipso/data/model/team/team.dart';

part 'teamsessionstate.freezed.dart';

@freezed
class TeamSessionState with _$TeamSessionState {
  const factory TeamSessionState.logged({required Team team}) = Logged;
  const factory TeamSessionState.homeless() = Homeless;
  const factory TeamSessionState.signedOut({required List<Team> teams}) = SignedOut;
}
