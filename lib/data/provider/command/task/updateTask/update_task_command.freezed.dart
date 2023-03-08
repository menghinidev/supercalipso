// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

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
  TaskStatus? get status => throw _privateConstructorUsedError;
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
      _$UpdateTaskCommandCopyWithImpl<$Res, UpdateTaskCommand>;
  @useResult
  $Res call(
      {String taskId,
      TaskStatus? status,
      String? title,
      DateTime? deadline,
      String? iconName,
      String? assignedUserId});
}

/// @nodoc
class _$UpdateTaskCommandCopyWithImpl<$Res, $Val extends UpdateTaskCommand>
    implements $UpdateTaskCommandCopyWith<$Res> {
  _$UpdateTaskCommandCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? taskId = null,
    Object? status = freezed,
    Object? title = freezed,
    Object? deadline = freezed,
    Object? iconName = freezed,
    Object? assignedUserId = freezed,
  }) {
    return _then(_value.copyWith(
      taskId: null == taskId
          ? _value.taskId
          : taskId // ignore: cast_nullable_to_non_nullable
              as String,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as TaskStatus?,
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      deadline: freezed == deadline
          ? _value.deadline
          : deadline // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      iconName: freezed == iconName
          ? _value.iconName
          : iconName // ignore: cast_nullable_to_non_nullable
              as String?,
      assignedUserId: freezed == assignedUserId
          ? _value.assignedUserId
          : assignedUserId // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_UpdateTaskCommandCopyWith<$Res>
    implements $UpdateTaskCommandCopyWith<$Res> {
  factory _$$_UpdateTaskCommandCopyWith(_$_UpdateTaskCommand value,
          $Res Function(_$_UpdateTaskCommand) then) =
      __$$_UpdateTaskCommandCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String taskId,
      TaskStatus? status,
      String? title,
      DateTime? deadline,
      String? iconName,
      String? assignedUserId});
}

/// @nodoc
class __$$_UpdateTaskCommandCopyWithImpl<$Res>
    extends _$UpdateTaskCommandCopyWithImpl<$Res, _$_UpdateTaskCommand>
    implements _$$_UpdateTaskCommandCopyWith<$Res> {
  __$$_UpdateTaskCommandCopyWithImpl(
      _$_UpdateTaskCommand _value, $Res Function(_$_UpdateTaskCommand) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? taskId = null,
    Object? status = freezed,
    Object? title = freezed,
    Object? deadline = freezed,
    Object? iconName = freezed,
    Object? assignedUserId = freezed,
  }) {
    return _then(_$_UpdateTaskCommand(
      taskId: null == taskId
          ? _value.taskId
          : taskId // ignore: cast_nullable_to_non_nullable
              as String,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as TaskStatus?,
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      deadline: freezed == deadline
          ? _value.deadline
          : deadline // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      iconName: freezed == iconName
          ? _value.iconName
          : iconName // ignore: cast_nullable_to_non_nullable
              as String?,
      assignedUserId: freezed == assignedUserId
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
      this.status,
      this.title,
      this.deadline,
      this.iconName,
      this.assignedUserId});

  factory _$_UpdateTaskCommand.fromJson(Map<String, dynamic> json) =>
      _$$_UpdateTaskCommandFromJson(json);

  @override
  final String taskId;
  @override
  final TaskStatus? status;
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
    return 'UpdateTaskCommand(taskId: $taskId, status: $status, title: $title, deadline: $deadline, iconName: $iconName, assignedUserId: $assignedUserId)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_UpdateTaskCommand &&
            (identical(other.taskId, taskId) || other.taskId == taskId) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.deadline, deadline) ||
                other.deadline == deadline) &&
            (identical(other.iconName, iconName) ||
                other.iconName == iconName) &&
            (identical(other.assignedUserId, assignedUserId) ||
                other.assignedUserId == assignedUserId));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, taskId, status, title, deadline, iconName, assignedUserId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
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
      final TaskStatus? status,
      final String? title,
      final DateTime? deadline,
      final String? iconName,
      final String? assignedUserId}) = _$_UpdateTaskCommand;

  factory _UpdateTaskCommand.fromJson(Map<String, dynamic> json) =
      _$_UpdateTaskCommand.fromJson;

  @override
  String get taskId;
  @override
  TaskStatus? get status;
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
