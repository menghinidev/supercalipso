import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:supercalipso/data/model/user/user.dart';

part 'register_user_command.freezed.dart';
part 'register_user_command.g.dart';

@freezed
class RegisterUserCommand with _$RegisterUserCommand {
  const RegisterUserCommand._();

  const factory RegisterUserCommand({
    required String uid,
    required String displayName,
    required String email,
    String? imageURL,
  }) = _RegisterUserCommand;

  factory RegisterUserCommand.fromJson(Map<String, dynamic> json) => _$RegisterUserCommandFromJson(json);
}

extension RegisterUserCommandFeature on RegisterUserCommand {
  User createUserDTO() => User(
        uid: uid,
        displayName: displayName,
        email: email,
        imageURL: imageURL,
      );
}
