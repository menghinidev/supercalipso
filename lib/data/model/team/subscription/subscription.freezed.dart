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
  User get subscribedUser => throw _privateConstructorUsedError;
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
  $Res call({User subscribedUser, DateTime joined});

  $UserCopyWith<$Res> get subscribedUser;
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
    Object? subscribedUser = freezed,
    Object? joined = freezed,
  }) {
    return _then(_value.copyWith(
      subscribedUser: subscribedUser == freezed
          ? _value.subscribedUser
          : subscribedUser // ignore: cast_nullable_to_non_nullable
              as User,
      joined: joined == freezed
          ? _value.joined
          : joined // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }

  @override
  $UserCopyWith<$Res> get subscribedUser {
    return $UserCopyWith<$Res>(_value.subscribedUser, (value) {
      return _then(_value.copyWith(subscribedUser: value));
    });
  }
}

/// @nodoc
abstract class _$$_TeamSubscriptionCopyWith<$Res>
    implements $TeamSubscriptionCopyWith<$Res> {
  factory _$$_TeamSubscriptionCopyWith(
          _$_TeamSubscription value, $Res Function(_$_TeamSubscription) then) =
      __$$_TeamSubscriptionCopyWithImpl<$Res>;
  @override
  $Res call({User subscribedUser, DateTime joined});

  @override
  $UserCopyWith<$Res> get subscribedUser;
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
    Object? subscribedUser = freezed,
    Object? joined = freezed,
  }) {
    return _then(_$_TeamSubscription(
      subscribedUser: subscribedUser == freezed
          ? _value.subscribedUser
          : subscribedUser // ignore: cast_nullable_to_non_nullable
              as User,
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
      {required this.subscribedUser, required this.joined});

  factory _$_TeamSubscription.fromJson(Map<String, dynamic> json) =>
      _$$_TeamSubscriptionFromJson(json);

  @override
  final User subscribedUser;
  @override
  final DateTime joined;

  @override
  String toString() {
    return 'TeamSubscription(subscribedUser: $subscribedUser, joined: $joined)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_TeamSubscription &&
            const DeepCollectionEquality()
                .equals(other.subscribedUser, subscribedUser) &&
            const DeepCollectionEquality().equals(other.joined, joined));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(subscribedUser),
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
      {required final User subscribedUser,
      required final DateTime joined}) = _$_TeamSubscription;

  factory _TeamSubscription.fromJson(Map<String, dynamic> json) =
      _$_TeamSubscription.fromJson;

  @override
  User get subscribedUser;
  @override
  DateTime get joined;
  @override
  @JsonKey(ignore: true)
  _$$_TeamSubscriptionCopyWith<_$_TeamSubscription> get copyWith =>
      throw _privateConstructorUsedError;
}
