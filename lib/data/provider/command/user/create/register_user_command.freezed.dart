// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'register_user_command.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

RegisterUserCommand _$RegisterUserCommandFromJson(Map<String, dynamic> json) {
  return _RegisterUserCommand.fromJson(json);
}

/// @nodoc
mixin _$RegisterUserCommand {
  String get uid => throw _privateConstructorUsedError;
  String get displayName => throw _privateConstructorUsedError;
  String get email => throw _privateConstructorUsedError;
  String? get imageURL => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RegisterUserCommandCopyWith<RegisterUserCommand> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RegisterUserCommandCopyWith<$Res> {
  factory $RegisterUserCommandCopyWith(
          RegisterUserCommand value, $Res Function(RegisterUserCommand) then) =
      _$RegisterUserCommandCopyWithImpl<$Res>;
  $Res call({String uid, String displayName, String email, String? imageURL});
}

/// @nodoc
class _$RegisterUserCommandCopyWithImpl<$Res>
    implements $RegisterUserCommandCopyWith<$Res> {
  _$RegisterUserCommandCopyWithImpl(this._value, this._then);

  final RegisterUserCommand _value;
  // ignore: unused_field
  final $Res Function(RegisterUserCommand) _then;

  @override
  $Res call({
    Object? uid = freezed,
    Object? displayName = freezed,
    Object? email = freezed,
    Object? imageURL = freezed,
  }) {
    return _then(_value.copyWith(
      uid: uid == freezed
          ? _value.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as String,
      displayName: displayName == freezed
          ? _value.displayName
          : displayName // ignore: cast_nullable_to_non_nullable
              as String,
      email: email == freezed
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      imageURL: imageURL == freezed
          ? _value.imageURL
          : imageURL // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
abstract class _$$_RegisterUserCommandCopyWith<$Res>
    implements $RegisterUserCommandCopyWith<$Res> {
  factory _$$_RegisterUserCommandCopyWith(_$_RegisterUserCommand value,
          $Res Function(_$_RegisterUserCommand) then) =
      __$$_RegisterUserCommandCopyWithImpl<$Res>;
  @override
  $Res call({String uid, String displayName, String email, String? imageURL});
}

/// @nodoc
class __$$_RegisterUserCommandCopyWithImpl<$Res>
    extends _$RegisterUserCommandCopyWithImpl<$Res>
    implements _$$_RegisterUserCommandCopyWith<$Res> {
  __$$_RegisterUserCommandCopyWithImpl(_$_RegisterUserCommand _value,
      $Res Function(_$_RegisterUserCommand) _then)
      : super(_value, (v) => _then(v as _$_RegisterUserCommand));

  @override
  _$_RegisterUserCommand get _value => super._value as _$_RegisterUserCommand;

  @override
  $Res call({
    Object? uid = freezed,
    Object? displayName = freezed,
    Object? email = freezed,
    Object? imageURL = freezed,
  }) {
    return _then(_$_RegisterUserCommand(
      uid: uid == freezed
          ? _value.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as String,
      displayName: displayName == freezed
          ? _value.displayName
          : displayName // ignore: cast_nullable_to_non_nullable
              as String,
      email: email == freezed
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      imageURL: imageURL == freezed
          ? _value.imageURL
          : imageURL // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_RegisterUserCommand extends _RegisterUserCommand {
  const _$_RegisterUserCommand(
      {required this.uid,
      required this.displayName,
      required this.email,
      this.imageURL})
      : super._();

  factory _$_RegisterUserCommand.fromJson(Map<String, dynamic> json) =>
      _$$_RegisterUserCommandFromJson(json);

  @override
  final String uid;
  @override
  final String displayName;
  @override
  final String email;
  @override
  final String? imageURL;

  @override
  String toString() {
    return 'RegisterUserCommand(uid: $uid, displayName: $displayName, email: $email, imageURL: $imageURL)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_RegisterUserCommand &&
            const DeepCollectionEquality().equals(other.uid, uid) &&
            const DeepCollectionEquality()
                .equals(other.displayName, displayName) &&
            const DeepCollectionEquality().equals(other.email, email) &&
            const DeepCollectionEquality().equals(other.imageURL, imageURL));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(uid),
      const DeepCollectionEquality().hash(displayName),
      const DeepCollectionEquality().hash(email),
      const DeepCollectionEquality().hash(imageURL));

  @JsonKey(ignore: true)
  @override
  _$$_RegisterUserCommandCopyWith<_$_RegisterUserCommand> get copyWith =>
      __$$_RegisterUserCommandCopyWithImpl<_$_RegisterUserCommand>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_RegisterUserCommandToJson(
      this,
    );
  }
}

abstract class _RegisterUserCommand extends RegisterUserCommand {
  const factory _RegisterUserCommand(
      {required final String uid,
      required final String displayName,
      required final String email,
      final String? imageURL}) = _$_RegisterUserCommand;
  const _RegisterUserCommand._() : super._();

  factory _RegisterUserCommand.fromJson(Map<String, dynamic> json) =
      _$_RegisterUserCommand.fromJson;

  @override
  String get uid;
  @override
  String get displayName;
  @override
  String get email;
  @override
  String? get imageURL;
  @override
  @JsonKey(ignore: true)
  _$$_RegisterUserCommandCopyWith<_$_RegisterUserCommand> get copyWith =>
      throw _privateConstructorUsedError;
}
