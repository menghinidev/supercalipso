// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_team_invitation_command.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_CreateTeamInvitationCommand _$$_CreateTeamInvitationCommandFromJson(
        Map<String, dynamic> json) =>
    _$_CreateTeamInvitationCommand(
      invitedUserId: json['invitedUserId'] as String,
      invitedByUserId: json['invitedByUserId'] as String,
      teamId: json['teamId'] as String,
      createdAt: DateTime.parse(json['createdAt'] as String),
      status: json['status'] as String,
    );

Map<String, dynamic> _$$_CreateTeamInvitationCommandToJson(
        _$_CreateTeamInvitationCommand instance) =>
    <String, dynamic>{
      'invitedUserId': instance.invitedUserId,
      'invitedByUserId': instance.invitedByUserId,
      'teamId': instance.teamId,
      'createdAt': instance.createdAt.toIso8601String(),
      'status': instance.status,
    };
