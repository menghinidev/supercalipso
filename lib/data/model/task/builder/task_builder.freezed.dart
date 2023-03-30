// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'task_builder.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$TaskBuilder {
  String? get title => throw _privateConstructorUsedError;
  DateTime? get deadline => throw _privateConstructorUsedError;
  String? get assignedUserId => throw _privateConstructorUsedError;
  String? get iconName => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $TaskBuilderCopyWith<TaskBuilder> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TaskBuilderCopyWith<$Res> {
  factory $TaskBuilderCopyWith(
          TaskBuilder value, $Res Function(TaskBuilder) then) =
      _$TaskBuilderCopyWithImpl<$Res, TaskBuilder>;
  @useResult
  $Res call(
      {String? title,
      DateTime? deadline,
      String? assignedUserId,
      String? iconName});
}

/// @nodoc
class _$TaskBuilderCopyWithImpl<$Res, $Val extends TaskBuilder>
    implements $TaskBuilderCopyWith<$Res> {
  _$TaskBuilderCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = freezed,
    Object? deadline = freezed,
    Object? assignedUserId = freezed,
    Object? iconName = freezed,
  }) {
    return _then(_value.copyWith(
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      deadline: freezed == deadline
          ? _value.deadline
          : deadline // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      assignedUserId: freezed == assignedUserId
          ? _value.assignedUserId
          : assignedUserId // ignore: cast_nullable_to_non_nullable
              as String?,
      iconName: freezed == iconName
          ? _value.iconName
          : iconName // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_TaskBuilderCopyWith<$Res>
    implements $TaskBuilderCopyWith<$Res> {
  factory _$$_TaskBuilderCopyWith(
          _$_TaskBuilder value, $Res Function(_$_TaskBuilder) then) =
      __$$_TaskBuilderCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? title,
      DateTime? deadline,
      String? assignedUserId,
      String? iconName});
}

/// @nodoc
class __$$_TaskBuilderCopyWithImpl<$Res>
    extends _$TaskBuilderCopyWithImpl<$Res, _$_TaskBuilder>
    implements _$$_TaskBuilderCopyWith<$Res> {
  __$$_TaskBuilderCopyWithImpl(
      _$_TaskBuilder _value, $Res Function(_$_TaskBuilder) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = freezed,
    Object? deadline = freezed,
    Object? assignedUserId = freezed,
    Object? iconName = freezed,
  }) {
    return _then(_$_TaskBuilder(
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      deadline: freezed == deadline
          ? _value.deadline
          : deadline // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      assignedUserId: freezed == assignedUserId
          ? _value.assignedUserId
          : assignedUserId // ignore: cast_nullable_to_non_nullable
              as String?,
      iconName: freezed == iconName
          ? _value.iconName
          : iconName // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$_TaskBuilder extends _TaskBuilder {
  _$_TaskBuilder(
      {this.title, this.deadline, this.assignedUserId, this.iconName})
      : super._();

  @override
  final String? title;
  @override
  final DateTime? deadline;
  @override
  final String? assignedUserId;
  @override
  final String? iconName;

  @override
  String toString() {
    return 'TaskBuilder(title: $title, deadline: $deadline, assignedUserId: $assignedUserId, iconName: $iconName)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_TaskBuilder &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.deadline, deadline) ||
                other.deadline == deadline) &&
            (identical(other.assignedUserId, assignedUserId) ||
                other.assignedUserId == assignedUserId) &&
            (identical(other.iconName, iconName) ||
                other.iconName == iconName));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, title, deadline, assignedUserId, iconName);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_TaskBuilderCopyWith<_$_TaskBuilder> get copyWith =>
      __$$_TaskBuilderCopyWithImpl<_$_TaskBuilder>(this, _$identity);
}

abstract class _TaskBuilder extends TaskBuilder {
  factory _TaskBuilder(
      {final String? title,
      final DateTime? deadline,
      final String? assignedUserId,
      final String? iconName}) = _$_TaskBuilder;
  _TaskBuilder._() : super._();

  @override
  String? get title;
  @override
  DateTime? get deadline;
  @override
  String? get assignedUserId;
  @override
  String? get iconName;
  @override
  @JsonKey(ignore: true)
  _$$_TaskBuilderCopyWith<_$_TaskBuilder> get copyWith =>
      throw _privateConstructorUsedError;
}
