// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'create_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

CreateEventCommand _$CreateEventCommandFromJson(Map<String, dynamic> json) {
  return _CreateEventCommand.fromJson(json);
}

/// @nodoc
mixin _$CreateEventCommand {
  String get teamId => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  DateTime get startTime => throw _privateConstructorUsedError;
  String get createdByUserId => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  String? get iconName => throw _privateConstructorUsedError;
  DateTime? get endTime => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CreateEventCommandCopyWith<CreateEventCommand> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CreateEventCommandCopyWith<$Res> {
  factory $CreateEventCommandCopyWith(
          CreateEventCommand value, $Res Function(CreateEventCommand) then) =
      _$CreateEventCommandCopyWithImpl<$Res, CreateEventCommand>;
  @useResult
  $Res call(
      {String teamId,
      String name,
      DateTime startTime,
      String createdByUserId,
      String? description,
      String? iconName,
      DateTime? endTime});
}

/// @nodoc
class _$CreateEventCommandCopyWithImpl<$Res, $Val extends CreateEventCommand>
    implements $CreateEventCommandCopyWith<$Res> {
  _$CreateEventCommandCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? teamId = null,
    Object? name = null,
    Object? startTime = null,
    Object? createdByUserId = null,
    Object? description = freezed,
    Object? iconName = freezed,
    Object? endTime = freezed,
  }) {
    return _then(_value.copyWith(
      teamId: null == teamId
          ? _value.teamId
          : teamId // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      startTime: null == startTime
          ? _value.startTime
          : startTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
      createdByUserId: null == createdByUserId
          ? _value.createdByUserId
          : createdByUserId // ignore: cast_nullable_to_non_nullable
              as String,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      iconName: freezed == iconName
          ? _value.iconName
          : iconName // ignore: cast_nullable_to_non_nullable
              as String?,
      endTime: freezed == endTime
          ? _value.endTime
          : endTime // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_CreateEventCommandCopyWith<$Res>
    implements $CreateEventCommandCopyWith<$Res> {
  factory _$$_CreateEventCommandCopyWith(_$_CreateEventCommand value,
          $Res Function(_$_CreateEventCommand) then) =
      __$$_CreateEventCommandCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String teamId,
      String name,
      DateTime startTime,
      String createdByUserId,
      String? description,
      String? iconName,
      DateTime? endTime});
}

/// @nodoc
class __$$_CreateEventCommandCopyWithImpl<$Res>
    extends _$CreateEventCommandCopyWithImpl<$Res, _$_CreateEventCommand>
    implements _$$_CreateEventCommandCopyWith<$Res> {
  __$$_CreateEventCommandCopyWithImpl(
      _$_CreateEventCommand _value, $Res Function(_$_CreateEventCommand) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? teamId = null,
    Object? name = null,
    Object? startTime = null,
    Object? createdByUserId = null,
    Object? description = freezed,
    Object? iconName = freezed,
    Object? endTime = freezed,
  }) {
    return _then(_$_CreateEventCommand(
      teamId: null == teamId
          ? _value.teamId
          : teamId // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      startTime: null == startTime
          ? _value.startTime
          : startTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
      createdByUserId: null == createdByUserId
          ? _value.createdByUserId
          : createdByUserId // ignore: cast_nullable_to_non_nullable
              as String,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      iconName: freezed == iconName
          ? _value.iconName
          : iconName // ignore: cast_nullable_to_non_nullable
              as String?,
      endTime: freezed == endTime
          ? _value.endTime
          : endTime // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_CreateEventCommand extends _CreateEventCommand
    with DiagnosticableTreeMixin {
  const _$_CreateEventCommand(
      {required this.teamId,
      required this.name,
      required this.startTime,
      required this.createdByUserId,
      this.description,
      this.iconName,
      this.endTime})
      : super._();

  factory _$_CreateEventCommand.fromJson(Map<String, dynamic> json) =>
      _$$_CreateEventCommandFromJson(json);

  @override
  final String teamId;
  @override
  final String name;
  @override
  final DateTime startTime;
  @override
  final String createdByUserId;
  @override
  final String? description;
  @override
  final String? iconName;
  @override
  final DateTime? endTime;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'CreateEventCommand(teamId: $teamId, name: $name, startTime: $startTime, createdByUserId: $createdByUserId, description: $description, iconName: $iconName, endTime: $endTime)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'CreateEventCommand'))
      ..add(DiagnosticsProperty('teamId', teamId))
      ..add(DiagnosticsProperty('name', name))
      ..add(DiagnosticsProperty('startTime', startTime))
      ..add(DiagnosticsProperty('createdByUserId', createdByUserId))
      ..add(DiagnosticsProperty('description', description))
      ..add(DiagnosticsProperty('iconName', iconName))
      ..add(DiagnosticsProperty('endTime', endTime));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_CreateEventCommand &&
            (identical(other.teamId, teamId) || other.teamId == teamId) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.startTime, startTime) ||
                other.startTime == startTime) &&
            (identical(other.createdByUserId, createdByUserId) ||
                other.createdByUserId == createdByUserId) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.iconName, iconName) ||
                other.iconName == iconName) &&
            (identical(other.endTime, endTime) || other.endTime == endTime));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, teamId, name, startTime,
      createdByUserId, description, iconName, endTime);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_CreateEventCommandCopyWith<_$_CreateEventCommand> get copyWith =>
      __$$_CreateEventCommandCopyWithImpl<_$_CreateEventCommand>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_CreateEventCommandToJson(
      this,
    );
  }
}

abstract class _CreateEventCommand extends CreateEventCommand {
  const factory _CreateEventCommand(
      {required final String teamId,
      required final String name,
      required final DateTime startTime,
      required final String createdByUserId,
      final String? description,
      final String? iconName,
      final DateTime? endTime}) = _$_CreateEventCommand;
  const _CreateEventCommand._() : super._();

  factory _CreateEventCommand.fromJson(Map<String, dynamic> json) =
      _$_CreateEventCommand.fromJson;

  @override
  String get teamId;
  @override
  String get name;
  @override
  DateTime get startTime;
  @override
  String get createdByUserId;
  @override
  String? get description;
  @override
  String? get iconName;
  @override
  DateTime? get endTime;
  @override
  @JsonKey(ignore: true)
  _$$_CreateEventCommandCopyWith<_$_CreateEventCommand> get copyWith =>
      throw _privateConstructorUsedError;
}
