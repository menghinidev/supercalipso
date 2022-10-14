// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'update_note_command.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

UpdateNoteCommand _$UpdateNoteCommandFromJson(Map<String, dynamic> json) {
  return _UpdateNoteCommand.fromJson(json);
}

/// @nodoc
mixin _$UpdateNoteCommand {
  String get noteId => throw _privateConstructorUsedError;
  String get modifiedByUserId => throw _privateConstructorUsedError;
  String get teamId => throw _privateConstructorUsedError;
  String? get title => throw _privateConstructorUsedError;
  String? get content => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UpdateNoteCommandCopyWith<UpdateNoteCommand> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UpdateNoteCommandCopyWith<$Res> {
  factory $UpdateNoteCommandCopyWith(
          UpdateNoteCommand value, $Res Function(UpdateNoteCommand) then) =
      _$UpdateNoteCommandCopyWithImpl<$Res>;
  $Res call(
      {String noteId,
      String modifiedByUserId,
      String teamId,
      String? title,
      String? content});
}

/// @nodoc
class _$UpdateNoteCommandCopyWithImpl<$Res>
    implements $UpdateNoteCommandCopyWith<$Res> {
  _$UpdateNoteCommandCopyWithImpl(this._value, this._then);

  final UpdateNoteCommand _value;
  // ignore: unused_field
  final $Res Function(UpdateNoteCommand) _then;

  @override
  $Res call({
    Object? noteId = freezed,
    Object? modifiedByUserId = freezed,
    Object? teamId = freezed,
    Object? title = freezed,
    Object? content = freezed,
  }) {
    return _then(_value.copyWith(
      noteId: noteId == freezed
          ? _value.noteId
          : noteId // ignore: cast_nullable_to_non_nullable
              as String,
      modifiedByUserId: modifiedByUserId == freezed
          ? _value.modifiedByUserId
          : modifiedByUserId // ignore: cast_nullable_to_non_nullable
              as String,
      teamId: teamId == freezed
          ? _value.teamId
          : teamId // ignore: cast_nullable_to_non_nullable
              as String,
      title: title == freezed
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      content: content == freezed
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
abstract class _$$_UpdateNoteCommandCopyWith<$Res>
    implements $UpdateNoteCommandCopyWith<$Res> {
  factory _$$_UpdateNoteCommandCopyWith(_$_UpdateNoteCommand value,
          $Res Function(_$_UpdateNoteCommand) then) =
      __$$_UpdateNoteCommandCopyWithImpl<$Res>;
  @override
  $Res call(
      {String noteId,
      String modifiedByUserId,
      String teamId,
      String? title,
      String? content});
}

/// @nodoc
class __$$_UpdateNoteCommandCopyWithImpl<$Res>
    extends _$UpdateNoteCommandCopyWithImpl<$Res>
    implements _$$_UpdateNoteCommandCopyWith<$Res> {
  __$$_UpdateNoteCommandCopyWithImpl(
      _$_UpdateNoteCommand _value, $Res Function(_$_UpdateNoteCommand) _then)
      : super(_value, (v) => _then(v as _$_UpdateNoteCommand));

  @override
  _$_UpdateNoteCommand get _value => super._value as _$_UpdateNoteCommand;

  @override
  $Res call({
    Object? noteId = freezed,
    Object? modifiedByUserId = freezed,
    Object? teamId = freezed,
    Object? title = freezed,
    Object? content = freezed,
  }) {
    return _then(_$_UpdateNoteCommand(
      noteId: noteId == freezed
          ? _value.noteId
          : noteId // ignore: cast_nullable_to_non_nullable
              as String,
      modifiedByUserId: modifiedByUserId == freezed
          ? _value.modifiedByUserId
          : modifiedByUserId // ignore: cast_nullable_to_non_nullable
              as String,
      teamId: teamId == freezed
          ? _value.teamId
          : teamId // ignore: cast_nullable_to_non_nullable
              as String,
      title: title == freezed
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      content: content == freezed
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_UpdateNoteCommand implements _UpdateNoteCommand {
  _$_UpdateNoteCommand(
      {required this.noteId,
      required this.modifiedByUserId,
      required this.teamId,
      this.title,
      this.content});

  factory _$_UpdateNoteCommand.fromJson(Map<String, dynamic> json) =>
      _$$_UpdateNoteCommandFromJson(json);

  @override
  final String noteId;
  @override
  final String modifiedByUserId;
  @override
  final String teamId;
  @override
  final String? title;
  @override
  final String? content;

  @override
  String toString() {
    return 'UpdateNoteCommand(noteId: $noteId, modifiedByUserId: $modifiedByUserId, teamId: $teamId, title: $title, content: $content)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_UpdateNoteCommand &&
            const DeepCollectionEquality().equals(other.noteId, noteId) &&
            const DeepCollectionEquality()
                .equals(other.modifiedByUserId, modifiedByUserId) &&
            const DeepCollectionEquality().equals(other.teamId, teamId) &&
            const DeepCollectionEquality().equals(other.title, title) &&
            const DeepCollectionEquality().equals(other.content, content));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(noteId),
      const DeepCollectionEquality().hash(modifiedByUserId),
      const DeepCollectionEquality().hash(teamId),
      const DeepCollectionEquality().hash(title),
      const DeepCollectionEquality().hash(content));

  @JsonKey(ignore: true)
  @override
  _$$_UpdateNoteCommandCopyWith<_$_UpdateNoteCommand> get copyWith =>
      __$$_UpdateNoteCommandCopyWithImpl<_$_UpdateNoteCommand>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_UpdateNoteCommandToJson(
      this,
    );
  }
}

abstract class _UpdateNoteCommand implements UpdateNoteCommand {
  factory _UpdateNoteCommand(
      {required final String noteId,
      required final String modifiedByUserId,
      required final String teamId,
      final String? title,
      final String? content}) = _$_UpdateNoteCommand;

  factory _UpdateNoteCommand.fromJson(Map<String, dynamic> json) =
      _$_UpdateNoteCommand.fromJson;

  @override
  String get noteId;
  @override
  String get modifiedByUserId;
  @override
  String get teamId;
  @override
  String? get title;
  @override
  String? get content;
  @override
  @JsonKey(ignore: true)
  _$$_UpdateNoteCommandCopyWith<_$_UpdateNoteCommand> get copyWith =>
      throw _privateConstructorUsedError;
}
