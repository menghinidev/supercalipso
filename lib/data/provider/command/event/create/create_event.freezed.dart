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
  Duration get duration => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;

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
      Duration duration,
      String? description});
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
    Object? duration = freezed,
    Object? description = freezed,
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
      duration: duration == freezed
          ? _value.duration
          : duration // ignore: cast_nullable_to_non_nullable
              as Duration,
      description: description == freezed
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
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
      Duration duration,
      String? description});
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
    Object? duration = freezed,
    Object? description = freezed,
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
      duration: duration == freezed
          ? _value.duration
          : duration // ignore: cast_nullable_to_non_nullable
              as Duration,
      description: description == freezed
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
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
      required this.duration,
      this.description})
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
  final Duration duration;
  @override
  final String? description;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'CreateEventCommand(teamId: $teamId, name: $name, startTime: $startTime, duration: $duration, description: $description)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'CreateEventCommand'))
      ..add(DiagnosticsProperty('teamId', teamId))
      ..add(DiagnosticsProperty('name', name))
      ..add(DiagnosticsProperty('startTime', startTime))
      ..add(DiagnosticsProperty('duration', duration))
      ..add(DiagnosticsProperty('description', description));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_CreateEventCommand &&
            const DeepCollectionEquality().equals(other.teamId, teamId) &&
            const DeepCollectionEquality().equals(other.name, name) &&
            const DeepCollectionEquality().equals(other.startTime, startTime) &&
            const DeepCollectionEquality().equals(other.duration, duration) &&
            const DeepCollectionEquality()
                .equals(other.description, description));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(teamId),
      const DeepCollectionEquality().hash(name),
      const DeepCollectionEquality().hash(startTime),
      const DeepCollectionEquality().hash(duration),
      const DeepCollectionEquality().hash(description));

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
      required final Duration duration,
      final String? description}) = _$_CreateEventCommand;
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
  Duration get duration;
  @override
  String? get description;
  @override
  @JsonKey(ignore: true)
  _$$_CreateEventCommandCopyWith<_$_CreateEventCommand> get copyWith =>
      throw _privateConstructorUsedError;
}
