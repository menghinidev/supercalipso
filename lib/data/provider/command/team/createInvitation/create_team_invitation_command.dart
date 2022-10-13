import 'package:freezed_annotation/freezed_annotation.dart';

part 'create_team_invitation_command.freezed.dart';
part 'create_team_invitation_command.g.dart';

@freezed
class CreateTeamInvitationCommand with _$CreateTeamInvitationCommand {
  const CreateTeamInvitationCommand._();

  const factory CreateTeamInvitationCommand({
    required String invitedUserId,
    required String invitedByUserId,
    required String teamId,
    required DateTime createdAt,
  }) = _CreateTeamInvitationCommand;

  factory CreateTeamInvitationCommand.fromJson(Map<String, dynamic> json) =>
      _$CreateTeamInvitationCommandFromJson(json);
}
