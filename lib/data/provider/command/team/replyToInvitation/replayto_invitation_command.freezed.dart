// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'replayto_invitation_command.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ReplayToInvitationCommand _$ReplayToInvitationCommandFromJson(
    Map<String, dynamic> json) {
  return _ReplayToInvitationCommand.fromJson(json);
}

/// @nodoc
mixin _$ReplayToInvitationCommand {
  String get invitationId => throw _privateConstructorUsedError;
  String get status => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ReplayToInvitationCommandCopyWith<ReplayToInvitationCommand> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReplayToInvitationCommandCopyWith<$Res> {
  factory $ReplayToInvitationCommandCopyWith(ReplayToInvitationCommand value,
          $Res Function(ReplayToInvitationCommand) then) =
      _$ReplayToInvitationCommandCopyWithImpl<$Res>;
  $Res call({String invitationId, String status});
}

/// @nodoc
class _$ReplayToInvitationCommandCopyWithImpl<$Res>
    implements $ReplayToInvitationCommandCopyWith<$Res> {
  _$ReplayToInvitationCommandCopyWithImpl(this._value, this._then);

  final ReplayToInvitationCommand _value;
  // ignore: unused_field
  final $Res Function(ReplayToInvitationCommand) _then;

  @override
  $Res call({
    Object? invitationId = freezed,
    Object? status = freezed,
  }) {
    return _then(_value.copyWith(
      invitationId: invitationId == freezed
          ? _value.invitationId
          : invitationId // ignore: cast_nullable_to_non_nullable
              as String,
      status: status == freezed
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$$_ReplayToInvitationCommandCopyWith<$Res>
    implements $ReplayToInvitationCommandCopyWith<$Res> {
  factory _$$_ReplayToInvitationCommandCopyWith(
          _$_ReplayToInvitationCommand value,
          $Res Function(_$_ReplayToInvitationCommand) then) =
      __$$_ReplayToInvitationCommandCopyWithImpl<$Res>;
  @override
  $Res call({String invitationId, String status});
}

/// @nodoc
class __$$_ReplayToInvitationCommandCopyWithImpl<$Res>
    extends _$ReplayToInvitationCommandCopyWithImpl<$Res>
    implements _$$_ReplayToInvitationCommandCopyWith<$Res> {
  __$$_ReplayToInvitationCommandCopyWithImpl(
      _$_ReplayToInvitationCommand _value,
      $Res Function(_$_ReplayToInvitationCommand) _then)
      : super(_value, (v) => _then(v as _$_ReplayToInvitationCommand));

  @override
  _$_ReplayToInvitationCommand get _value =>
      super._value as _$_ReplayToInvitationCommand;

  @override
  $Res call({
    Object? invitationId = freezed,
    Object? status = freezed,
  }) {
    return _then(_$_ReplayToInvitationCommand(
      invitationId: invitationId == freezed
          ? _value.invitationId
          : invitationId // ignore: cast_nullable_to_non_nullable
              as String,
      status: status == freezed
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ReplayToInvitationCommand implements _ReplayToInvitationCommand {
  const _$_ReplayToInvitationCommand(
      {required this.invitationId, required this.status});

  factory _$_ReplayToInvitationCommand.fromJson(Map<String, dynamic> json) =>
      _$$_ReplayToInvitationCommandFromJson(json);

  @override
  final String invitationId;
  @override
  final String status;

  @override
  String toString() {
    return 'ReplayToInvitationCommand(invitationId: $invitationId, status: $status)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ReplayToInvitationCommand &&
            const DeepCollectionEquality()
                .equals(other.invitationId, invitationId) &&
            const DeepCollectionEquality().equals(other.status, status));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(invitationId),
      const DeepCollectionEquality().hash(status));

  @JsonKey(ignore: true)
  @override
  _$$_ReplayToInvitationCommandCopyWith<_$_ReplayToInvitationCommand>
      get copyWith => __$$_ReplayToInvitationCommandCopyWithImpl<
          _$_ReplayToInvitationCommand>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ReplayToInvitationCommandToJson(
      this,
    );
  }
}

abstract class _ReplayToInvitationCommand implements ReplayToInvitationCommand {
  const factory _ReplayToInvitationCommand(
      {required final String invitationId,
      required final String status}) = _$_ReplayToInvitationCommand;

  factory _ReplayToInvitationCommand.fromJson(Map<String, dynamic> json) =
      _$_ReplayToInvitationCommand.fromJson;

  @override
  String get invitationId;
  @override
  String get status;
  @override
  @JsonKey(ignore: true)
  _$$_ReplayToInvitationCommandCopyWith<_$_ReplayToInvitationCommand>
      get copyWith => throw _privateConstructorUsedError;
}
