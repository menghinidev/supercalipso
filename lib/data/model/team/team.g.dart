// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'team.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Team _$$_TeamFromJson(Map<String, dynamic> json) => _$_Team(
      id: json['id'] as String,
      name: json['name'] as String,
      subscriptions: (json['subscriptions'] as List<dynamic>?)
              ?.map((e) => TeamSubscription.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const <TeamSubscription>[],
      invitations: (json['invitations'] as List<dynamic>?)
              ?.map((e) => TeamInvitation.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const <TeamInvitation>[],
    );

Map<String, dynamic> _$$_TeamToJson(_$_Team instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'subscriptions': instance.subscriptions,
      'invitations': instance.invitations,
    };
