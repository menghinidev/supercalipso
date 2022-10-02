import 'package:supercalipso/data/model/asset/asset.dart';
import 'package:supercalipso/data/model/team/invitation/invitation.dart';
import 'package:supercalipso/data/model/team/subscription/subscription.dart';
import 'package:supercalipso/data/model/team/team.dart';
import 'package:supercalipso/data/model/user/user.dart';

class MockValues {
  static final MockValues _singleton = MockValues._();
  static MockValues get instance => _singleton;

  final firstUser = const User(id: '1', name: 'Lu Cello', email: 'lorenzo@email.com');
  final secondUser = const User(id: '2', name: 'Lu Cavallo', email: 'lucavallo@email.com');
  final thirdUser = const User(id: '3', name: 'Lalli Gatore', email: 'lalligatore@email.com');
  late List<TeamSubscription> teamSubs;
  late List<TeamInvitation> teamInvites;
  late List<Asset> assets;
  late List<Team> teams;

  MockValues._() {
    teamSubs = [
      TeamSubscription(
        subscribedUser: firstUser,
        joined: DateTime.now().subtract(const Duration(days: 30)),
      ),
      TeamSubscription(
        subscribedUser: thirdUser,
        joined: DateTime.now().add(const Duration(days: 45)),
      ),
    ];
    teamInvites = [
      TeamInvitation(
        invitationId: '1',
        invitedUser: secondUser,
        invitedBy: firstUser,
        created: DateTime.now(),
      ),
    ];
    assets = [
      Asset(assetId: '1', teamId: '1', name: 'Lavatrice'),
      Asset(assetId: '2', teamId: '1', name: 'Tv'),
      Asset(assetId: '3', teamId: '1', name: 'Supercalipso'),
    ];
    teams = [
      Team(id: '1', name: 'CasaBolo', subscriptions: teamSubs, invitations: teamInvites),
    ];
  }
}
