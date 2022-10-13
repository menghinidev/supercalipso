// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'create_team_invitation_command.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

CreateTeamInvitationCommand _$CreateTeamInvitationCommandFromJson(
    Map<String, dynamic> json) {
  return _CreateTeamInvitationCommand.fromJson(json);
}

/// @nodoc
mixin _$CreateTeamInvitationCommand {
  String get invitedUserId => throw _privateConstructorUsedError;
  String get invitedByUserId => throw _privateConstructorUsedError;
  String get teamId => throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CreateTeamInvitationCommandCopyWith<CreateTeamInvitationCommand>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CreateTeamInvitationCommandCopyWith<$Res> {
  factory $CreateTeamInvitationCommandCopyWith(
          CreateTeamInvitationCommand value,
          $Res Function(CreateTeamInvitationCommand) then) =
      _$CreateTeamInvitationCommandCopyWithImpl<$Res>;
  $Res call(
      {String invitedUserId,
      String invitedByUserId,
      String teamId,
      DateTime createdAt});
}

/// @nodoc
class _$CreateTeamInvitationCommandCopyWithImpl<$Res>
    implements $CreateTeamInvitationCommandCopyWith<$Res> {
  _$CreateTeamInvitationCommandCopyWithImpl(this._value, this._then);

  final CreateTeamInvitationCommand _value;
  // ignore: unused_field
  final $Res Function(CreateTeamInvitationCommand) _then;

  @override
  $Res call({
    Object? invitedUserId = freezed,
    Object? invitedByUserId = freezed,
    Object? teamId = freezed,
    Object? createdAt = freezed,
  }) {
    return _then(_value.copyWith(
      invitedUserId: invitedUserId == freezed
          ? _value.invitedUserId
          : invitedUserId // ignore: cast_nullable_to_non_nullable
              as String,
      invitedByUserId: invitedByUserId == freezed
          ? _value.invitedByUserId
          : invitedByUserId // ignore: cast_nullable_to_non_nullable
              as String,
      teamId: teamId == freezed
          ? _value.teamId
          : teamId // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: createdAt == freezed
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
abstract class _$$_CreateTeamInvitationCommandCopyWith<$Res>
    implements $CreateTeamInvitationCommandCopyWith<$Res> {
  factory _$$_CreateTeamInvitationCommandCopyWith(
          _$_CreateTeamInvitationCommand value,
          $Res Function(_$_CreateTeamInvitationCommand) then) =
      __$$_CreateTeamInvitationCommandCopyWithImpl<$Res>;
  @override
  $Res call(
      {String invitedUserId,
      String invitedByUserId,
      String teamId,
      DateTime createdAt});
}

/// @nodoc
class __$$_CreateTeamInvitationCommandCopyWithImpl<$Res>
    extends _$CreateTeamInvitationCommandCopyWithImpl<$Res>
    implements _$$_CreateTeamInvitationCommandCopyWith<$Res> {
  __$$_CreateTeamInvitationCommandCopyWithImpl(
      _$_CreateTeamInvitationCommand _value,
      $Res Function(_$_CreateTeamInvitationCommand) _then)
      : super(_value, (v) => _then(v as _$_CreateTeamInvitationCommand));

  @override
  _$_CreateTeamInvitationCommand get _value =>
      super._value as _$_CreateTeamInvitationCommand;

  @override
  $Res call({
    Object? invitedUserId = freezed,
    Object? invitedByUserId = freezed,
    Object? teamId = freezed,
    Object? createdAt = freezed,
  }) {
    return _then(_$_CreateTeamInvitationCommand(
      invitedUserId: invitedUserId == freezed
          ? _value.invitedUserId
          : invitedUserId // ignore: cast_nullable_to_non_nullable
              as String,
      invitedByUserId: invitedByUserId == freezed
          ? _value.invitedByUserId
          : invitedByUserId // ignore: cast_nullable_to_non_nullable
              as String,
      teamId: teamId == freezed
          ? _value.teamId
          : teamId // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: createdAt == freezed
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_CreateTeamInvitationCommand extends _CreateTeamInvitationCommand {
  const _$_CreateTeamInvitationCommand(
      {required this.invitedUserId,
      required this.invitedByUserId,
      required this.teamId,
      required this.createdAt})
      : super._();

  factory _$_CreateTeamInvitationCommand.fromJson(Map<String, dynamic> json) =>
      _$$_CreateTeamInvitationCommandFromJson(json);

  @override
  final String invitedUserId;
  @override
  final String invitedByUserId;
  @override
  final String teamId;
  @override
  final DateTime createdAt;

  @override
  String toString() {
    return 'CreateTeamInvitationCommand(invitedUserId: $invitedUserId, invitedByUserId: $invitedByUserId, teamId: $teamId, createdAt: $createdAt)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_CreateTeamInvitationCommand &&
            const DeepCollectionEquality()
                .equals(other.invitedUserId, invitedUserId) &&
            const DeepCollectionEquality()
                .equals(other.invitedByUserId, invitedByUserId) &&
            const DeepCollectionEquality().equals(other.teamId, teamId) &&
            const DeepCollectionEquality().equals(other.createdAt, createdAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(invitedUserId),
      const DeepCollectionEquality().hash(invitedByUserId),
      const DeepCollectionEquality().hash(teamId),
      const DeepCollectionEquality().hash(createdAt));

  @JsonKey(ignore: true)
  @override
  _$$_CreateTeamInvitationCommandCopyWith<_$_CreateTeamInvitationCommand>
      get copyWith => __$$_CreateTeamInvitationCommandCopyWithImpl<
          _$_CreateTeamInvitationCommand>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_CreateTeamInvitationCommandToJson(
      this,
    );
  }
}

abstract class _CreateTeamInvitationCommand
    extends CreateTeamInvitationCommand {
  const factory _CreateTeamInvitationCommand(
      {required final String invitedUserId,
      required final String invitedByUserId,
      required final String teamId,
      required final DateTime createdAt}) = _$_CreateTeamInvitationCommand;
  const _CreateTeamInvitationCommand._() : super._();

  factory _CreateTeamInvitationCommand.fromJson(Map<String, dynamic> json) =
      _$_CreateTeamInvitationCommand.fromJson;

  @override
  String get invitedUserId;
  @override
  String get invitedByUserId;
  @override
  String get teamId;
  @override
  DateTime get createdAt;
  @override
  @JsonKey(ignore: true)
  _$$_CreateTeamInvitationCommandCopyWith<_$_CreateTeamInvitationCommand>
      get copyWith => throw _privateConstructorUsedError;
}
