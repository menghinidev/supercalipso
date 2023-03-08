// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'subscription.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

TeamSubscription _$TeamSubscriptionFromJson(Map<String, dynamic> json) {
  return _TeamSubscription.fromJson(json);
}

/// @nodoc
mixin _$TeamSubscription {
  String get id => throw _privateConstructorUsedError;
  String get subscribedUserId => throw _privateConstructorUsedError;
  String get teamId => throw _privateConstructorUsedError;
  DateTime get joined => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TeamSubscriptionCopyWith<TeamSubscription> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TeamSubscriptionCopyWith<$Res> {
  factory $TeamSubscriptionCopyWith(
          TeamSubscription value, $Res Function(TeamSubscription) then) =
      _$TeamSubscriptionCopyWithImpl<$Res, TeamSubscription>;
  @useResult
  $Res call(
      {String id, String subscribedUserId, String teamId, DateTime joined});
}

/// @nodoc
class _$TeamSubscriptionCopyWithImpl<$Res, $Val extends TeamSubscription>
    implements $TeamSubscriptionCopyWith<$Res> {
  _$TeamSubscriptionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? subscribedUserId = null,
    Object? teamId = null,
    Object? joined = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      subscribedUserId: null == subscribedUserId
          ? _value.subscribedUserId
          : subscribedUserId // ignore: cast_nullable_to_non_nullable
              as String,
      teamId: null == teamId
          ? _value.teamId
          : teamId // ignore: cast_nullable_to_non_nullable
              as String,
      joined: null == joined
          ? _value.joined
          : joined // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_TeamSubscriptionCopyWith<$Res>
    implements $TeamSubscriptionCopyWith<$Res> {
  factory _$$_TeamSubscriptionCopyWith(
          _$_TeamSubscription value, $Res Function(_$_TeamSubscription) then) =
      __$$_TeamSubscriptionCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id, String subscribedUserId, String teamId, DateTime joined});
}

/// @nodoc
class __$$_TeamSubscriptionCopyWithImpl<$Res>
    extends _$TeamSubscriptionCopyWithImpl<$Res, _$_TeamSubscription>
    implements _$$_TeamSubscriptionCopyWith<$Res> {
  __$$_TeamSubscriptionCopyWithImpl(
      _$_TeamSubscription _value, $Res Function(_$_TeamSubscription) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? subscribedUserId = null,
    Object? teamId = null,
    Object? joined = null,
  }) {
    return _then(_$_TeamSubscription(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      subscribedUserId: null == subscribedUserId
          ? _value.subscribedUserId
          : subscribedUserId // ignore: cast_nullable_to_non_nullable
              as String,
      teamId: null == teamId
          ? _value.teamId
          : teamId // ignore: cast_nullable_to_non_nullable
              as String,
      joined: null == joined
          ? _value.joined
          : joined // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_TeamSubscription implements _TeamSubscription {
  const _$_TeamSubscription(
      {required this.id,
      required this.subscribedUserId,
      required this.teamId,
      required this.joined});

  factory _$_TeamSubscription.fromJson(Map<String, dynamic> json) =>
      _$$_TeamSubscriptionFromJson(json);

  @override
  final String id;
  @override
  final String subscribedUserId;
  @override
  final String teamId;
  @override
  final DateTime joined;

  @override
  String toString() {
    return 'TeamSubscription(id: $id, subscribedUserId: $subscribedUserId, teamId: $teamId, joined: $joined)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_TeamSubscription &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.subscribedUserId, subscribedUserId) ||
                other.subscribedUserId == subscribedUserId) &&
            (identical(other.teamId, teamId) || other.teamId == teamId) &&
            (identical(other.joined, joined) || other.joined == joined));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, subscribedUserId, teamId, joined);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_TeamSubscriptionCopyWith<_$_TeamSubscription> get copyWith =>
      __$$_TeamSubscriptionCopyWithImpl<_$_TeamSubscription>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_TeamSubscriptionToJson(
      this,
    );
  }
}

abstract class _TeamSubscription implements TeamSubscription {
  const factory _TeamSubscription(
      {required final String id,
      required final String subscribedUserId,
      required final String teamId,
      required final DateTime joined}) = _$_TeamSubscription;

  factory _TeamSubscription.fromJson(Map<String, dynamic> json) =
      _$_TeamSubscription.fromJson;

  @override
  String get id;
  @override
  String get subscribedUserId;
  @override
  String get teamId;
  @override
  DateTime get joined;
  @override
  @JsonKey(ignore: true)
  _$$_TeamSubscriptionCopyWith<_$_TeamSubscription> get copyWith =>
      throw _privateConstructorUsedError;
}
