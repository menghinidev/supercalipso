// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'invitation.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_TeamInvitation _$$_TeamInvitationFromJson(Map<String, dynamic> json) =>
    _$_TeamInvitation(
      invitationId: json['invitationId'] as String,
      team: Team.fromJson(json['team'] as Map<String, dynamic>),
      invitedUser: User.fromJson(json['invitedUser'] as Map<String, dynamic>),
      invitedBy: User.fromJson(json['invitedBy'] as Map<String, dynamic>),
      created: DateTime.parse(json['created'] as String),
      status:
          $enumDecodeNullable(_$TeamInvitationStatusEnumMap, json['status']) ??
              TeamInvitationStatus.unknown,
    );

Map<String, dynamic> _$$_TeamInvitationToJson(_$_TeamInvitation instance) =>
    <String, dynamic>{
      'invitationId': instance.invitationId,
      'team': instance.team,
      'invitedUser': instance.invitedUser,
      'invitedBy': instance.invitedBy,
      'created': instance.created.toIso8601String(),
      'status': _$TeamInvitationStatusEnumMap[instance.status]!,
    };

const _$TeamInvitationStatusEnumMap = {
  TeamInvitationStatus.accepted: 'accepted',
  TeamInvitationStatus.declied: 'declied',
  TeamInvitationStatus.unknown: 'unknown',
};
