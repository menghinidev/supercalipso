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
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  DateTime get startTime => throw _privateConstructorUsedError;
  String get teamId => throw _privateConstructorUsedError;
  String get createdByUserId => throw _privateConstructorUsedError;
  DateTime get lastUpdate => throw _privateConstructorUsedError;
  DateTime? get endTime => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  String? get iconName => throw _privateConstructorUsedError;

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
      {String id,
      String name,
      DateTime startTime,
      String teamId,
      String createdByUserId,
      DateTime lastUpdate,
      DateTime? endTime,
      String? description,
      String? iconName});
}

/// @nodoc
class _$TeamEventCopyWithImpl<$Res> implements $TeamEventCopyWith<$Res> {
  _$TeamEventCopyWithImpl(this._value, this._then);

  final TeamEvent _value;
  // ignore: unused_field
  final $Res Function(TeamEvent) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? startTime = freezed,
    Object? teamId = freezed,
    Object? createdByUserId = freezed,
    Object? lastUpdate = freezed,
    Object? endTime = freezed,
    Object? description = freezed,
    Object? iconName = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      startTime: startTime == freezed
          ? _value.startTime
          : startTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
      teamId: teamId == freezed
          ? _value.teamId
          : teamId // ignore: cast_nullable_to_non_nullable
              as String,
      createdByUserId: createdByUserId == freezed
          ? _value.createdByUserId
          : createdByUserId // ignore: cast_nullable_to_non_nullable
              as String,
      lastUpdate: lastUpdate == freezed
          ? _value.lastUpdate
          : lastUpdate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      endTime: endTime == freezed
          ? _value.endTime
          : endTime // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      description: description == freezed
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      iconName: iconName == freezed
          ? _value.iconName
          : iconName // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
abstract class _$$_TeamEventCopyWith<$Res> implements $TeamEventCopyWith<$Res> {
  factory _$$_TeamEventCopyWith(
          _$_TeamEvent value, $Res Function(_$_TeamEvent) then) =
      __$$_TeamEventCopyWithImpl<$Res>;
  @override
  $Res call(
      {String id,
      String name,
      DateTime startTime,
      String teamId,
      String createdByUserId,
      DateTime lastUpdate,
      DateTime? endTime,
      String? description,
      String? iconName});
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
    Object? id = freezed,
    Object? name = freezed,
    Object? startTime = freezed,
    Object? teamId = freezed,
    Object? createdByUserId = freezed,
    Object? lastUpdate = freezed,
    Object? endTime = freezed,
    Object? description = freezed,
    Object? iconName = freezed,
  }) {
    return _then(_$_TeamEvent(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      startTime: startTime == freezed
          ? _value.startTime
          : startTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
      teamId: teamId == freezed
          ? _value.teamId
          : teamId // ignore: cast_nullable_to_non_nullable
              as String,
      createdByUserId: createdByUserId == freezed
          ? _value.createdByUserId
          : createdByUserId // ignore: cast_nullable_to_non_nullable
              as String,
      lastUpdate: lastUpdate == freezed
          ? _value.lastUpdate
          : lastUpdate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      endTime: endTime == freezed
          ? _value.endTime
          : endTime // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      description: description == freezed
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      iconName: iconName == freezed
          ? _value.iconName
          : iconName // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_TeamEvent extends _TeamEvent {
  const _$_TeamEvent(
      {required this.id,
      required this.name,
      required this.startTime,
      required this.teamId,
      required this.createdByUserId,
      required this.lastUpdate,
      this.endTime,
      this.description,
      this.iconName})
      : super._();

  factory _$_TeamEvent.fromJson(Map<String, dynamic> json) =>
      _$$_TeamEventFromJson(json);

  @override
  final String id;
  @override
  final String name;
  @override
  final DateTime startTime;
  @override
  final String teamId;
  @override
  final String createdByUserId;
  @override
  final DateTime lastUpdate;
  @override
  final DateTime? endTime;
  @override
  final String? description;
  @override
  final String? iconName;

  @override
  String toString() {
    return 'TeamEvent(id: $id, name: $name, startTime: $startTime, teamId: $teamId, createdByUserId: $createdByUserId, lastUpdate: $lastUpdate, endTime: $endTime, description: $description, iconName: $iconName)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_TeamEvent &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.name, name) &&
            const DeepCollectionEquality().equals(other.startTime, startTime) &&
            const DeepCollectionEquality().equals(other.teamId, teamId) &&
            const DeepCollectionEquality()
                .equals(other.createdByUserId, createdByUserId) &&
            const DeepCollectionEquality()
                .equals(other.lastUpdate, lastUpdate) &&
            const DeepCollectionEquality().equals(other.endTime, endTime) &&
            const DeepCollectionEquality()
                .equals(other.description, description) &&
            const DeepCollectionEquality().equals(other.iconName, iconName));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(name),
      const DeepCollectionEquality().hash(startTime),
      const DeepCollectionEquality().hash(teamId),
      const DeepCollectionEquality().hash(createdByUserId),
      const DeepCollectionEquality().hash(lastUpdate),
      const DeepCollectionEquality().hash(endTime),
      const DeepCollectionEquality().hash(description),
      const DeepCollectionEquality().hash(iconName));

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
      {required final String id,
      required final String name,
      required final DateTime startTime,
      required final String teamId,
      required final String createdByUserId,
      required final DateTime lastUpdate,
      final DateTime? endTime,
      final String? description,
      final String? iconName}) = _$_TeamEvent;
  const _TeamEvent._() : super._();

  factory _TeamEvent.fromJson(Map<String, dynamic> json) =
      _$_TeamEvent.fromJson;

  @override
  String get id;
  @override
  String get name;
  @override
  DateTime get startTime;
  @override
  String get teamId;
  @override
  String get createdByUserId;
  @override
  DateTime get lastUpdate;
  @override
  DateTime? get endTime;
  @override
  String? get description;
  @override
  String? get iconName;
  @override
  @JsonKey(ignore: true)
  _$$_TeamEventCopyWith<_$_TeamEvent> get copyWith =>
      throw _privateConstructorUsedError;
}
