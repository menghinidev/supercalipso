import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:supercalipso/data/model/team/team.dart';
import 'package:supercalipso/data/model/user/user.dart';

part 'invitation.freezed.dart';
part 'invitation.g.dart';

@freezed
class TeamInvitation with _$TeamInvitation {
  const factory TeamInvitation({
    required final String invitationId,
    required final Team team,
    required final User invitedUser,
    required final User invitedBy,
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
