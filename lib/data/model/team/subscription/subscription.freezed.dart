// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

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
      _$TeamSubscriptionCopyWithImpl<$Res>;
  $Res call(
      {String id, String subscribedUserId, String teamId, DateTime joined});
}

/// @nodoc
class _$TeamSubscriptionCopyWithImpl<$Res>
    implements $TeamSubscriptionCopyWith<$Res> {
  _$TeamSubscriptionCopyWithImpl(this._value, this._then);

  final TeamSubscription _value;
  // ignore: unused_field
  final $Res Function(TeamSubscription) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? subscribedUserId = freezed,
    Object? teamId = freezed,
    Object? joined = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      subscribedUserId: subscribedUserId == freezed
          ? _value.subscribedUserId
          : subscribedUserId // ignore: cast_nullable_to_non_nullable
              as String,
      teamId: teamId == freezed
          ? _value.teamId
          : teamId // ignore: cast_nullable_to_non_nullable
              as String,
      joined: joined == freezed
          ? _value.joined
          : joined // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
abstract class _$$_TeamSubscriptionCopyWith<$Res>
    implements $TeamSubscriptionCopyWith<$Res> {
  factory _$$_TeamSubscriptionCopyWith(
          _$_TeamSubscription value, $Res Function(_$_TeamSubscription) then) =
      __$$_TeamSubscriptionCopyWithImpl<$Res>;
  @override
  $Res call(
      {String id, String subscribedUserId, String teamId, DateTime joined});
}

/// @nodoc
class __$$_TeamSubscriptionCopyWithImpl<$Res>
    extends _$TeamSubscriptionCopyWithImpl<$Res>
    implements _$$_TeamSubscriptionCopyWith<$Res> {
  __$$_TeamSubscriptionCopyWithImpl(
      _$_TeamSubscription _value, $Res Function(_$_TeamSubscription) _then)
      : super(_value, (v) => _then(v as _$_TeamSubscription));

  @override
  _$_TeamSubscription get _value => super._value as _$_TeamSubscription;

  @override
  $Res call({
    Object? id = freezed,
    Object? subscribedUserId = freezed,
    Object? teamId = freezed,
    Object? joined = freezed,
  }) {
    return _then(_$_TeamSubscription(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      subscribedUserId: subscribedUserId == freezed
          ? _value.subscribedUserId
          : subscribedUserId // ignore: cast_nullable_to_non_nullable
              as String,
      teamId: teamId == freezed
          ? _value.teamId
          : teamId // ignore: cast_nullable_to_non_nullable
              as String,
      joined: joined == freezed
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
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality()
                .equals(other.subscribedUserId, subscribedUserId) &&
            const DeepCollectionEquality().equals(other.teamId, teamId) &&
            const DeepCollectionEquality().equals(other.joined, joined));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(subscribedUserId),
      const DeepCollectionEquality().hash(teamId),
      const DeepCollectionEquality().hash(joined));

  @JsonKey(ignore: true)
  @override
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
