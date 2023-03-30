import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:supercalipso/data/model/user/user.dart';

part 'authstate.freezed.dart';

@freezed
class AuthState with _$AuthState {
  const factory AuthState.auth({required User user}) = Auth;
  const factory AuthState.unauth() = Unauth;
}
