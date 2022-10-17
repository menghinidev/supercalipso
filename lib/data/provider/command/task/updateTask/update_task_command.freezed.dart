// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'update_task_command.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

UpdateTaskCommand _$UpdateTaskCommandFromJson(Map<String, dynamic> json) {
  return _UpdateTaskCommand.fromJson(json);
}

/// @nodoc
mixin _$UpdateTaskCommand {
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UpdateTaskCommandCopyWith<$Res> {
  factory $UpdateTaskCommandCopyWith(
          UpdateTaskCommand value, $Res Function(UpdateTaskCommand) then) =
      _$UpdateTaskCommandCopyWithImpl<$Res>;
}

/// @nodoc
class _$UpdateTaskCommandCopyWithImpl<$Res>
    implements $UpdateTaskCommandCopyWith<$Res> {
  _$UpdateTaskCommandCopyWithImpl(this._value, this._then);

  final UpdateTaskCommand _value;
  // ignore: unused_field
  final $Res Function(UpdateTaskCommand) _then;
}

/// @nodoc
abstract class _$$_UpdateTaskCommandCopyWith<$Res> {
  factory _$$_UpdateTaskCommandCopyWith(_$_UpdateTaskCommand value,
          $Res Function(_$_UpdateTaskCommand) then) =
      __$$_UpdateTaskCommandCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_UpdateTaskCommandCopyWithImpl<$Res>
    extends _$UpdateTaskCommandCopyWithImpl<$Res>
    implements _$$_UpdateTaskCommandCopyWith<$Res> {
  __$$_UpdateTaskCommandCopyWithImpl(
      _$_UpdateTaskCommand _value, $Res Function(_$_UpdateTaskCommand) _then)
      : super(_value, (v) => _then(v as _$_UpdateTaskCommand));

  @override
  _$_UpdateTaskCommand get _value => super._value as _$_UpdateTaskCommand;
}

/// @nodoc
@JsonSerializable()
class _$_UpdateTaskCommand implements _UpdateTaskCommand {
  _$_UpdateTaskCommand();

  factory _$_UpdateTaskCommand.fromJson(Map<String, dynamic> json) =>
      _$$_UpdateTaskCommandFromJson(json);

  @override
  String toString() {
    return 'UpdateTaskCommand()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_UpdateTaskCommand);
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => runtimeType.hashCode;

  @override
  Map<String, dynamic> toJson() {
    return _$$_UpdateTaskCommandToJson(
      this,
    );
  }
}

abstract class _UpdateTaskCommand implements UpdateTaskCommand {
  factory _UpdateTaskCommand() = _$_UpdateTaskCommand;

  factory _UpdateTaskCommand.fromJson(Map<String, dynamic> json) =
      _$_UpdateTaskCommand.fromJson;
}
