import 'package:supercalipso/data/model/user/user.dart';
import 'package:supercalipso/plugin/bloc.dart';

class Unauthenticated extends BlocState {}

class Authenticated extends BlocState {
  final SuperCalipsoUser user;

  Authenticated({required this.user});
}
