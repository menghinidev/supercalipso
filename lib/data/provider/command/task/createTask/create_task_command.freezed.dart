// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'create_task_command.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

CreateTaskCommand _$CreateTaskCommandFromJson(Map<String, dynamic> json) {
  return _CreateTaskCommand.fromJson(json);
}

/// @nodoc
mixin _$CreateTaskCommand {
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CreateTaskCommandCopyWith<$Res> {
  factory $CreateTaskCommandCopyWith(
          CreateTaskCommand value, $Res Function(CreateTaskCommand) then) =
      _$CreateTaskCommandCopyWithImpl<$Res>;
}

/// @nodoc
class _$CreateTaskCommandCopyWithImpl<$Res>
    implements $CreateTaskCommandCopyWith<$Res> {
  _$CreateTaskCommandCopyWithImpl(this._value, this._then);

  final CreateTaskCommand _value;
  // ignore: unused_field
  final $Res Function(CreateTaskCommand) _then;
}

/// @nodoc
abstract class _$$_CreateTaskCommandCopyWith<$Res> {
  factory _$$_CreateTaskCommandCopyWith(_$_CreateTaskCommand value,
          $Res Function(_$_CreateTaskCommand) then) =
      __$$_CreateTaskCommandCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_CreateTaskCommandCopyWithImpl<$Res>
    extends _$CreateTaskCommandCopyWithImpl<$Res>
    implements _$$_CreateTaskCommandCopyWith<$Res> {
  __$$_CreateTaskCommandCopyWithImpl(
      _$_CreateTaskCommand _value, $Res Function(_$_CreateTaskCommand) _then)
      : super(_value, (v) => _then(v as _$_CreateTaskCommand));

  @override
  _$_CreateTaskCommand get _value => super._value as _$_CreateTaskCommand;
}

/// @nodoc
@JsonSerializable()
class _$_CreateTaskCommand implements _CreateTaskCommand {
  _$_CreateTaskCommand();

  factory _$_CreateTaskCommand.fromJson(Map<String, dynamic> json) =>
      _$$_CreateTaskCommandFromJson(json);

  @override
  String toString() {
    return 'CreateTaskCommand()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_CreateTaskCommand);
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => runtimeType.hashCode;

  @override
  Map<String, dynamic> toJson() {
    return _$$_CreateTaskCommandToJson(
      this,
    );
  }
}

abstract class _CreateTaskCommand implements CreateTaskCommand {
  factory _CreateTaskCommand() = _$_CreateTaskCommand;

  factory _CreateTaskCommand.fromJson(Map<String, dynamic> json) =
      _$_CreateTaskCommand.fromJson;
}
