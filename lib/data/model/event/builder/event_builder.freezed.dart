// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'event_builder.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$EventBuilder {
  String? get teamId => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  DateTime? get startTime => throw _privateConstructorUsedError;
  Duration? get duration => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $EventBuilderCopyWith<EventBuilder> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EventBuilderCopyWith<$Res> {
  factory $EventBuilderCopyWith(
          EventBuilder value, $Res Function(EventBuilder) then) =
      _$EventBuilderCopyWithImpl<$Res>;
  $Res call(
      {String? teamId,
      String? name,
      String? description,
      DateTime? startTime,
      Duration? duration});
}

/// @nodoc
class _$EventBuilderCopyWithImpl<$Res> implements $EventBuilderCopyWith<$Res> {
  _$EventBuilderCopyWithImpl(this._value, this._then);

  final EventBuilder _value;
  // ignore: unused_field
  final $Res Function(EventBuilder) _then;

  @override
  $Res call({
    Object? teamId = freezed,
    Object? name = freezed,
    Object? description = freezed,
    Object? startTime = freezed,
    Object? duration = freezed,
  }) {
    return _then(_value.copyWith(
      teamId: teamId == freezed
          ? _value.teamId
          : teamId // ignore: cast_nullable_to_non_nullable
              as String?,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      description: description == freezed
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      startTime: startTime == freezed
          ? _value.startTime
          : startTime // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      duration: duration == freezed
          ? _value.duration
          : duration // ignore: cast_nullable_to_non_nullable
              as Duration?,
    ));
  }
}

/// @nodoc
abstract class _$$_EventBuilderCopyWith<$Res>
    implements $EventBuilderCopyWith<$Res> {
  factory _$$_EventBuilderCopyWith(
          _$_EventBuilder value, $Res Function(_$_EventBuilder) then) =
      __$$_EventBuilderCopyWithImpl<$Res>;
  @override
  $Res call(
      {String? teamId,
      String? name,
      String? description,
      DateTime? startTime,
      Duration? duration});
}

/// @nodoc
class __$$_EventBuilderCopyWithImpl<$Res>
    extends _$EventBuilderCopyWithImpl<$Res>
    implements _$$_EventBuilderCopyWith<$Res> {
  __$$_EventBuilderCopyWithImpl(
      _$_EventBuilder _value, $Res Function(_$_EventBuilder) _then)
      : super(_value, (v) => _then(v as _$_EventBuilder));

  @override
  _$_EventBuilder get _value => super._value as _$_EventBuilder;

  @override
  $Res call({
    Object? teamId = freezed,
    Object? name = freezed,
    Object? description = freezed,
    Object? startTime = freezed,
    Object? duration = freezed,
  }) {
    return _then(_$_EventBuilder(
      teamId: teamId == freezed
          ? _value.teamId
          : teamId // ignore: cast_nullable_to_non_nullable
              as String?,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      description: description == freezed
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      startTime: startTime == freezed
          ? _value.startTime
          : startTime // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      duration: duration == freezed
          ? _value.duration
          : duration // ignore: cast_nullable_to_non_nullable
              as Duration?,
    ));
  }
}

/// @nodoc

class _$_EventBuilder implements _EventBuilder {
  const _$_EventBuilder(
      {this.teamId,
      this.name,
      this.description,
      this.startTime,
      this.duration});

  @override
  final String? teamId;
  @override
  final String? name;
  @override
  final String? description;
  @override
  final DateTime? startTime;
  @override
  final Duration? duration;

  @override
  String toString() {
    return 'EventBuilder(teamId: $teamId, name: $name, description: $description, startTime: $startTime, duration: $duration)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_EventBuilder &&
            const DeepCollectionEquality().equals(other.teamId, teamId) &&
            const DeepCollectionEquality().equals(other.name, name) &&
            const DeepCollectionEquality()
                .equals(other.description, description) &&
            const DeepCollectionEquality().equals(other.startTime, startTime) &&
            const DeepCollectionEquality().equals(other.duration, duration));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(teamId),
      const DeepCollectionEquality().hash(name),
      const DeepCollectionEquality().hash(description),
      const DeepCollectionEquality().hash(startTime),
      const DeepCollectionEquality().hash(duration));

  @JsonKey(ignore: true)
  @override
  _$$_EventBuilderCopyWith<_$_EventBuilder> get copyWith =>
      __$$_EventBuilderCopyWithImpl<_$_EventBuilder>(this, _$identity);
}

abstract class _EventBuilder implements EventBuilder {
  const factory _EventBuilder(
      {final String? teamId,
      final String? name,
      final String? description,
      final DateTime? startTime,
      final Duration? duration}) = _$_EventBuilder;

  @override
  String? get teamId;
  @override
  String? get name;
  @override
  String? get description;
  @override
  DateTime? get startTime;
  @override
  Duration? get duration;
  @override
  @JsonKey(ignore: true)
  _$$_EventBuilderCopyWith<_$_EventBuilder> get copyWith =>
      throw _privateConstructorUsedError;
}
