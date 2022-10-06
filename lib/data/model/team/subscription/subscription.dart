import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:supercalipso/data/model/team/team.dart';
import 'package:supercalipso/data/model/user/user.dart';

part 'subscription.g.dart';
part 'subscription.freezed.dart';

@freezed
class TeamSubscription with _$TeamSubscription {
  const factory TeamSubscription({
    required User subscribedUser,
    required Team team,
    required DateTime joined,
  }) = _TeamSubscription;

  factory TeamSubscription.fromJson(Map<String, Object?> json) => _$TeamSubscriptionFromJson(json);
}
