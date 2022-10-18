// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

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
      _$CreateEventCommandCopyWithImpl<$Res>;
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
class _$CreateEventCommandCopyWithImpl<$Res>
    implements $CreateEventCommandCopyWith<$Res> {
  _$CreateEventCommandCopyWithImpl(this._value, this._then);

  final CreateEventCommand _value;
  // ignore: unused_field
  final $Res Function(CreateEventCommand) _then;

  @override
  $Res call({
    Object? teamId = freezed,
    Object? name = freezed,
    Object? startTime = freezed,
    Object? createdByUserId = freezed,
    Object? description = freezed,
    Object? iconName = freezed,
    Object? endTime = freezed,
  }) {
    return _then(_value.copyWith(
      teamId: teamId == freezed
          ? _value.teamId
          : teamId // ignore: cast_nullable_to_non_nullable
              as String,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      startTime: startTime == freezed
          ? _value.startTime
          : startTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
      createdByUserId: createdByUserId == freezed
          ? _value.createdByUserId
          : createdByUserId // ignore: cast_nullable_to_non_nullable
              as String,
      description: description == freezed
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      iconName: iconName == freezed
          ? _value.iconName
          : iconName // ignore: cast_nullable_to_non_nullable
              as String?,
      endTime: endTime == freezed
          ? _value.endTime
          : endTime // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
abstract class _$$_CreateEventCommandCopyWith<$Res>
    implements $CreateEventCommandCopyWith<$Res> {
  factory _$$_CreateEventCommandCopyWith(_$_CreateEventCommand value,
          $Res Function(_$_CreateEventCommand) then) =
      __$$_CreateEventCommandCopyWithImpl<$Res>;
  @override
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
    extends _$CreateEventCommandCopyWithImpl<$Res>
    implements _$$_CreateEventCommandCopyWith<$Res> {
  __$$_CreateEventCommandCopyWithImpl(
      _$_CreateEventCommand _value, $Res Function(_$_CreateEventCommand) _then)
      : super(_value, (v) => _then(v as _$_CreateEventCommand));

  @override
  _$_CreateEventCommand get _value => super._value as _$_CreateEventCommand;

  @override
  $Res call({
    Object? teamId = freezed,
    Object? name = freezed,
    Object? startTime = freezed,
    Object? createdByUserId = freezed,
    Object? description = freezed,
    Object? iconName = freezed,
    Object? endTime = freezed,
  }) {
    return _then(_$_CreateEventCommand(
      teamId: teamId == freezed
          ? _value.teamId
          : teamId // ignore: cast_nullable_to_non_nullable
              as String,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      startTime: startTime == freezed
          ? _value.startTime
          : startTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
      createdByUserId: createdByUserId == freezed
          ? _value.createdByUserId
          : createdByUserId // ignore: cast_nullable_to_non_nullable
              as String,
      description: description == freezed
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      iconName: iconName == freezed
          ? _value.iconName
          : iconName // ignore: cast_nullable_to_non_nullable
              as String?,
      endTime: endTime == freezed
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
            const DeepCollectionEquality().equals(other.teamId, teamId) &&
            const DeepCollectionEquality().equals(other.name, name) &&
            const DeepCollectionEquality().equals(other.startTime, startTime) &&
            const DeepCollectionEquality()
                .equals(other.createdByUserId, createdByUserId) &&
            const DeepCollectionEquality()
                .equals(other.description, description) &&
            const DeepCollectionEquality().equals(other.iconName, iconName) &&
            const DeepCollectionEquality().equals(other.endTime, endTime));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(teamId),
      const DeepCollectionEquality().hash(name),
      const DeepCollectionEquality().hash(startTime),
      const DeepCollectionEquality().hash(createdByUserId),
      const DeepCollectionEquality().hash(description),
      const DeepCollectionEquality().hash(iconName),
      const DeepCollectionEquality().hash(endTime));

  @JsonKey(ignore: true)
  @override
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
