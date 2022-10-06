// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'subscription.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_TeamSubscription _$$_TeamSubscriptionFromJson(Map<String, dynamic> json) =>
    _$_TeamSubscription(
      subscribedUser:
          User.fromJson(json['subscribedUser'] as Map<String, dynamic>),
      team: Team.fromJson(json['team'] as Map<String, dynamic>),
      joined: DateTime.parse(json['joined'] as String),
    );

Map<String, dynamic> _$$_TeamSubscriptionToJson(_$_TeamSubscription instance) =>
    <String, dynamic>{
      'subscribedUser': instance.subscribedUser,
      'team': instance.team,
      'joined': instance.joined.toIso8601String(),
    };
