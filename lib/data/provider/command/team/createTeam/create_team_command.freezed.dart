// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'create_team_command.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

CreateTeamCommand _$CreateTeamCommandFromJson(Map<String, dynamic> json) {
  return _CreateTeamCommand.fromJson(json);
}

/// @nodoc
mixin _$CreateTeamCommand {
  String get name => throw _privateConstructorUsedError;
  String get userId => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CreateTeamCommandCopyWith<CreateTeamCommand> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CreateTeamCommandCopyWith<$Res> {
  factory $CreateTeamCommandCopyWith(
          CreateTeamCommand value, $Res Function(CreateTeamCommand) then) =
      _$CreateTeamCommandCopyWithImpl<$Res>;
  $Res call({String name, String userId});
}

/// @nodoc
class _$CreateTeamCommandCopyWithImpl<$Res>
    implements $CreateTeamCommandCopyWith<$Res> {
  _$CreateTeamCommandCopyWithImpl(this._value, this._then);

  final CreateTeamCommand _value;
  // ignore: unused_field
  final $Res Function(CreateTeamCommand) _then;

  @override
  $Res call({
    Object? name = freezed,
    Object? userId = freezed,
  }) {
    return _then(_value.copyWith(
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      userId: userId == freezed
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$$_CreateTeamCommandCopyWith<$Res>
    implements $CreateTeamCommandCopyWith<$Res> {
  factory _$$_CreateTeamCommandCopyWith(_$_CreateTeamCommand value,
          $Res Function(_$_CreateTeamCommand) then) =
      __$$_CreateTeamCommandCopyWithImpl<$Res>;
  @override
  $Res call({String name, String userId});
}

/// @nodoc
class __$$_CreateTeamCommandCopyWithImpl<$Res>
    extends _$CreateTeamCommandCopyWithImpl<$Res>
    implements _$$_CreateTeamCommandCopyWith<$Res> {
  __$$_CreateTeamCommandCopyWithImpl(
      _$_CreateTeamCommand _value, $Res Function(_$_CreateTeamCommand) _then)
      : super(_value, (v) => _then(v as _$_CreateTeamCommand));

  @override
  _$_CreateTeamCommand get _value => super._value as _$_CreateTeamCommand;

  @override
  $Res call({
    Object? name = freezed,
    Object? userId = freezed,
  }) {
    return _then(_$_CreateTeamCommand(
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      userId: userId == freezed
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_CreateTeamCommand extends _CreateTeamCommand {
  const _$_CreateTeamCommand({required this.name, required this.userId})
      : super._();

  factory _$_CreateTeamCommand.fromJson(Map<String, dynamic> json) =>
      _$$_CreateTeamCommandFromJson(json);

  @override
  final String name;
  @override
  final String userId;

  @override
  String toString() {
    return 'CreateTeamCommand(name: $name, userId: $userId)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_CreateTeamCommand &&
            const DeepCollectionEquality().equals(other.name, name) &&
            const DeepCollectionEquality().equals(other.userId, userId));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(name),
      const DeepCollectionEquality().hash(userId));

  @JsonKey(ignore: true)
  @override
  _$$_CreateTeamCommandCopyWith<_$_CreateTeamCommand> get copyWith =>
      __$$_CreateTeamCommandCopyWithImpl<_$_CreateTeamCommand>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_CreateTeamCommandToJson(
      this,
    );
  }
}

abstract class _CreateTeamCommand extends CreateTeamCommand {
  const factory _CreateTeamCommand(
      {required final String name,
      required final String userId}) = _$_CreateTeamCommand;
  const _CreateTeamCommand._() : super._();

  factory _CreateTeamCommand.fromJson(Map<String, dynamic> json) =
      _$_CreateTeamCommand.fromJson;

  @override
  String get name;
  @override
  String get userId;
  @override
  @JsonKey(ignore: true)
  _$$_CreateTeamCommandCopyWith<_$_CreateTeamCommand> get copyWith =>
      throw _privateConstructorUsedError;
}
