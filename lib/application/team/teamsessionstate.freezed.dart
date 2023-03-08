// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'teamsessionstate.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$TeamSessionState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Team team) logged,
    required TResult Function() homeless,
    required TResult Function(List<Team> teams) signedOut,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Team team)? logged,
    TResult? Function()? homeless,
    TResult? Function(List<Team> teams)? signedOut,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Team team)? logged,
    TResult Function()? homeless,
    TResult Function(List<Team> teams)? signedOut,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Logged value) logged,
    required TResult Function(Homeless value) homeless,
    required TResult Function(SignedOut value) signedOut,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Logged value)? logged,
    TResult? Function(Homeless value)? homeless,
    TResult? Function(SignedOut value)? signedOut,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Logged value)? logged,
    TResult Function(Homeless value)? homeless,
    TResult Function(SignedOut value)? signedOut,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TeamSessionStateCopyWith<$Res> {
  factory $TeamSessionStateCopyWith(
          TeamSessionState value, $Res Function(TeamSessionState) then) =
      _$TeamSessionStateCopyWithImpl<$Res, TeamSessionState>;
}

/// @nodoc
class _$TeamSessionStateCopyWithImpl<$Res, $Val extends TeamSessionState>
    implements $TeamSessionStateCopyWith<$Res> {
  _$TeamSessionStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$LoggedCopyWith<$Res> {
  factory _$$LoggedCopyWith(_$Logged value, $Res Function(_$Logged) then) =
      __$$LoggedCopyWithImpl<$Res>;
  @useResult
  $Res call({Team team});

  $TeamCopyWith<$Res> get team;
}

/// @nodoc
class __$$LoggedCopyWithImpl<$Res>
    extends _$TeamSessionStateCopyWithImpl<$Res, _$Logged>
    implements _$$LoggedCopyWith<$Res> {
  __$$LoggedCopyWithImpl(_$Logged _value, $Res Function(_$Logged) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? team = null,
  }) {
    return _then(_$Logged(
      team: null == team
          ? _value.team
          : team // ignore: cast_nullable_to_non_nullable
              as Team,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $TeamCopyWith<$Res> get team {
    return $TeamCopyWith<$Res>(_value.team, (value) {
      return _then(_value.copyWith(team: value));
    });
  }
}

/// @nodoc

class _$Logged implements Logged {
  const _$Logged({required this.team});

  @override
  final Team team;

  @override
  String toString() {
    return 'TeamSessionState.logged(team: $team)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$Logged &&
            (identical(other.team, team) || other.team == team));
  }

  @override
  int get hashCode => Object.hash(runtimeType, team);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LoggedCopyWith<_$Logged> get copyWith =>
      __$$LoggedCopyWithImpl<_$Logged>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Team team) logged,
    required TResult Function() homeless,
    required TResult Function(List<Team> teams) signedOut,
  }) {
    return logged(team);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Team team)? logged,
    TResult? Function()? homeless,
    TResult? Function(List<Team> teams)? signedOut,
  }) {
    return logged?.call(team);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Team team)? logged,
    TResult Function()? homeless,
    TResult Function(List<Team> teams)? signedOut,
    required TResult orElse(),
  }) {
    if (logged != null) {
      return logged(team);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Logged value) logged,
    required TResult Function(Homeless value) homeless,
    required TResult Function(SignedOut value) signedOut,
  }) {
    return logged(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Logged value)? logged,
    TResult? Function(Homeless value)? homeless,
    TResult? Function(SignedOut value)? signedOut,
  }) {
    return logged?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Logged value)? logged,
    TResult Function(Homeless value)? homeless,
    TResult Function(SignedOut value)? signedOut,
    required TResult orElse(),
  }) {
    if (logged != null) {
      return logged(this);
    }
    return orElse();
  }
}

abstract class Logged implements TeamSessionState {
  const factory Logged({required final Team team}) = _$Logged;

  Team get team;
  @JsonKey(ignore: true)
  _$$LoggedCopyWith<_$Logged> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$HomelessCopyWith<$Res> {
  factory _$$HomelessCopyWith(
          _$Homeless value, $Res Function(_$Homeless) then) =
      __$$HomelessCopyWithImpl<$Res>;
}

/// @nodoc
class __$$HomelessCopyWithImpl<$Res>
    extends _$TeamSessionStateCopyWithImpl<$Res, _$Homeless>
    implements _$$HomelessCopyWith<$Res> {
  __$$HomelessCopyWithImpl(_$Homeless _value, $Res Function(_$Homeless) _then)
      : super(_value, _then);
}

/// @nodoc

class _$Homeless implements Homeless {
  const _$Homeless();

  @override
  String toString() {
    return 'TeamSessionState.homeless()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$Homeless);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Team team) logged,
    required TResult Function() homeless,
    required TResult Function(List<Team> teams) signedOut,
  }) {
    return homeless();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Team team)? logged,
    TResult? Function()? homeless,
    TResult? Function(List<Team> teams)? signedOut,
  }) {
    return homeless?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Team team)? logged,
    TResult Function()? homeless,
    TResult Function(List<Team> teams)? signedOut,
    required TResult orElse(),
  }) {
    if (homeless != null) {
      return homeless();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Logged value) logged,
    required TResult Function(Homeless value) homeless,
    required TResult Function(SignedOut value) signedOut,
  }) {
    return homeless(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Logged value)? logged,
    TResult? Function(Homeless value)? homeless,
    TResult? Function(SignedOut value)? signedOut,
  }) {
    return homeless?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Logged value)? logged,
    TResult Function(Homeless value)? homeless,
    TResult Function(SignedOut value)? signedOut,
    required TResult orElse(),
  }) {
    if (homeless != null) {
      return homeless(this);
    }
    return orElse();
  }
}

abstract class Homeless implements TeamSessionState {
  const factory Homeless() = _$Homeless;
}

/// @nodoc
abstract class _$$SignedOutCopyWith<$Res> {
  factory _$$SignedOutCopyWith(
          _$SignedOut value, $Res Function(_$SignedOut) then) =
      __$$SignedOutCopyWithImpl<$Res>;
  @useResult
  $Res call({List<Team> teams});
}

/// @nodoc
class __$$SignedOutCopyWithImpl<$Res>
    extends _$TeamSessionStateCopyWithImpl<$Res, _$SignedOut>
    implements _$$SignedOutCopyWith<$Res> {
  __$$SignedOutCopyWithImpl(
      _$SignedOut _value, $Res Function(_$SignedOut) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? teams = null,
  }) {
    return _then(_$SignedOut(
      teams: null == teams
          ? _value._teams
          : teams // ignore: cast_nullable_to_non_nullable
              as List<Team>,
    ));
  }
}

/// @nodoc

class _$SignedOut implements SignedOut {
  const _$SignedOut({required final List<Team> teams}) : _teams = teams;

  final List<Team> _teams;
  @override
  List<Team> get teams {
    if (_teams is EqualUnmodifiableListView) return _teams;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_teams);
  }

  @override
  String toString() {
    return 'TeamSessionState.signedOut(teams: $teams)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SignedOut &&
            const DeepCollectionEquality().equals(other._teams, _teams));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_teams));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SignedOutCopyWith<_$SignedOut> get copyWith =>
      __$$SignedOutCopyWithImpl<_$SignedOut>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Team team) logged,
    required TResult Function() homeless,
    required TResult Function(List<Team> teams) signedOut,
  }) {
    return signedOut(teams);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Team team)? logged,
    TResult? Function()? homeless,
    TResult? Function(List<Team> teams)? signedOut,
  }) {
    return signedOut?.call(teams);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Team team)? logged,
    TResult Function()? homeless,
    TResult Function(List<Team> teams)? signedOut,
    required TResult orElse(),
  }) {
    if (signedOut != null) {
      return signedOut(teams);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Logged value) logged,
    required TResult Function(Homeless value) homeless,
    required TResult Function(SignedOut value) signedOut,
  }) {
    return signedOut(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Logged value)? logged,
    TResult? Function(Homeless value)? homeless,
    TResult? Function(SignedOut value)? signedOut,
  }) {
    return signedOut?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Logged value)? logged,
    TResult Function(Homeless value)? homeless,
    TResult Function(SignedOut value)? signedOut,
    required TResult orElse(),
  }) {
    if (signedOut != null) {
      return signedOut(this);
    }
    return orElse();
  }
}

abstract class SignedOut implements TeamSessionState {
  const factory SignedOut({required final List<Team> teams}) = _$SignedOut;

  List<Team> get teams;
  @JsonKey(ignore: true)
  _$$SignedOutCopyWith<_$SignedOut> get copyWith =>
      throw _privateConstructorUsedError;
}
