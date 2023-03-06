// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'authstate.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$AuthState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(User user) auth,
    required TResult Function() unauth,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(User user)? auth,
    TResult Function()? unauth,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(User user)? auth,
    TResult Function()? unauth,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Auth value) auth,
    required TResult Function(Unauth value) unauth,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(Auth value)? auth,
    TResult Function(Unauth value)? unauth,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Auth value)? auth,
    TResult Function(Unauth value)? unauth,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AuthStateCopyWith<$Res> {
  factory $AuthStateCopyWith(AuthState value, $Res Function(AuthState) then) =
      _$AuthStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$AuthStateCopyWithImpl<$Res> implements $AuthStateCopyWith<$Res> {
  _$AuthStateCopyWithImpl(this._value, this._then);

  final AuthState _value;
  // ignore: unused_field
  final $Res Function(AuthState) _then;
}

/// @nodoc
abstract class _$$AuthCopyWith<$Res> {
  factory _$$AuthCopyWith(_$Auth value, $Res Function(_$Auth) then) =
      __$$AuthCopyWithImpl<$Res>;
  $Res call({User user});

  $UserCopyWith<$Res> get user;
}

/// @nodoc
class __$$AuthCopyWithImpl<$Res> extends _$AuthStateCopyWithImpl<$Res>
    implements _$$AuthCopyWith<$Res> {
  __$$AuthCopyWithImpl(_$Auth _value, $Res Function(_$Auth) _then)
      : super(_value, (v) => _then(v as _$Auth));

  @override
  _$Auth get _value => super._value as _$Auth;

  @override
  $Res call({
    Object? user = freezed,
  }) {
    return _then(_$Auth(
      user: user == freezed
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as User,
    ));
  }

  @override
  $UserCopyWith<$Res> get user {
    return $UserCopyWith<$Res>(_value.user, (value) {
      return _then(_value.copyWith(user: value));
    });
  }
}

/// @nodoc

class _$Auth implements Auth {
  const _$Auth({required this.user});

  @override
  final User user;

  @override
  String toString() {
    return 'AuthState.auth(user: $user)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$Auth &&
            const DeepCollectionEquality().equals(other.user, user));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(user));

  @JsonKey(ignore: true)
  @override
  _$$AuthCopyWith<_$Auth> get copyWith =>
      __$$AuthCopyWithImpl<_$Auth>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(User user) auth,
    required TResult Function() unauth,
  }) {
    return auth(user);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(User user)? auth,
    TResult Function()? unauth,
  }) {
    return auth?.call(user);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(User user)? auth,
    TResult Function()? unauth,
    required TResult orElse(),
  }) {
    if (auth != null) {
      return auth(user);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Auth value) auth,
    required TResult Function(Unauth value) unauth,
  }) {
    return auth(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(Auth value)? auth,
    TResult Function(Unauth value)? unauth,
  }) {
    return auth?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Auth value)? auth,
    TResult Function(Unauth value)? unauth,
    required TResult orElse(),
  }) {
    if (auth != null) {
      return auth(this);
    }
    return orElse();
  }
}

abstract class Auth implements AuthState {
  const factory Auth({required final User user}) = _$Auth;

  User get user;
  @JsonKey(ignore: true)
  _$$AuthCopyWith<_$Auth> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$UnauthCopyWith<$Res> {
  factory _$$UnauthCopyWith(_$Unauth value, $Res Function(_$Unauth) then) =
      __$$UnauthCopyWithImpl<$Res>;
}

/// @nodoc
class __$$UnauthCopyWithImpl<$Res> extends _$AuthStateCopyWithImpl<$Res>
    implements _$$UnauthCopyWith<$Res> {
  __$$UnauthCopyWithImpl(_$Unauth _value, $Res Function(_$Unauth) _then)
      : super(_value, (v) => _then(v as _$Unauth));

  @override
  _$Unauth get _value => super._value as _$Unauth;
}

/// @nodoc

class _$Unauth implements Unauth {
  const _$Unauth();

  @override
  String toString() {
    return 'AuthState.unauth()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$Unauth);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(User user) auth,
    required TResult Function() unauth,
  }) {
    return unauth();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(User user)? auth,
    TResult Function()? unauth,
  }) {
    return unauth?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(User user)? auth,
    TResult Function()? unauth,
    required TResult orElse(),
  }) {
    if (unauth != null) {
      return unauth();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Auth value) auth,
    required TResult Function(Unauth value) unauth,
  }) {
    return unauth(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(Auth value)? auth,
    TResult Function(Unauth value)? unauth,
  }) {
    return unauth?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Auth value)? auth,
    TResult Function(Unauth value)? unauth,
    required TResult orElse(),
  }) {
    if (unauth != null) {
      return unauth(this);
    }
    return orElse();
  }
}

abstract class Unauth implements AuthState {
  const factory Unauth() = _$Unauth;
}
