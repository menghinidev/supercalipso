import 'package:supercalipso/data/model/team/invitation.dart';
import 'package:supercalipso/data/model/team/team.dart';
import 'package:supercalipso/plugin/bloc.dart';

class TeamsLoaded extends BlocState {
  final List<Team> enrolledTeams;
  final List<TeamInvitation> teamInvitations;

  TeamsLoaded({required this.enrolledTeams, required this.teamInvitations});
}
