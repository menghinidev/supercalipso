import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:supercalipso/data/model/team/team.dart';
import 'package:supercalipso/data/model/team/subscription/subscription.dart';
import 'package:supercalipso/data/model/team/invitation/invitation.dart';
import 'package:supercalipso/data/provider/api/team/i_team_data_source.dart';
import 'package:supercalipso/data/provider/command/team/createInvitation/create_team_invitation_command.dart';
import 'package:supercalipso/data/provider/command/team/replyToInvitation/replayto_invitation_command.dart';
import 'package:supercalipso/plugin/utils/response.dart';

class TeamFirestoreDataSource extends ITeamDataSource {
  final teamCollectionPath = 'teams';
  final invitationsCollectionPath = 'invitations';
  final subscriptionsCollectionPath = 'subscriptions';
  final firestore = FirebaseFirestore.instance;

  @override
  Future<Response> createTeamInvitation({required CreateTeamInvitationCommand command}) {
    // TODO: implement createTeamInvitation
    throw UnimplementedError();
  }

  @override
  Future<Response<Team>> readTeam({required String teamId}) {
    // TODO: implement readTeam
    throw UnimplementedError();
  }

  @override
  Future<Response<List<TeamInvitation>>> readUserTeamsInvitations({required String userId}) {
    // TODO: implement readUserTeamsInvitations
    throw UnimplementedError();
  }

  @override
  Future<Response<List<TeamSubscription>>> readUserTeamsSubscriptions({required String userId}) {
    // TODO: implement readUserTeamsSubscriptions
    throw UnimplementedError();
  }

  @override
  Future<Response> replyTeamInvitation({required ReplayToInvitationCommand command}) {
    // TODO: implement replyTeamInvitation
    throw UnimplementedError();
  }
}
