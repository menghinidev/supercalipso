// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'invitation.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_TeamInvitation _$$_TeamInvitationFromJson(Map<String, dynamic> json) =>
    _$_TeamInvitation(
      id: json['id'] as String,
      teamId: json['teamId'] as String,
      invitedUserId: json['invitedUserId'] as String,
      invitedByUserId: json['invitedByUserId'] as String,
      created: DateTime.parse(json['created'] as String),
      status:
          $enumDecodeNullable(_$TeamInvitationStatusEnumMap, json['status']) ??
              TeamInvitationStatus.unknown,
    );

Map<String, dynamic> _$$_TeamInvitationToJson(_$_TeamInvitation instance) =>
    <String, dynamic>{
      'id': instance.id,
      'teamId': instance.teamId,
      'invitedUserId': instance.invitedUserId,
      'invitedByUserId': instance.invitedByUserId,
      'created': instance.created.toIso8601String(),
      'status': _$TeamInvitationStatusEnumMap[instance.status]!,
    };

const _$TeamInvitationStatusEnumMap = {
  TeamInvitationStatus.accepted: 'accepted',
  TeamInvitationStatus.declied: 'declied',
  TeamInvitationStatus.unknown: 'unknown',
};
