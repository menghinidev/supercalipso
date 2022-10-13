import 'package:freezed_annotation/freezed_annotation.dart';

part 'replayto_invitation_command.freezed.dart';
part 'replayto_invitation_command.g.dart';

@freezed
class ReplayToInvitationCommand with _$ReplayToInvitationCommand {
  const factory ReplayToInvitationCommand({
    required String invitationId,
    required String status,
  }) = _ReplayToInvitationCommand;

  factory ReplayToInvitationCommand.fromJson(Map<String, dynamic> json) => _$ReplayToInvitationCommandFromJson(json);
}
