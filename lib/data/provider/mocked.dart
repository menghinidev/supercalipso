import 'package:supercalipso/data/model/event/team_event.dart';
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

  MockValues._() {
    firstUser = const User(id: '1', name: 'Lu Cello', email: 'lorenzo@email.com');
    secondUser = const User(id: '2', name: 'Lu Cavallo', email: 'lucavallo@email.com');
    thirdUser = const User(id: '3', name: 'Lalli Gatore', email: 'lalligatore@email.com');
    users = [firstUser, secondUser, thirdUser];
    teamSubs = <TeamSubscription>[];
    teamInvites = <TeamInvitation>[];
    events = <TeamEvent>[];
    var initialTeam = Team(id: createID(), name: 'Tim', subscriptions: teamSubs, invitations: teamInvites);
    teams = [initialTeam];
    teamSubs.addAll([
      TeamSubscription(
        team: initialTeam,
        subscribedUser: secondUser,
        joined: DateTime.now().subtract(const Duration(days: 45)),
      ),
    ]);
    teamInvites.addAll([
      TeamInvitation(
        invitationId: createID(),
        team: initialTeam,
        invitedUser: firstUser,
        invitedBy: secondUser,
        created: DateTime.now(),
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
