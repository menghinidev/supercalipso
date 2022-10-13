import 'package:freezed_annotation/freezed_annotation.dart';

part 'subscription.g.dart';
part 'subscription.freezed.dart';

@freezed
class TeamSubscription with _$TeamSubscription {
  const factory TeamSubscription({
    required String id,
    required String subscribedUserId,
    required String teamId,
    required DateTime joined,
  }) = _TeamSubscription;

  factory TeamSubscription.fromJson(Map<String, Object?> json) => _$TeamSubscriptionFromJson(json);
}
