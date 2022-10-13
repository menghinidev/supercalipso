// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'subscription.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_TeamSubscription _$$_TeamSubscriptionFromJson(Map<String, dynamic> json) =>
    _$_TeamSubscription(
      id: json['id'] as String,
      subscribedUserId: json['subscribedUserId'] as String,
      teamId: json['teamId'] as String,
      joined: DateTime.parse(json['joined'] as String),
    );

Map<String, dynamic> _$$_TeamSubscriptionToJson(_$_TeamSubscription instance) =>
    <String, dynamic>{
      'id': instance.id,
      'subscribedUserId': instance.subscribedUserId,
      'teamId': instance.teamId,
      'joined': instance.joined.toIso8601String(),
    };
