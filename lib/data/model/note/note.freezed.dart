// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'note.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Note _$NoteFromJson(Map<String, dynamic> json) {
  return _Note.fromJson(json);
}

/// @nodoc
mixin _$Note {
  String get id => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  String get modifiedByUserId => throw _privateConstructorUsedError;
  DateTime get lastUpdate => throw _privateConstructorUsedError;
  String get teamId => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $NoteCopyWith<Note> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NoteCopyWith<$Res> {
  factory $NoteCopyWith(Note value, $Res Function(Note) then) =
      _$NoteCopyWithImpl<$Res, Note>;
  @useResult
  $Res call(
      {String id,
      String title,
      String? description,
      String modifiedByUserId,
      DateTime lastUpdate,
      String teamId});
}

/// @nodoc
class _$NoteCopyWithImpl<$Res, $Val extends Note>
    implements $NoteCopyWith<$Res> {
  _$NoteCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? description = freezed,
    Object? modifiedByUserId = null,
    Object? lastUpdate = null,
    Object? teamId = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      modifiedByUserId: null == modifiedByUserId
          ? _value.modifiedByUserId
          : modifiedByUserId // ignore: cast_nullable_to_non_nullable
              as String,
      lastUpdate: null == lastUpdate
          ? _value.lastUpdate
          : lastUpdate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      teamId: null == teamId
          ? _value.teamId
          : teamId // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_NoteCopyWith<$Res> implements $NoteCopyWith<$Res> {
  factory _$$_NoteCopyWith(_$_Note value, $Res Function(_$_Note) then) =
      __$$_NoteCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String title,
      String? description,
      String modifiedByUserId,
      DateTime lastUpdate,
      String teamId});
}

/// @nodoc
class __$$_NoteCopyWithImpl<$Res> extends _$NoteCopyWithImpl<$Res, _$_Note>
    implements _$$_NoteCopyWith<$Res> {
  __$$_NoteCopyWithImpl(_$_Note _value, $Res Function(_$_Note) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? description = freezed,
    Object? modifiedByUserId = null,
    Object? lastUpdate = null,
    Object? teamId = null,
  }) {
    return _then(_$_Note(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      modifiedByUserId: null == modifiedByUserId
          ? _value.modifiedByUserId
          : modifiedByUserId // ignore: cast_nullable_to_non_nullable
              as String,
      lastUpdate: null == lastUpdate
          ? _value.lastUpdate
          : lastUpdate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      teamId: null == teamId
          ? _value.teamId
          : teamId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Note extends _Note {
  const _$_Note(
      {required this.id,
      required this.title,
      this.description,
      required this.modifiedByUserId,
      required this.lastUpdate,
      required this.teamId})
      : super._();

  factory _$_Note.fromJson(Map<String, dynamic> json) => _$$_NoteFromJson(json);

  @override
  final String id;
  @override
  final String title;
  @override
  final String? description;
  @override
  final String modifiedByUserId;
  @override
  final DateTime lastUpdate;
  @override
  final String teamId;

  @override
  String toString() {
    return 'Note(id: $id, title: $title, description: $description, modifiedByUserId: $modifiedByUserId, lastUpdate: $lastUpdate, teamId: $teamId)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Note &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.modifiedByUserId, modifiedByUserId) ||
                other.modifiedByUserId == modifiedByUserId) &&
            (identical(other.lastUpdate, lastUpdate) ||
                other.lastUpdate == lastUpdate) &&
            (identical(other.teamId, teamId) || other.teamId == teamId));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, title, description,
      modifiedByUserId, lastUpdate, teamId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_NoteCopyWith<_$_Note> get copyWith =>
      __$$_NoteCopyWithImpl<_$_Note>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_NoteToJson(
      this,
    );
  }
}

abstract class _Note extends Note {
  const factory _Note(
      {required final String id,
      required final String title,
      final String? description,
      required final String modifiedByUserId,
      required final DateTime lastUpdate,
      required final String teamId}) = _$_Note;
  const _Note._() : super._();

  factory _Note.fromJson(Map<String, dynamic> json) = _$_Note.fromJson;

  @override
  String get id;
  @override
  String get title;
  @override
  String? get description;
  @override
  String get modifiedByUserId;
  @override
  DateTime get lastUpdate;
  @override
  String get teamId;
  @override
  @JsonKey(ignore: true)
  _$$_NoteCopyWith<_$_Note> get copyWith => throw _privateConstructorUsedError;
}
