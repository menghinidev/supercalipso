// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'update_event_command.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

UpdateEventCommand _$UpdateEventCommandFromJson(Map<String, dynamic> json) {
  return _UpdateEventCommand.fromJson(json);
}

/// @nodoc
mixin _$UpdateEventCommand {
  String get eventId => throw _privateConstructorUsedError;
  String? get title => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  DateTime? get startTime => throw _privateConstructorUsedError;
  DateTime? get endTime => throw _privateConstructorUsedError;
  String? get iconName => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UpdateEventCommandCopyWith<UpdateEventCommand> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UpdateEventCommandCopyWith<$Res> {
  factory $UpdateEventCommandCopyWith(
          UpdateEventCommand value, $Res Function(UpdateEventCommand) then) =
      _$UpdateEventCommandCopyWithImpl<$Res, UpdateEventCommand>;
  @useResult
  $Res call(
      {String eventId,
      String? title,
      String? description,
      DateTime? startTime,
      DateTime? endTime,
      String? iconName});
}

/// @nodoc
class _$UpdateEventCommandCopyWithImpl<$Res, $Val extends UpdateEventCommand>
    implements $UpdateEventCommandCopyWith<$Res> {
  _$UpdateEventCommandCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? eventId = null,
    Object? title = freezed,
    Object? description = freezed,
    Object? startTime = freezed,
    Object? endTime = freezed,
    Object? iconName = freezed,
  }) {
    return _then(_value.copyWith(
      eventId: null == eventId
          ? _value.eventId
          : eventId // ignore: cast_nullable_to_non_nullable
              as String,
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      startTime: freezed == startTime
          ? _value.startTime
          : startTime // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      endTime: freezed == endTime
          ? _value.endTime
          : endTime // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      iconName: freezed == iconName
          ? _value.iconName
          : iconName // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_UpdateEventCommandCopyWith<$Res>
    implements $UpdateEventCommandCopyWith<$Res> {
  factory _$$_UpdateEventCommandCopyWith(_$_UpdateEventCommand value,
          $Res Function(_$_UpdateEventCommand) then) =
      __$$_UpdateEventCommandCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String eventId,
      String? title,
      String? description,
      DateTime? startTime,
      DateTime? endTime,
      String? iconName});
}

/// @nodoc
class __$$_UpdateEventCommandCopyWithImpl<$Res>
    extends _$UpdateEventCommandCopyWithImpl<$Res, _$_UpdateEventCommand>
    implements _$$_UpdateEventCommandCopyWith<$Res> {
  __$$_UpdateEventCommandCopyWithImpl(
      _$_UpdateEventCommand _value, $Res Function(_$_UpdateEventCommand) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? eventId = null,
    Object? title = freezed,
    Object? description = freezed,
    Object? startTime = freezed,
    Object? endTime = freezed,
    Object? iconName = freezed,
  }) {
    return _then(_$_UpdateEventCommand(
      eventId: null == eventId
          ? _value.eventId
          : eventId // ignore: cast_nullable_to_non_nullable
              as String,
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      startTime: freezed == startTime
          ? _value.startTime
          : startTime // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      endTime: freezed == endTime
          ? _value.endTime
          : endTime // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      iconName: freezed == iconName
          ? _value.iconName
          : iconName // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_UpdateEventCommand implements _UpdateEventCommand {
  _$_UpdateEventCommand(
      {required this.eventId,
      this.title,
      this.description,
      this.startTime,
      this.endTime,
      this.iconName});

  factory _$_UpdateEventCommand.fromJson(Map<String, dynamic> json) =>
      _$$_UpdateEventCommandFromJson(json);

  @override
  final String eventId;
  @override
  final String? title;
  @override
  final String? description;
  @override
  final DateTime? startTime;
  @override
  final DateTime? endTime;
  @override
  final String? iconName;

  @override
  String toString() {
    return 'UpdateEventCommand(eventId: $eventId, title: $title, description: $description, startTime: $startTime, endTime: $endTime, iconName: $iconName)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_UpdateEventCommand &&
            (identical(other.eventId, eventId) || other.eventId == eventId) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.startTime, startTime) ||
                other.startTime == startTime) &&
            (identical(other.endTime, endTime) || other.endTime == endTime) &&
            (identical(other.iconName, iconName) ||
                other.iconName == iconName));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, eventId, title, description, startTime, endTime, iconName);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_UpdateEventCommandCopyWith<_$_UpdateEventCommand> get copyWith =>
      __$$_UpdateEventCommandCopyWithImpl<_$_UpdateEventCommand>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_UpdateEventCommandToJson(
      this,
    );
  }
}

abstract class _UpdateEventCommand implements UpdateEventCommand {
  factory _UpdateEventCommand(
      {required final String eventId,
      final String? title,
      final String? description,
      final DateTime? startTime,
      final DateTime? endTime,
      final String? iconName}) = _$_UpdateEventCommand;

  factory _UpdateEventCommand.fromJson(Map<String, dynamic> json) =
      _$_UpdateEventCommand.fromJson;

  @override
  String get eventId;
  @override
  String? get title;
  @override
  String? get description;
  @override
  DateTime? get startTime;
  @override
  DateTime? get endTime;
  @override
  String? get iconName;
  @override
  @JsonKey(ignore: true)
  _$$_UpdateEventCommandCopyWith<_$_UpdateEventCommand> get copyWith =>
      throw _privateConstructorUsedError;
}
