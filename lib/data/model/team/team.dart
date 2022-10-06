import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:supercalipso/data/model/team/invitation/invitation.dart';
import 'package:supercalipso/data/model/team/subscription/subscription.dart';
import 'package:supercalipso/data/model/user/user.dart';

part 'team.g.dart';
part 'team.freezed.dart';

@freezed
class Team with _$Team {
  const Team._();
  const factory Team({
    required String id,
    required String name,
    @Default(<TeamSubscription>[]) List<TeamSubscription> subscriptions,
    @Default(<TeamInvitation>[]) List<TeamInvitation> invitations,
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

  TeamSubscription? getUserSub({required String userId}) {
    var res = subscriptions.where((element) => element.subscribedUser.id == userId);
    return res.isEmpty ? null : res.first;
  }

  TeamInvitation? getUserInvite({required String userId}) {
    var res = invitations.where((element) => element.invitedUser.id == userId);
    return res.isEmpty ? null : res.first;
  }

  List<User> get enrolledUsers => subscriptions.map((e) => e.subscribedUser).toList();
}
