import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:supercalipso/data/model/team/invitation/invitation.dart';
import 'package:supercalipso/data/model/team/subscription/subscription.dart';
import 'package:supercalipso/data/model/user/user.dart';

part 'team.g.dart';
part 'team.freezed.dart';

@freezed
class Team with _$Team {
  const factory Team({
    required String id,
    required String name,
    @Default(<TeamSubscription>[]) subscriptions,
    @Default(<TeamInvitation>[]) invitations,
  }) = _Team;

  factory Team.fromJson(Map<String, Object?> json) => _$TeamFromJson(json);
}

extension TeamOperations on Team {
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

  List<User> get enrolledUsers => subscriptions.map((e) => e.subscribedUser).toList();
}
