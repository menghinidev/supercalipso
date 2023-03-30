// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

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
  String get id => throw _privateConstructorUsedError;
  String get teamId => throw _privateConstructorUsedError;
  String get invitedUserId => throw _privateConstructorUsedError;
  String get invitedByUserId => throw _privateConstructorUsedError;
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
      _$TeamInvitationCopyWithImpl<$Res, TeamInvitation>;
  @useResult
  $Res call(
      {String id,
      String teamId,
      String invitedUserId,
      String invitedByUserId,
      DateTime created,
      TeamInvitationStatus status});
}

/// @nodoc
class _$TeamInvitationCopyWithImpl<$Res, $Val extends TeamInvitation>
    implements $TeamInvitationCopyWith<$Res> {
  _$TeamInvitationCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? teamId = null,
    Object? invitedUserId = null,
    Object? invitedByUserId = null,
    Object? created = null,
    Object? status = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      teamId: null == teamId
          ? _value.teamId
          : teamId // ignore: cast_nullable_to_non_nullable
              as String,
      invitedUserId: null == invitedUserId
          ? _value.invitedUserId
          : invitedUserId // ignore: cast_nullable_to_non_nullable
              as String,
      invitedByUserId: null == invitedByUserId
          ? _value.invitedByUserId
          : invitedByUserId // ignore: cast_nullable_to_non_nullable
              as String,
      created: null == created
          ? _value.created
          : created // ignore: cast_nullable_to_non_nullable
              as DateTime,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as TeamInvitationStatus,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_TeamInvitationCopyWith<$Res>
    implements $TeamInvitationCopyWith<$Res> {
  factory _$$_TeamInvitationCopyWith(
          _$_TeamInvitation value, $Res Function(_$_TeamInvitation) then) =
      __$$_TeamInvitationCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String teamId,
      String invitedUserId,
      String invitedByUserId,
      DateTime created,
      TeamInvitationStatus status});
}

/// @nodoc
class __$$_TeamInvitationCopyWithImpl<$Res>
    extends _$TeamInvitationCopyWithImpl<$Res, _$_TeamInvitation>
    implements _$$_TeamInvitationCopyWith<$Res> {
  __$$_TeamInvitationCopyWithImpl(
      _$_TeamInvitation _value, $Res Function(_$_TeamInvitation) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? teamId = null,
    Object? invitedUserId = null,
    Object? invitedByUserId = null,
    Object? created = null,
    Object? status = null,
  }) {
    return _then(_$_TeamInvitation(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      teamId: null == teamId
          ? _value.teamId
          : teamId // ignore: cast_nullable_to_non_nullable
              as String,
      invitedUserId: null == invitedUserId
          ? _value.invitedUserId
          : invitedUserId // ignore: cast_nullable_to_non_nullable
              as String,
      invitedByUserId: null == invitedByUserId
          ? _value.invitedByUserId
          : invitedByUserId // ignore: cast_nullable_to_non_nullable
              as String,
      created: null == created
          ? _value.created
          : created // ignore: cast_nullable_to_non_nullable
              as DateTime,
      status: null == status
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
      {required this.id,
      required this.teamId,
      required this.invitedUserId,
      required this.invitedByUserId,
      required this.created,
      this.status = TeamInvitationStatus.unknown});

  factory _$_TeamInvitation.fromJson(Map<String, dynamic> json) =>
      _$$_TeamInvitationFromJson(json);

  @override
  final String id;
  @override
  final String teamId;
  @override
  final String invitedUserId;
  @override
  final String invitedByUserId;
  @override
  final DateTime created;
  @override
  @JsonKey()
  final TeamInvitationStatus status;

  @override
  String toString() {
    return 'TeamInvitation(id: $id, teamId: $teamId, invitedUserId: $invitedUserId, invitedByUserId: $invitedByUserId, created: $created, status: $status)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_TeamInvitation &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.teamId, teamId) || other.teamId == teamId) &&
            (identical(other.invitedUserId, invitedUserId) ||
                other.invitedUserId == invitedUserId) &&
            (identical(other.invitedByUserId, invitedByUserId) ||
                other.invitedByUserId == invitedByUserId) &&
            (identical(other.created, created) || other.created == created) &&
            (identical(other.status, status) || other.status == status));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, id, teamId, invitedUserId, invitedByUserId, created, status);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
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
      {required final String id,
      required final String teamId,
      required final String invitedUserId,
      required final String invitedByUserId,
      required final DateTime created,
      final TeamInvitationStatus status}) = _$_TeamInvitation;

  factory _TeamInvitation.fromJson(Map<String, dynamic> json) =
      _$_TeamInvitation.fromJson;

  @override
  String get id;
  @override
  String get teamId;
  @override
  String get invitedUserId;
  @override
  String get invitedByUserId;
  @override
  DateTime get created;
  @override
  TeamInvitationStatus get status;
  @override
  @JsonKey(ignore: true)
  _$$_TeamInvitationCopyWith<_$_TeamInvitation> get copyWith =>
      throw _privateConstructorUsedError;
}
