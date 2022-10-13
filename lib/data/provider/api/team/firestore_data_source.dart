import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:supercalipso/data/model/team/team.dart';
import 'package:supercalipso/data/model/team/subscription/subscription.dart';
import 'package:supercalipso/data/model/team/invitation/invitation.dart';
import 'package:supercalipso/data/provider/api/constants.dart';
import 'package:supercalipso/data/provider/api/team/i_team_data_source.dart';
import 'package:supercalipso/data/provider/command/team/createInvitation/create_team_invitation_command.dart';
import 'package:supercalipso/data/provider/command/team/createTeam/create_team_command.dart';
import 'package:supercalipso/data/provider/command/team/replyToInvitation/replayto_invitation_command.dart';
import 'package:supercalipso/plugin/utils/response.dart';

class TeamFirestoreDataSource extends ITeamDataSource {
  final firestore = FirebaseFirestore.instance;

  @override
  Future<Response> createTeamInvitation({required CreateTeamInvitationCommand command}) async {
    var document = firestore.collection(FirestoreCollections.invitations).doc();
    var invitation = TeamInvitation(
      id: document.id,
      created: command.createdAt,
      invitedByUserId: command.invitedByUserId,
      invitedUserId: command.invitedUserId,
      teamId: command.teamId,
      status: TeamInvitationStatus.fromString(command.status),
    );
    await document.set(invitation.toJson());
    return Responses.success(null);
  }

  @override
  Future<Response> replyTeamInvitation({required ReplyToInvitationCommand command}) async {
    var invitationDocument = firestore.collection(FirestoreCollections.invitations).doc(command.invitationId);
    var parsedInvitation = TeamInvitation.fromJson((await invitationDocument.get()).data()!);
    var updatedInvitation = parsedInvitation.copyWith(status: TeamInvitationStatus.fromString(command.status));
    await invitationDocument.update(updatedInvitation.toJson());
    if (!(updatedInvitation.status == TeamInvitationStatus.accepted)) return Future.value(Responses.success(null));
    var subscriptionDocument = firestore.collection(FirestoreCollections.subscriptions).doc();
    var sub = TeamSubscription(
      id: subscriptionDocument.id,
      joined: DateTime.now(),
      subscribedUserId: updatedInvitation.invitedUserId,
      teamId: updatedInvitation.teamId,
    );
    await subscriptionDocument.set(sub.toJson());
    return Responses.success(null);
  }

  @override
  Future<Response<List<TeamInvitation>>> readUserTeamsInvitations({required String userId}) async {
    var invitations =
        await firestore.collection(FirestoreCollections.invitations).where('invitedUserId', isEqualTo: userId).get();
    var mapped = invitations.docs.map((e) => TeamInvitation.fromJson(e.data())).toList();
    return Responses.success(mapped);
  }

  @override
  Future<Response<List<TeamSubscription>>> readUserTeamsSubscriptions({required String userId}) async {
    var subscriptions = await firestore
        .collection(FirestoreCollections.subscriptions)
        .where('subscribedUserId', isEqualTo: userId)
        .get();
    var mapped = subscriptions.docs.map((e) => TeamSubscription.fromJson(e.data())).toList();
    return Responses.success(mapped);
  }

  @override
  Future<Response<Team>> readTeam({required String teamId}) async {
    var team = await firestore.collection(FirestoreCollections.teams).doc(teamId).get();
    if (!team.exists) return Responses.failure([]);
    return Responses.success(Team.fromJson(team.data()!));
  }

  @override
  Future<Response> createTeam({required CreateTeamCommand command}) async {
    var document = firestore.collection(FirestoreCollections.teams).doc();
    var team = Team(id: document.id, name: command.name);
    await document.set(team.toJson());
    var teamOwnerSubDocument = firestore.collection(FirestoreCollections.subscriptions).doc();
    var sub = TeamSubscription(
      id: teamOwnerSubDocument.id,
      subscribedUserId: command.userId,
      teamId: document.id,
      joined: DateTime.now(),
    );
    await teamOwnerSubDocument.set(sub.toJson());
    return Responses.success(null);
  }
}
