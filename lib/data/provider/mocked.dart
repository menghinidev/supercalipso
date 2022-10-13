import 'package:supercalipso/data/model/event/team_event.dart';
import 'package:supercalipso/data/model/note/note.dart';
import 'package:supercalipso/data/model/team/invitation/invitation.dart';
import 'package:supercalipso/data/model/team/subscription/subscription.dart';
import 'package:supercalipso/data/model/team/team.dart';
import 'package:supercalipso/data/model/user/user.dart';
import 'package:uuid/uuid.dart';

class MockValues with IdentifierFactory {
  static final MockValues _singleton = MockValues._();
  static MockValues get instance => _singleton;

  late User firstUser;
  late User secondUser;
  late User thirdUser;

  late List<User> users;
  late List<TeamSubscription> teamSubs;
  late List<TeamInvitation> teamInvites;
  late List<Team> teams;
  late List<TeamEvent> events;
  late List<Note> notes;

  MockValues._() {
    firstUser = const User(uid: '1', displayName: 'Lu Cello', email: 'lorenzo@email.com');
    secondUser = const User(uid: '2', displayName: 'Lu Cavallo', email: 'lucavallo@email.com');
    thirdUser = const User(uid: '3', displayName: 'Lalli Gatore', email: 'lalligatore@email.com');
    users = [firstUser, secondUser, thirdUser];
    teamSubs = <TeamSubscription>[];
    teamInvites = <TeamInvitation>[];
    events = <TeamEvent>[];
    notes = <Note>[];
    var initialTeam = Team(id: createID(), name: 'Tim');
    teams = [initialTeam];
    teamSubs.addAll([
      TeamSubscription(
        id: createID(),
        teamId: initialTeam.id,
        subscribedUserId: secondUser.uid,
        joined: DateTime.now().subtract(const Duration(days: 45)),
      ),
    ]);
    teamInvites.addAll([
      TeamInvitation(
        id: createID(),
        teamId: initialTeam.id,
        invitedUserId: firstUser.uid,
        invitedByUserId: secondUser.uid,
        created: DateTime.now(),
        status: TeamInvitationStatus.unknown,
      ),
    ]);
  }
}

mixin IdentifierFactory {
  String createID() {
    var uuid = const Uuid().v1();
    var cleanUuid = uuid.replaceAll(r'-', '');
    return cleanUuid;
  }
}
