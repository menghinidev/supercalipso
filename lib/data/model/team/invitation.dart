import 'package:supercalipso/data/model/user/user.dart';
import 'package:supercalipso/plugin/utils.dart';

class TeamInvitation {
  final String invitationId;
  final SuperCalipsoUser invitedUser;
  final SuperCalipsoUser invitedBy;
  final TimeStamp created;
  final TeamInvitationStatus status;

  TeamInvitation({
    required this.invitationId,
    required this.invitedUser,
    required this.invitedBy,
    required this.created,
    this.status = TeamInvitationStatus.unknown,
  });
}

enum TeamInvitationStatus {
  accepted,
  declied,
  unknown,
}
