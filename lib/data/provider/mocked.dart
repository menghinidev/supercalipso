import 'package:supercalipso/data/model/event/team_event.dart';
import 'package:supercalipso/data/model/note/note.dart';
import 'package:supercalipso/data/model/task/task.dart';
import 'package:supercalipso/data/model/team/invitation/invitation.dart';
import 'package:supercalipso/data/model/team/subscription/subscription.dart';
import 'package:supercalipso/data/model/team/team.dart';
import 'package:supercalipso/data/model/user/user.dart';
import 'package:uuid/uuid.dart';

class MockValues with IdentifierFactory {
  static final MockValues _singleton = MockValues._();
  static MockValues get instance => _singleton;

  final users = <User>[
    const User(uid: 'testid', displayName: 'Nome Utente', email: 'utente@utente.com'),
  ];
  final teamSubs = <TeamSubscription>[];
  final teamInvites = <TeamInvitation>[];
  final teams = <Team>[];
  final events = <TeamEvent>[];
  final notes = <Note>[];
  final tasks = <Task>[];

  MockValues._();
}

mixin IdentifierFactory {
  String createID() {
    var uuid = const Uuid().v1();
    var cleanUuid = uuid.replaceAll(r'-', '');
    return cleanUuid;
  }
}
