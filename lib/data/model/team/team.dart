import 'package:supercalipso/data/model/team/invitation.dart';
import 'package:supercalipso/data/model/team/subscription.dart';
import 'package:supercalipso/data/model/user/user.dart';
import 'package:supercalipso/plugin/utils/extensions/list_extensions.dart';

class Team {
  final String id;
  final String name;
  final List<TeamSubscription> subscriptions;
  final List<TeamInvitation> invitations;

  Team({
    required this.id,
    required this.name,
    this.subscriptions = const <TeamSubscription>[],
    this.invitations = const <TeamInvitation>[],
  });

  bool hasUserSub({required String userId}) => subscriptions
      .where(
        (element) => element.subscribedUser.id == userId,
      )
      .isNotEmpty;

  bool hasUserInvite({required String userId}) => invitations
      .where(
        (element) => element.invitedUser.id == userId,
      )
      .isNotEmpty;

  TeamSubscription? getUserSub({required String userId}) => subscriptions.getWhere(
        (element) => element.subscribedUser.id == userId,
      );

  TeamInvitation? getUserInvite({required String userId}) => invitations.getWhere(
        (element) => element.invitedUser.id == userId,
      );

  List<SuperCalipsoUser> get enrolledUsers => subscriptions.map((e) => e.subscribedUser).toList();
}
