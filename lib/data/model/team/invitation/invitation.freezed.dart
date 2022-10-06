// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'invitation.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

TeamInvitation _$TeamInvitationFromJson(Map<String, dynamic> json) {
  return _TeamInvitation.fromJson(json);
}

/// @nodoc
mixin _$TeamInvitation {
  String get invitationId => throw _privateConstructorUsedError;
  Team get team => throw _privateConstructorUsedError;
  User get invitedUser => throw _privateConstructorUsedError;
  User get invitedBy => throw _privateConstructorUsedError;
  DateTime get created => throw _privateConstructorUsedError;
  TeamInvitationStatus get status => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TeamInvitationCopyWith<TeamInvitation> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TeamInvitationCopyWith<$Res> {
  factory $TeamInvitationCopyWith(
          TeamInvitation value, $Res Function(TeamInvitation) then) =
      _$TeamInvitationCopyWithImpl<$Res>;
  $Res call(
      {String invitationId,
      Team team,
      User invitedUser,
      User invitedBy,
      DateTime created,
      TeamInvitationStatus status});

  $TeamCopyWith<$Res> get team;
  $UserCopyWith<$Res> get invitedUser;
  $UserCopyWith<$Res> get invitedBy;
}

/// @nodoc
class _$TeamInvitationCopyWithImpl<$Res>
    implements $TeamInvitationCopyWith<$Res> {
  _$TeamInvitationCopyWithImpl(this._value, this._then);

  final TeamInvitation _value;
  // ignore: unused_field
  final $Res Function(TeamInvitation) _then;

  @override
  $Res call({
    Object? invitationId = freezed,
    Object? team = freezed,
    Object? invitedUser = freezed,
    Object? invitedBy = freezed,
    Object? created = freezed,
    Object? status = freezed,
  }) {
    return _then(_value.copyWith(
      invitationId: invitationId == freezed
          ? _value.invitationId
          : invitationId // ignore: cast_nullable_to_non_nullable
              as String,
      team: team == freezed
          ? _value.team
          : team // ignore: cast_nullable_to_non_nullable
              as Team,
      invitedUser: invitedUser == freezed
          ? _value.invitedUser
          : invitedUser // ignore: cast_nullable_to_non_nullable
              as User,
      invitedBy: invitedBy == freezed
          ? _value.invitedBy
          : invitedBy // ignore: cast_nullable_to_non_nullable
              as User,
      created: created == freezed
          ? _value.created
          : created // ignore: cast_nullable_to_non_nullable
              as DateTime,
      status: status == freezed
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as TeamInvitationStatus,
    ));
  }

  @override
  $TeamCopyWith<$Res> get team {
    return $TeamCopyWith<$Res>(_value.team, (value) {
      return _then(_value.copyWith(team: value));
    });
  }

  @override
  $UserCopyWith<$Res> get invitedUser {
    return $UserCopyWith<$Res>(_value.invitedUser, (value) {
      return _then(_value.copyWith(invitedUser: value));
    });
  }

  @override
  $UserCopyWith<$Res> get invitedBy {
    return $UserCopyWith<$Res>(_value.invitedBy, (value) {
      return _then(_value.copyWith(invitedBy: value));
    });
  }
}

/// @nodoc
abstract class _$$_TeamInvitationCopyWith<$Res>
    implements $TeamInvitationCopyWith<$Res> {
  factory _$$_TeamInvitationCopyWith(
          _$_TeamInvitation value, $Res Function(_$_TeamInvitation) then) =
      __$$_TeamInvitationCopyWithImpl<$Res>;
  @override
  $Res call(
      {String invitationId,
      Team team,
      User invitedUser,
      User invitedBy,
      DateTime created,
      TeamInvitationStatus status});

  @override
  $TeamCopyWith<$Res> get team;
  @override
  $UserCopyWith<$Res> get invitedUser;
  @override
  $UserCopyWith<$Res> get invitedBy;
}

/// @nodoc
class __$$_TeamInvitationCopyWithImpl<$Res>
    extends _$TeamInvitationCopyWithImpl<$Res>
    implements _$$_TeamInvitationCopyWith<$Res> {
  __$$_TeamInvitationCopyWithImpl(
      _$_TeamInvitation _value, $Res Function(_$_TeamInvitation) _then)
      : super(_value, (v) => _then(v as _$_TeamInvitation));

  @override
  _$_TeamInvitation get _value => super._value as _$_TeamInvitation;

  @override
  $Res call({
    Object? invitationId = freezed,
    Object? team = freezed,
    Object? invitedUser = freezed,
    Object? invitedBy = freezed,
    Object? created = freezed,
    Object? status = freezed,
  }) {
    return _then(_$_TeamInvitation(
      invitationId: invitationId == freezed
          ? _value.invitationId
          : invitationId // ignore: cast_nullable_to_non_nullable
              as String,
      team: team == freezed
          ? _value.team
          : team // ignore: cast_nullable_to_non_nullable
              as Team,
      invitedUser: invitedUser == freezed
          ? _value.invitedUser
          : invitedUser // ignore: cast_nullable_to_non_nullable
              as User,
      invitedBy: invitedBy == freezed
          ? _value.invitedBy
          : invitedBy // ignore: cast_nullable_to_non_nullable
              as User,
      created: created == freezed
          ? _value.created
          : created // ignore: cast_nullable_to_non_nullable
              as DateTime,
      status: status == freezed
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as TeamInvitationStatus,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_TeamInvitation implements _TeamInvitation {
  const _$_TeamInvitation(
      {required this.invitationId,
      required this.team,
      required this.invitedUser,
      required this.invitedBy,
      required this.created,
      this.status = TeamInvitationStatus.unknown});

  factory _$_TeamInvitation.fromJson(Map<String, dynamic> json) =>
      _$$_TeamInvitationFromJson(json);

  @override
  final String invitationId;
  @override
  final Team team;
  @override
  final User invitedUser;
  @override
  final User invitedBy;
  @override
  final DateTime created;
  @override
  @JsonKey()
  final TeamInvitationStatus status;

  @override
  String toString() {
    return 'TeamInvitation(invitationId: $invitationId, team: $team, invitedUser: $invitedUser, invitedBy: $invitedBy, created: $created, status: $status)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_TeamInvitation &&
            const DeepCollectionEquality()
                .equals(other.invitationId, invitationId) &&
            const DeepCollectionEquality().equals(other.team, team) &&
            const DeepCollectionEquality()
                .equals(other.invitedUser, invitedUser) &&
            const DeepCollectionEquality().equals(other.invitedBy, invitedBy) &&
            const DeepCollectionEquality().equals(other.created, created) &&
            const DeepCollectionEquality().equals(other.status, status));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(invitationId),
      const DeepCollectionEquality().hash(team),
      const DeepCollectionEquality().hash(invitedUser),
      const DeepCollectionEquality().hash(invitedBy),
      const DeepCollectionEquality().hash(created),
      const DeepCollectionEquality().hash(status));

  @JsonKey(ignore: true)
  @override
  _$$_TeamInvitationCopyWith<_$_TeamInvitation> get copyWith =>
      __$$_TeamInvitationCopyWithImpl<_$_TeamInvitation>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_TeamInvitationToJson(
      this,
    );
  }
}

abstract class _TeamInvitation implements TeamInvitation {
  const factory _TeamInvitation(
      {required final String invitationId,
      required final Team team,
      required final User invitedUser,
      required final User invitedBy,
      required final DateTime created,
      final TeamInvitationStatus status}) = _$_TeamInvitation;

  factory _TeamInvitation.fromJson(Map<String, dynamic> json) =
      _$_TeamInvitation.fromJson;

  @override
  String get invitationId;
  @override
  Team get team;
  @override
  User get invitedUser;
  @override
  User get invitedBy;
  @override
  DateTime get created;
  @override
  TeamInvitationStatus get status;
  @override
  @JsonKey(ignore: true)
  _$$_TeamInvitationCopyWith<_$_TeamInvitation> get copyWith =>
      throw _privateConstructorUsedError;
}
