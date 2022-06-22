import 'package:supercalipso/data/model/user/user.dart';
import 'package:supercalipso/plugin/utils.dart';

class TeamSubscription {
  final SuperCalipsoUser subscribedUser;
  final TimeStamp joined;

  TeamSubscription({required this.subscribedUser, required this.joined});
}
