// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'team_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

TeamEvent _$TeamEventFromJson(Map<String, dynamic> json) {
  return _TeamEvent.fromJson(json);
}

/// @nodoc
mixin _$TeamEvent {
  String get eventId => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  DateTime get startTime => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  Team get team => throw _privateConstructorUsedError;
  Duration? get duration => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TeamEventCopyWith<TeamEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TeamEventCopyWith<$Res> {
  factory $TeamEventCopyWith(TeamEvent value, $Res Function(TeamEvent) then) =
      _$TeamEventCopyWithImpl<$Res>;
  $Res call(
      {String eventId,
      String name,
      DateTime startTime,
      String? description,
      Team team,
      Duration? duration});

  $TeamCopyWith<$Res> get team;
}

/// @nodoc
class _$TeamEventCopyWithImpl<$Res> implements $TeamEventCopyWith<$Res> {
  _$TeamEventCopyWithImpl(this._value, this._then);

  final TeamEvent _value;
  // ignore: unused_field
  final $Res Function(TeamEvent) _then;

  @override
  $Res call({
    Object? eventId = freezed,
    Object? name = freezed,
    Object? startTime = freezed,
    Object? description = freezed,
    Object? team = freezed,
    Object? duration = freezed,
  }) {
    return _then(_value.copyWith(
      eventId: eventId == freezed
          ? _value.eventId
          : eventId // ignore: cast_nullable_to_non_nullable
              as String,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      startTime: startTime == freezed
          ? _value.startTime
          : startTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
      description: description == freezed
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      team: team == freezed
          ? _value.team
          : team // ignore: cast_nullable_to_non_nullable
              as Team,
      duration: duration == freezed
          ? _value.duration
          : duration // ignore: cast_nullable_to_non_nullable
              as Duration?,
    ));
  }

  @override
  $TeamCopyWith<$Res> get team {
    return $TeamCopyWith<$Res>(_value.team, (value) {
      return _then(_value.copyWith(team: value));
    });
  }
}

/// @nodoc
abstract class _$$_TeamEventCopyWith<$Res> implements $TeamEventCopyWith<$Res> {
  factory _$$_TeamEventCopyWith(
          _$_TeamEvent value, $Res Function(_$_TeamEvent) then) =
      __$$_TeamEventCopyWithImpl<$Res>;
  @override
  $Res call(
      {String eventId,
      String name,
      DateTime startTime,
      String? description,
      Team team,
      Duration? duration});

  @override
  $TeamCopyWith<$Res> get team;
}

/// @nodoc
class __$$_TeamEventCopyWithImpl<$Res> extends _$TeamEventCopyWithImpl<$Res>
    implements _$$_TeamEventCopyWith<$Res> {
  __$$_TeamEventCopyWithImpl(
      _$_TeamEvent _value, $Res Function(_$_TeamEvent) _then)
      : super(_value, (v) => _then(v as _$_TeamEvent));

  @override
  _$_TeamEvent get _value => super._value as _$_TeamEvent;

  @override
  $Res call({
    Object? eventId = freezed,
    Object? name = freezed,
    Object? startTime = freezed,
    Object? description = freezed,
    Object? team = freezed,
    Object? duration = freezed,
  }) {
    return _then(_$_TeamEvent(
      eventId: eventId == freezed
          ? _value.eventId
          : eventId // ignore: cast_nullable_to_non_nullable
              as String,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      startTime: startTime == freezed
          ? _value.startTime
          : startTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
      description: description == freezed
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      team: team == freezed
          ? _value.team
          : team // ignore: cast_nullable_to_non_nullable
              as Team,
      duration: duration == freezed
          ? _value.duration
          : duration // ignore: cast_nullable_to_non_nullable
              as Duration?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_TeamEvent extends _TeamEvent {
  const _$_TeamEvent(
      {required this.eventId,
      required this.name,
      required this.startTime,
      this.description,
      required this.team,
      this.duration = Duration.zero})
      : super._();

  factory _$_TeamEvent.fromJson(Map<String, dynamic> json) =>
      _$$_TeamEventFromJson(json);

  @override
  final String eventId;
  @override
  final String name;
  @override
  final DateTime startTime;
  @override
  final String? description;
  @override
  final Team team;
  @override
  @JsonKey()
  final Duration? duration;

  @override
  String toString() {
    return 'TeamEvent(eventId: $eventId, name: $name, startTime: $startTime, description: $description, team: $team, duration: $duration)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_TeamEvent &&
            const DeepCollectionEquality().equals(other.eventId, eventId) &&
            const DeepCollectionEquality().equals(other.name, name) &&
            const DeepCollectionEquality().equals(other.startTime, startTime) &&
            const DeepCollectionEquality()
                .equals(other.description, description) &&
            const DeepCollectionEquality().equals(other.team, team) &&
            const DeepCollectionEquality().equals(other.duration, duration));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(eventId),
      const DeepCollectionEquality().hash(name),
      const DeepCollectionEquality().hash(startTime),
      const DeepCollectionEquality().hash(description),
      const DeepCollectionEquality().hash(team),
      const DeepCollectionEquality().hash(duration));

  @JsonKey(ignore: true)
  @override
  _$$_TeamEventCopyWith<_$_TeamEvent> get copyWith =>
      __$$_TeamEventCopyWithImpl<_$_TeamEvent>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_TeamEventToJson(
      this,
    );
  }
}

abstract class _TeamEvent extends TeamEvent {
  const factory _TeamEvent(
      {required final String eventId,
      required final String name,
      required final DateTime startTime,
      final String? description,
      required final Team team,
      final Duration? duration}) = _$_TeamEvent;
  const _TeamEvent._() : super._();

  factory _TeamEvent.fromJson(Map<String, dynamic> json) =
      _$_TeamEvent.fromJson;

  @override
  String get eventId;
  @override
  String get name;
  @override
  DateTime get startTime;
  @override
  String? get description;
  @override
  Team get team;
  @override
  Duration? get duration;
  @override
  @JsonKey(ignore: true)
  _$$_TeamEventCopyWith<_$_TeamEvent> get copyWith =>
      throw _privateConstructorUsedError;
}
