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
      _$TeamInvitationCopyWithImpl<$Res>;
  $Res call(
      {String id,
      String teamId,
      String invitedUserId,
      String invitedByUserId,
      DateTime created,
      TeamInvitationStatus status});
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
    Object? id = freezed,
    Object? teamId = freezed,
    Object? invitedUserId = freezed,
    Object? invitedByUserId = freezed,
    Object? created = freezed,
    Object? status = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      teamId: teamId == freezed
          ? _value.teamId
          : teamId // ignore: cast_nullable_to_non_nullable
              as String,
      invitedUserId: invitedUserId == freezed
          ? _value.invitedUserId
          : invitedUserId // ignore: cast_nullable_to_non_nullable
              as String,
      invitedByUserId: invitedByUserId == freezed
          ? _value.invitedByUserId
          : invitedByUserId // ignore: cast_nullable_to_non_nullable
              as String,
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
abstract class _$$_TeamInvitationCopyWith<$Res>
    implements $TeamInvitationCopyWith<$Res> {
  factory _$$_TeamInvitationCopyWith(
          _$_TeamInvitation value, $Res Function(_$_TeamInvitation) then) =
      __$$_TeamInvitationCopyWithImpl<$Res>;
  @override
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
    extends _$TeamInvitationCopyWithImpl<$Res>
    implements _$$_TeamInvitationCopyWith<$Res> {
  __$$_TeamInvitationCopyWithImpl(
      _$_TeamInvitation _value, $Res Function(_$_TeamInvitation) _then)
      : super(_value, (v) => _then(v as _$_TeamInvitation));

  @override
  _$_TeamInvitation get _value => super._value as _$_TeamInvitation;

  @override
  $Res call({
    Object? id = freezed,
    Object? teamId = freezed,
    Object? invitedUserId = freezed,
    Object? invitedByUserId = freezed,
    Object? created = freezed,
    Object? status = freezed,
  }) {
    return _then(_$_TeamInvitation(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      teamId: teamId == freezed
          ? _value.teamId
          : teamId // ignore: cast_nullable_to_non_nullable
              as String,
      invitedUserId: invitedUserId == freezed
          ? _value.invitedUserId
          : invitedUserId // ignore: cast_nullable_to_non_nullable
              as String,
      invitedByUserId: invitedByUserId == freezed
          ? _value.invitedByUserId
          : invitedByUserId // ignore: cast_nullable_to_non_nullable
              as String,
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
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.teamId, teamId) &&
            const DeepCollectionEquality()
                .equals(other.invitedUserId, invitedUserId) &&
            const DeepCollectionEquality()
                .equals(other.invitedByUserId, invitedByUserId) &&
            const DeepCollectionEquality().equals(other.created, created) &&
            const DeepCollectionEquality().equals(other.status, status));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(teamId),
      const DeepCollectionEquality().hash(invitedUserId),
      const DeepCollectionEquality().hash(invitedByUserId),
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
