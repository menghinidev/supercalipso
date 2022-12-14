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
  String get teamId => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  DateTime? get deadline => throw _privateConstructorUsedError;
  String? get iconName => throw _privateConstructorUsedError;
  String? get assignedUserId => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CreateTaskCommandCopyWith<CreateTaskCommand> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CreateTaskCommandCopyWith<$Res> {
  factory $CreateTaskCommandCopyWith(
          CreateTaskCommand value, $Res Function(CreateTaskCommand) then) =
      _$CreateTaskCommandCopyWithImpl<$Res>;
  $Res call(
      {String teamId,
      String title,
      DateTime? deadline,
      String? iconName,
      String? assignedUserId});
}

/// @nodoc
class _$CreateTaskCommandCopyWithImpl<$Res>
    implements $CreateTaskCommandCopyWith<$Res> {
  _$CreateTaskCommandCopyWithImpl(this._value, this._then);

  final CreateTaskCommand _value;
  // ignore: unused_field
  final $Res Function(CreateTaskCommand) _then;

  @override
  $Res call({
    Object? teamId = freezed,
    Object? title = freezed,
    Object? deadline = freezed,
    Object? iconName = freezed,
    Object? assignedUserId = freezed,
  }) {
    return _then(_value.copyWith(
      teamId: teamId == freezed
          ? _value.teamId
          : teamId // ignore: cast_nullable_to_non_nullable
              as String,
      title: title == freezed
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
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
abstract class _$$_CreateTaskCommandCopyWith<$Res>
    implements $CreateTaskCommandCopyWith<$Res> {
  factory _$$_CreateTaskCommandCopyWith(_$_CreateTaskCommand value,
          $Res Function(_$_CreateTaskCommand) then) =
      __$$_CreateTaskCommandCopyWithImpl<$Res>;
  @override
  $Res call(
      {String teamId,
      String title,
      DateTime? deadline,
      String? iconName,
      String? assignedUserId});
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

  @override
  $Res call({
    Object? teamId = freezed,
    Object? title = freezed,
    Object? deadline = freezed,
    Object? iconName = freezed,
    Object? assignedUserId = freezed,
  }) {
    return _then(_$_CreateTaskCommand(
      teamId: teamId == freezed
          ? _value.teamId
          : teamId // ignore: cast_nullable_to_non_nullable
              as String,
      title: title == freezed
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
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
class _$_CreateTaskCommand extends _CreateTaskCommand {
  _$_CreateTaskCommand(
      {required this.teamId,
      required this.title,
      this.deadline,
      this.iconName,
      this.assignedUserId})
      : super._();

  factory _$_CreateTaskCommand.fromJson(Map<String, dynamic> json) =>
      _$$_CreateTaskCommandFromJson(json);

  @override
  final String teamId;
  @override
  final String title;
  @override
  final DateTime? deadline;
  @override
  final String? iconName;
  @override
  final String? assignedUserId;

  @override
  String toString() {
    return 'CreateTaskCommand(teamId: $teamId, title: $title, deadline: $deadline, iconName: $iconName, assignedUserId: $assignedUserId)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_CreateTaskCommand &&
            const DeepCollectionEquality().equals(other.teamId, teamId) &&
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
      const DeepCollectionEquality().hash(teamId),
      const DeepCollectionEquality().hash(title),
      const DeepCollectionEquality().hash(deadline),
      const DeepCollectionEquality().hash(iconName),
      const DeepCollectionEquality().hash(assignedUserId));

  @JsonKey(ignore: true)
  @override
  _$$_CreateTaskCommandCopyWith<_$_CreateTaskCommand> get copyWith =>
      __$$_CreateTaskCommandCopyWithImpl<_$_CreateTaskCommand>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_CreateTaskCommandToJson(
      this,
    );
  }
}

abstract class _CreateTaskCommand extends CreateTaskCommand {
  factory _CreateTaskCommand(
      {required final String teamId,
      required final String title,
      final DateTime? deadline,
      final String? iconName,
      final String? assignedUserId}) = _$_CreateTaskCommand;
  _CreateTaskCommand._() : super._();

  factory _CreateTaskCommand.fromJson(Map<String, dynamic> json) =
      _$_CreateTaskCommand.fromJson;

  @override
  String get teamId;
  @override
  String get title;
  @override
  DateTime? get deadline;
  @override
  String? get iconName;
  @override
  String? get assignedUserId;
  @override
  @JsonKey(ignore: true)
  _$$_CreateTaskCommandCopyWith<_$_CreateTaskCommand> get copyWith =>
      throw _privateConstructorUsedError;
}
