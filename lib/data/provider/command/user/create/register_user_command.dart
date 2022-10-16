import 'package:freezed_annotation/freezed_annotation.dart';

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
