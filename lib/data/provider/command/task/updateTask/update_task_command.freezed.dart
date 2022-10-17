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
  String get taskId => throw _privateConstructorUsedError;
  String? get title => throw _privateConstructorUsedError;
  DateTime? get deadline => throw _privateConstructorUsedError;
  String? get iconName => throw _privateConstructorUsedError;
  String? get assignedUserId => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UpdateTaskCommandCopyWith<UpdateTaskCommand> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UpdateTaskCommandCopyWith<$Res> {
  factory $UpdateTaskCommandCopyWith(
          UpdateTaskCommand value, $Res Function(UpdateTaskCommand) then) =
      _$UpdateTaskCommandCopyWithImpl<$Res>;
  $Res call(
      {String taskId,
      String? title,
      DateTime? deadline,
      String? iconName,
      String? assignedUserId});
}

/// @nodoc
class _$UpdateTaskCommandCopyWithImpl<$Res>
    implements $UpdateTaskCommandCopyWith<$Res> {
  _$UpdateTaskCommandCopyWithImpl(this._value, this._then);

  final UpdateTaskCommand _value;
  // ignore: unused_field
  final $Res Function(UpdateTaskCommand) _then;

  @override
  $Res call({
    Object? taskId = freezed,
    Object? title = freezed,
    Object? deadline = freezed,
    Object? iconName = freezed,
    Object? assignedUserId = freezed,
  }) {
    return _then(_value.copyWith(
      taskId: taskId == freezed
          ? _value.taskId
          : taskId // ignore: cast_nullable_to_non_nullable
              as String,
      title: title == freezed
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      deadline: deadline == freezed
          ? _value.deadline
          : deadline // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      iconName: iconName == freezed
          ? _value.iconName
          : iconName // ignore: cast_nullable_to_non_nullable
              as String?,
      assignedUserId: assignedUserId == freezed
          ? _value.assignedUserId
          : assignedUserId // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
abstract class _$$_UpdateTaskCommandCopyWith<$Res>
    implements $UpdateTaskCommandCopyWith<$Res> {
  factory _$$_UpdateTaskCommandCopyWith(_$_UpdateTaskCommand value,
          $Res Function(_$_UpdateTaskCommand) then) =
      __$$_UpdateTaskCommandCopyWithImpl<$Res>;
  @override
  $Res call(
      {String taskId,
      String? title,
      DateTime? deadline,
      String? iconName,
      String? assignedUserId});
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

  @override
  $Res call({
    Object? taskId = freezed,
    Object? title = freezed,
    Object? deadline = freezed,
    Object? iconName = freezed,
    Object? assignedUserId = freezed,
  }) {
    return _then(_$_UpdateTaskCommand(
      taskId: taskId == freezed
          ? _value.taskId
          : taskId // ignore: cast_nullable_to_non_nullable
              as String,
      title: title == freezed
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      deadline: deadline == freezed
          ? _value.deadline
          : deadline // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      iconName: iconName == freezed
          ? _value.iconName
          : iconName // ignore: cast_nullable_to_non_nullable
              as String?,
      assignedUserId: assignedUserId == freezed
          ? _value.assignedUserId
          : assignedUserId // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_UpdateTaskCommand implements _UpdateTaskCommand {
  _$_UpdateTaskCommand(
      {required this.taskId,
      this.title,
      this.deadline,
      this.iconName,
      this.assignedUserId});

  factory _$_UpdateTaskCommand.fromJson(Map<String, dynamic> json) =>
      _$$_UpdateTaskCommandFromJson(json);

  @override
  final String taskId;
  @override
  final String? title;
  @override
  final DateTime? deadline;
  @override
  final String? iconName;
  @override
  final String? assignedUserId;

  @override
  String toString() {
    return 'UpdateTaskCommand(taskId: $taskId, title: $title, deadline: $deadline, iconName: $iconName, assignedUserId: $assignedUserId)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_UpdateTaskCommand &&
            const DeepCollectionEquality().equals(other.taskId, taskId) &&
            const DeepCollectionEquality().equals(other.title, title) &&
            const DeepCollectionEquality().equals(other.deadline, deadline) &&
            const DeepCollectionEquality().equals(other.iconName, iconName) &&
            const DeepCollectionEquality()
                .equals(other.assignedUserId, assignedUserId));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(taskId),
      const DeepCollectionEquality().hash(title),
      const DeepCollectionEquality().hash(deadline),
      const DeepCollectionEquality().hash(iconName),
      const DeepCollectionEquality().hash(assignedUserId));

  @JsonKey(ignore: true)
  @override
  _$$_UpdateTaskCommandCopyWith<_$_UpdateTaskCommand> get copyWith =>
      __$$_UpdateTaskCommandCopyWithImpl<_$_UpdateTaskCommand>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_UpdateTaskCommandToJson(
      this,
    );
  }
}

abstract class _UpdateTaskCommand implements UpdateTaskCommand {
  factory _UpdateTaskCommand(
      {required final String taskId,
      final String? title,
      final DateTime? deadline,
      final String? iconName,
      final String? assignedUserId}) = _$_UpdateTaskCommand;

  factory _UpdateTaskCommand.fromJson(Map<String, dynamic> json) =
      _$_UpdateTaskCommand.fromJson;

  @override
  String get taskId;
  @override
  String? get title;
  @override
  DateTime? get deadline;
  @override
  String? get iconName;
  @override
  String? get assignedUserId;
  @override
  @JsonKey(ignore: true)
  _$$_UpdateTaskCommandCopyWith<_$_UpdateTaskCommand> get copyWith =>
      throw _privateConstructorUsedError;
}
