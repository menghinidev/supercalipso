// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

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
  String get status => throw _privateConstructorUsedError;

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
      _$CreateTeamInvitationCommandCopyWithImpl<$Res,
          CreateTeamInvitationCommand>;
  @useResult
  $Res call(
      {String invitedUserId,
      String invitedByUserId,
      String teamId,
      DateTime createdAt,
      String status});
}

/// @nodoc
class _$CreateTeamInvitationCommandCopyWithImpl<$Res,
        $Val extends CreateTeamInvitationCommand>
    implements $CreateTeamInvitationCommandCopyWith<$Res> {
  _$CreateTeamInvitationCommandCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? invitedUserId = null,
    Object? invitedByUserId = null,
    Object? teamId = null,
    Object? createdAt = null,
    Object? status = null,
  }) {
    return _then(_value.copyWith(
      invitedUserId: null == invitedUserId
          ? _value.invitedUserId
          : invitedUserId // ignore: cast_nullable_to_non_nullable
              as String,
      invitedByUserId: null == invitedByUserId
          ? _value.invitedByUserId
          : invitedByUserId // ignore: cast_nullable_to_non_nullable
              as String,
      teamId: null == teamId
          ? _value.teamId
          : teamId // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
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
  @useResult
  $Res call(
      {String invitedUserId,
      String invitedByUserId,
      String teamId,
      DateTime createdAt,
      String status});
}

/// @nodoc
class __$$_CreateTeamInvitationCommandCopyWithImpl<$Res>
    extends _$CreateTeamInvitationCommandCopyWithImpl<$Res,
        _$_CreateTeamInvitationCommand>
    implements _$$_CreateTeamInvitationCommandCopyWith<$Res> {
  __$$_CreateTeamInvitationCommandCopyWithImpl(
      _$_CreateTeamInvitationCommand _value,
      $Res Function(_$_CreateTeamInvitationCommand) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? invitedUserId = null,
    Object? invitedByUserId = null,
    Object? teamId = null,
    Object? createdAt = null,
    Object? status = null,
  }) {
    return _then(_$_CreateTeamInvitationCommand(
      invitedUserId: null == invitedUserId
          ? _value.invitedUserId
          : invitedUserId // ignore: cast_nullable_to_non_nullable
              as String,
      invitedByUserId: null == invitedByUserId
          ? _value.invitedByUserId
          : invitedByUserId // ignore: cast_nullable_to_non_nullable
              as String,
      teamId: null == teamId
          ? _value.teamId
          : teamId // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
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
      required this.createdAt,
      required this.status})
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
  final String status;

  @override
  String toString() {
    return 'CreateTeamInvitationCommand(invitedUserId: $invitedUserId, invitedByUserId: $invitedByUserId, teamId: $teamId, createdAt: $createdAt, status: $status)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_CreateTeamInvitationCommand &&
            (identical(other.invitedUserId, invitedUserId) ||
                other.invitedUserId == invitedUserId) &&
            (identical(other.invitedByUserId, invitedByUserId) ||
                other.invitedByUserId == invitedByUserId) &&
            (identical(other.teamId, teamId) || other.teamId == teamId) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.status, status) || other.status == status));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, invitedUserId, invitedByUserId, teamId, createdAt, status);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
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
      required final DateTime createdAt,
      required final String status}) = _$_CreateTeamInvitationCommand;
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
  String get status;
  @override
  @JsonKey(ignore: true)
  _$$_CreateTeamInvitationCommandCopyWith<_$_CreateTeamInvitationCommand>
      get copyWith => throw _privateConstructorUsedError;
}
