// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'team.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Team _$TeamFromJson(Map<String, dynamic> json) {
  return _Team.fromJson(json);
}

/// @nodoc
mixin _$Team {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  List<TeamSubscription> get subscriptions =>
      throw _privateConstructorUsedError;
  List<TeamInvitation> get invitations => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TeamCopyWith<Team> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TeamCopyWith<$Res> {
  factory $TeamCopyWith(Team value, $Res Function(Team) then) =
      _$TeamCopyWithImpl<$Res>;
  $Res call(
      {String id,
      String name,
      List<TeamSubscription> subscriptions,
      List<TeamInvitation> invitations});
}

/// @nodoc
class _$TeamCopyWithImpl<$Res> implements $TeamCopyWith<$Res> {
  _$TeamCopyWithImpl(this._value, this._then);

  final Team _value;
  // ignore: unused_field
  final $Res Function(Team) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? subscriptions = freezed,
    Object? invitations = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      subscriptions: subscriptions == freezed
          ? _value.subscriptions
          : subscriptions // ignore: cast_nullable_to_non_nullable
              as List<TeamSubscription>,
      invitations: invitations == freezed
          ? _value.invitations
          : invitations // ignore: cast_nullable_to_non_nullable
              as List<TeamInvitation>,
    ));
  }
}

/// @nodoc
abstract class _$$_TeamCopyWith<$Res> implements $TeamCopyWith<$Res> {
  factory _$$_TeamCopyWith(_$_Team value, $Res Function(_$_Team) then) =
      __$$_TeamCopyWithImpl<$Res>;
  @override
  $Res call(
      {String id,
      String name,
      List<TeamSubscription> subscriptions,
      List<TeamInvitation> invitations});
}

/// @nodoc
class __$$_TeamCopyWithImpl<$Res> extends _$TeamCopyWithImpl<$Res>
    implements _$$_TeamCopyWith<$Res> {
  __$$_TeamCopyWithImpl(_$_Team _value, $Res Function(_$_Team) _then)
      : super(_value, (v) => _then(v as _$_Team));

  @override
  _$_Team get _value => super._value as _$_Team;

  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? subscriptions = freezed,
    Object? invitations = freezed,
  }) {
    return _then(_$_Team(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      subscriptions: subscriptions == freezed
          ? _value._subscriptions
          : subscriptions // ignore: cast_nullable_to_non_nullable
              as List<TeamSubscription>,
      invitations: invitations == freezed
          ? _value._invitations
          : invitations // ignore: cast_nullable_to_non_nullable
              as List<TeamInvitation>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Team extends _Team {
  const _$_Team(
      {required this.id,
      required this.name,
      final List<TeamSubscription> subscriptions = const <TeamSubscription>[],
      final List<TeamInvitation> invitations = const <TeamInvitation>[]})
      : _subscriptions = subscriptions,
        _invitations = invitations,
        super._();

  factory _$_Team.fromJson(Map<String, dynamic> json) => _$$_TeamFromJson(json);

  @override
  final String id;
  @override
  final String name;
  final List<TeamSubscription> _subscriptions;
  @override
  @JsonKey()
  List<TeamSubscription> get subscriptions {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_subscriptions);
  }

  final List<TeamInvitation> _invitations;
  @override
  @JsonKey()
  List<TeamInvitation> get invitations {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_invitations);
  }

  @override
  String toString() {
    return 'Team(id: $id, name: $name, subscriptions: $subscriptions, invitations: $invitations)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Team &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.name, name) &&
            const DeepCollectionEquality()
                .equals(other._subscriptions, _subscriptions) &&
            const DeepCollectionEquality()
                .equals(other._invitations, _invitations));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(name),
      const DeepCollectionEquality().hash(_subscriptions),
      const DeepCollectionEquality().hash(_invitations));

  @JsonKey(ignore: true)
  @override
  _$$_TeamCopyWith<_$_Team> get copyWith =>
      __$$_TeamCopyWithImpl<_$_Team>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_TeamToJson(
      this,
    );
  }
}

abstract class _Team extends Team {
  const factory _Team(
      {required final String id,
      required final String name,
      final List<TeamSubscription> subscriptions,
      final List<TeamInvitation> invitations}) = _$_Team;
  const _Team._() : super._();

  factory _Team.fromJson(Map<String, dynamic> json) = _$_Team.fromJson;

  @override
  String get id;
  @override
  String get name;
  @override
  List<TeamSubscription> get subscriptions;
  @override
  List<TeamInvitation> get invitations;
  @override
  @JsonKey(ignore: true)
  _$$_TeamCopyWith<_$_Team> get copyWith => throw _privateConstructorUsedError;
}