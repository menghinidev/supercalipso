import 'package:freezed_annotation/freezed_annotation.dart';
part 'invitation.freezed.dart';
part 'invitation.g.dart';

@freezed
class TeamInvitation with _$TeamInvitation {
  const factory TeamInvitation({
    required final String id,
    required final String teamId,
    required final String invitedUserId,
    required final String invitedByUserId,
    required final DateTime created,
    @Default(TeamInvitationStatus.unknown) TeamInvitationStatus status,
  }) = _TeamInvitation;

  factory TeamInvitation.fromJson(Map<String, Object?> json) => _$TeamInvitationFromJson(json);
}

enum TeamInvitationStatus {
  accepted,
  declied,
  unknown;

  static TeamInvitationStatus fromString(String value) {
    if (value == TeamInvitationStatus.accepted.name) {
      return TeamInvitationStatus.accepted;
    } else if (value == TeamInvitationStatus.declied.name) {
      return TeamInvitationStatus.declied;
    }
    return TeamInvitationStatus.unknown;
  }
}

extension TeamInvitationFeature on TeamInvitation {
  T onStatus<T>(T Function() fallback, {T Function()? onAccepted, T Function()? onDeclied}) {
    if (status == TeamInvitationStatus.accepted && onAccepted != null) return onAccepted();
    if (status == TeamInvitationStatus.declied && onDeclied != null) return onDeclied();
    return fallback();
  }
}
