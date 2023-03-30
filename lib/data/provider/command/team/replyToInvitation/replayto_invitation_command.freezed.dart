// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

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
      _$ReplyToInvitationCommandCopyWithImpl<$Res, ReplyToInvitationCommand>;
  @useResult
  $Res call({String invitationId, String status});
}

/// @nodoc
class _$ReplyToInvitationCommandCopyWithImpl<$Res,
        $Val extends ReplyToInvitationCommand>
    implements $ReplyToInvitationCommandCopyWith<$Res> {
  _$ReplyToInvitationCommandCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? invitationId = null,
    Object? status = null,
  }) {
    return _then(_value.copyWith(
      invitationId: null == invitationId
          ? _value.invitationId
          : invitationId // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
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
  @useResult
  $Res call({String invitationId, String status});
}

/// @nodoc
class __$$_ReplyToInvitationCommandCopyWithImpl<$Res>
    extends _$ReplyToInvitationCommandCopyWithImpl<$Res,
        _$_ReplyToInvitationCommand>
    implements _$$_ReplyToInvitationCommandCopyWith<$Res> {
  __$$_ReplyToInvitationCommandCopyWithImpl(_$_ReplyToInvitationCommand _value,
      $Res Function(_$_ReplyToInvitationCommand) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? invitationId = null,
    Object? status = null,
  }) {
    return _then(_$_ReplyToInvitationCommand(
      invitationId: null == invitationId
          ? _value.invitationId
          : invitationId // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
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
            (identical(other.invitationId, invitationId) ||
                other.invitationId == invitationId) &&
            (identical(other.status, status) || other.status == status));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, invitationId, status);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
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
