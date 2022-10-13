import 'package:freezed_annotation/freezed_annotation.dart';

part 'replayto_invitation_command.freezed.dart';
part 'replayto_invitation_command.g.dart';

@freezed
class ReplyToInvitationCommand with _$ReplyToInvitationCommand {
  const ReplyToInvitationCommand._();
  const factory ReplyToInvitationCommand({
    required String invitationId,
    required String status,
  }) = _ReplyToInvitationCommand;

  factory ReplyToInvitationCommand.fromJson(Map<String, dynamic> json) => _$ReplyToInvitationCommandFromJson(json);
}
