import 'package:freezed_annotation/freezed_annotation.dart';
part 'user.freezed.dart';
part 'user.g.dart';

@freezed
class User with _$User {
  const factory User({required String uid, required String displayName, required String email}) = _User;

  factory User.fromJson(Map<String, Object?> json) => _$UserFromJson(json);
}

extension UserListExtension on Iterable<User> {
  String concatNames() => fold(
        '',
        (p, e) => p.isEmpty ? e.displayName : '$p, ${e.displayName}',
      );
}
