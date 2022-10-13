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

ReplyToInvitationCommand _$ReplyToInvitationCommandFromJson(
    Map<String, dynamic> json) {
  return _ReplyToInvitationCommand.fromJson(json);
}

/// @nodoc
mixin _$ReplyToInvitationCommand {
  String get invitationId => throw _privateConstructorUsedError;
  String get status => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ReplyToInvitationCommandCopyWith<ReplyToInvitationCommand> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReplyToInvitationCommandCopyWith<$Res> {
  factory $ReplyToInvitationCommandCopyWith(ReplyToInvitationCommand value,
          $Res Function(ReplyToInvitationCommand) then) =
      _$ReplyToInvitationCommandCopyWithImpl<$Res>;
  $Res call({String invitationId, String status});
}

/// @nodoc
class _$ReplyToInvitationCommandCopyWithImpl<$Res>
    implements $ReplyToInvitationCommandCopyWith<$Res> {
  _$ReplyToInvitationCommandCopyWithImpl(this._value, this._then);

  final ReplyToInvitationCommand _value;
  // ignore: unused_field
  final $Res Function(ReplyToInvitationCommand) _then;

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
abstract class _$$_ReplyToInvitationCommandCopyWith<$Res>
    implements $ReplyToInvitationCommandCopyWith<$Res> {
  factory _$$_ReplyToInvitationCommandCopyWith(
          _$_ReplyToInvitationCommand value,
          $Res Function(_$_ReplyToInvitationCommand) then) =
      __$$_ReplyToInvitationCommandCopyWithImpl<$Res>;
  @override
  $Res call({String invitationId, String status});
}

/// @nodoc
class __$$_ReplyToInvitationCommandCopyWithImpl<$Res>
    extends _$ReplyToInvitationCommandCopyWithImpl<$Res>
    implements _$$_ReplyToInvitationCommandCopyWith<$Res> {
  __$$_ReplyToInvitationCommandCopyWithImpl(_$_ReplyToInvitationCommand _value,
      $Res Function(_$_ReplyToInvitationCommand) _then)
      : super(_value, (v) => _then(v as _$_ReplyToInvitationCommand));

  @override
  _$_ReplyToInvitationCommand get _value =>
      super._value as _$_ReplyToInvitationCommand;

  @override
  $Res call({
    Object? invitationId = freezed,
    Object? status = freezed,
  }) {
    return _then(_$_ReplyToInvitationCommand(
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
class _$_ReplyToInvitationCommand extends _ReplyToInvitationCommand {
  const _$_ReplyToInvitationCommand(
      {required this.invitationId, required this.status})
      : super._();

  factory _$_ReplyToInvitationCommand.fromJson(Map<String, dynamic> json) =>
      _$$_ReplyToInvitationCommandFromJson(json);

  @override
  final String invitationId;
  @override
  final String status;

  @override
  String toString() {
    return 'ReplyToInvitationCommand(invitationId: $invitationId, status: $status)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ReplyToInvitationCommand &&
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
  _$$_ReplyToInvitationCommandCopyWith<_$_ReplyToInvitationCommand>
      get copyWith => __$$_ReplyToInvitationCommandCopyWithImpl<
          _$_ReplyToInvitationCommand>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ReplyToInvitationCommandToJson(
      this,
    );
  }
}

abstract class _ReplyToInvitationCommand extends ReplyToInvitationCommand {
  const factory _ReplyToInvitationCommand(
      {required final String invitationId,
      required final String status}) = _$_ReplyToInvitationCommand;
  const _ReplyToInvitationCommand._() : super._();

  factory _ReplyToInvitationCommand.fromJson(Map<String, dynamic> json) =
      _$_ReplyToInvitationCommand.fromJson;

  @override
  String get invitationId;
  @override
  String get status;
  @override
  @JsonKey(ignore: true)
  _$$_ReplyToInvitationCommandCopyWith<_$_ReplyToInvitationCommand>
      get copyWith => throw _privateConstructorUsedError;
}
