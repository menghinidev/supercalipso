// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

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
      _$NoteCopyWithImpl<$Res>;
  $Res call(
      {String id,
      String title,
      String? description,
      String modifiedByUserId,
      DateTime lastUpdate,
      String teamId});
}

/// @nodoc
class _$NoteCopyWithImpl<$Res> implements $NoteCopyWith<$Res> {
  _$NoteCopyWithImpl(this._value, this._then);

  final Note _value;
  // ignore: unused_field
  final $Res Function(Note) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? title = freezed,
    Object? description = freezed,
    Object? modifiedByUserId = freezed,
    Object? lastUpdate = freezed,
    Object? teamId = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      title: title == freezed
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      description: description == freezed
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      modifiedByUserId: modifiedByUserId == freezed
          ? _value.modifiedByUserId
          : modifiedByUserId // ignore: cast_nullable_to_non_nullable
              as String,
      lastUpdate: lastUpdate == freezed
          ? _value.lastUpdate
          : lastUpdate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      teamId: teamId == freezed
          ? _value.teamId
          : teamId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$$_NoteCopyWith<$Res> implements $NoteCopyWith<$Res> {
  factory _$$_NoteCopyWith(_$_Note value, $Res Function(_$_Note) then) =
      __$$_NoteCopyWithImpl<$Res>;
  @override
  $Res call(
      {String id,
      String title,
      String? description,
      String modifiedByUserId,
      DateTime lastUpdate,
      String teamId});
}

/// @nodoc
class __$$_NoteCopyWithImpl<$Res> extends _$NoteCopyWithImpl<$Res>
    implements _$$_NoteCopyWith<$Res> {
  __$$_NoteCopyWithImpl(_$_Note _value, $Res Function(_$_Note) _then)
      : super(_value, (v) => _then(v as _$_Note));

  @override
  _$_Note get _value => super._value as _$_Note;

  @override
  $Res call({
    Object? id = freezed,
    Object? title = freezed,
    Object? description = freezed,
    Object? modifiedByUserId = freezed,
    Object? lastUpdate = freezed,
    Object? teamId = freezed,
  }) {
    return _then(_$_Note(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      title: title == freezed
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      description: description == freezed
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      modifiedByUserId: modifiedByUserId == freezed
          ? _value.modifiedByUserId
          : modifiedByUserId // ignore: cast_nullable_to_non_nullable
              as String,
      lastUpdate: lastUpdate == freezed
          ? _value.lastUpdate
          : lastUpdate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      teamId: teamId == freezed
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
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.title, title) &&
            const DeepCollectionEquality()
                .equals(other.description, description) &&
            const DeepCollectionEquality()
                .equals(other.modifiedByUserId, modifiedByUserId) &&
            const DeepCollectionEquality()
                .equals(other.lastUpdate, lastUpdate) &&
            const DeepCollectionEquality().equals(other.teamId, teamId));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(title),
      const DeepCollectionEquality().hash(description),
      const DeepCollectionEquality().hash(modifiedByUserId),
      const DeepCollectionEquality().hash(lastUpdate),
      const DeepCollectionEquality().hash(teamId));

  @JsonKey(ignore: true)
  @override
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
