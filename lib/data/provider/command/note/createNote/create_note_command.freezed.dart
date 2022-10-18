// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'create_note_command.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

CreateNoteCommand _$CreateNoteCommandFromJson(Map<String, dynamic> json) {
  return _CreateNoteCommand.fromJson(json);
}

/// @nodoc
mixin _$CreateNoteCommand {
  String get teamId => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String get content => throw _privateConstructorUsedError;
  String get modifiedByUserId => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CreateNoteCommandCopyWith<CreateNoteCommand> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CreateNoteCommandCopyWith<$Res> {
  factory $CreateNoteCommandCopyWith(
          CreateNoteCommand value, $Res Function(CreateNoteCommand) then) =
      _$CreateNoteCommandCopyWithImpl<$Res>;
  $Res call(
      {String teamId, String title, String content, String modifiedByUserId});
}

/// @nodoc
class _$CreateNoteCommandCopyWithImpl<$Res>
    implements $CreateNoteCommandCopyWith<$Res> {
  _$CreateNoteCommandCopyWithImpl(this._value, this._then);

  final CreateNoteCommand _value;
  // ignore: unused_field
  final $Res Function(CreateNoteCommand) _then;

  @override
  $Res call({
    Object? teamId = freezed,
    Object? title = freezed,
    Object? content = freezed,
    Object? modifiedByUserId = freezed,
  }) {
    return _then(_value.copyWith(
      teamId: teamId == freezed
          ? _value.teamId
          : teamId // ignore: cast_nullable_to_non_nullable
              as String,
      title: title == freezed
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      content: content == freezed
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
      modifiedByUserId: modifiedByUserId == freezed
          ? _value.modifiedByUserId
          : modifiedByUserId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$$_CreateNoteCommandCopyWith<$Res>
    implements $CreateNoteCommandCopyWith<$Res> {
  factory _$$_CreateNoteCommandCopyWith(_$_CreateNoteCommand value,
          $Res Function(_$_CreateNoteCommand) then) =
      __$$_CreateNoteCommandCopyWithImpl<$Res>;
  @override
  $Res call(
      {String teamId, String title, String content, String modifiedByUserId});
}

/// @nodoc
class __$$_CreateNoteCommandCopyWithImpl<$Res>
    extends _$CreateNoteCommandCopyWithImpl<$Res>
    implements _$$_CreateNoteCommandCopyWith<$Res> {
  __$$_CreateNoteCommandCopyWithImpl(
      _$_CreateNoteCommand _value, $Res Function(_$_CreateNoteCommand) _then)
      : super(_value, (v) => _then(v as _$_CreateNoteCommand));

  @override
  _$_CreateNoteCommand get _value => super._value as _$_CreateNoteCommand;

  @override
  $Res call({
    Object? teamId = freezed,
    Object? title = freezed,
    Object? content = freezed,
    Object? modifiedByUserId = freezed,
  }) {
    return _then(_$_CreateNoteCommand(
      teamId: teamId == freezed
          ? _value.teamId
          : teamId // ignore: cast_nullable_to_non_nullable
              as String,
      title: title == freezed
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      content: content == freezed
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
      modifiedByUserId: modifiedByUserId == freezed
          ? _value.modifiedByUserId
          : modifiedByUserId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_CreateNoteCommand extends _CreateNoteCommand {
  const _$_CreateNoteCommand(
      {required this.teamId,
      required this.title,
      required this.content,
      required this.modifiedByUserId})
      : super._();

  factory _$_CreateNoteCommand.fromJson(Map<String, dynamic> json) =>
      _$$_CreateNoteCommandFromJson(json);

  @override
  final String teamId;
  @override
  final String title;
  @override
  final String content;
  @override
  final String modifiedByUserId;

  @override
  String toString() {
    return 'CreateNoteCommand(teamId: $teamId, title: $title, content: $content, modifiedByUserId: $modifiedByUserId)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_CreateNoteCommand &&
            const DeepCollectionEquality().equals(other.teamId, teamId) &&
            const DeepCollectionEquality().equals(other.title, title) &&
            const DeepCollectionEquality().equals(other.content, content) &&
            const DeepCollectionEquality()
                .equals(other.modifiedByUserId, modifiedByUserId));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(teamId),
      const DeepCollectionEquality().hash(title),
      const DeepCollectionEquality().hash(content),
      const DeepCollectionEquality().hash(modifiedByUserId));

  @JsonKey(ignore: true)
  @override
  _$$_CreateNoteCommandCopyWith<_$_CreateNoteCommand> get copyWith =>
      __$$_CreateNoteCommandCopyWithImpl<_$_CreateNoteCommand>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_CreateNoteCommandToJson(
      this,
    );
  }
}

abstract class _CreateNoteCommand extends CreateNoteCommand {
  const factory _CreateNoteCommand(
      {required final String teamId,
      required final String title,
      required final String content,
      required final String modifiedByUserId}) = _$_CreateNoteCommand;
  const _CreateNoteCommand._() : super._();

  factory _CreateNoteCommand.fromJson(Map<String, dynamic> json) =
      _$_CreateNoteCommand.fromJson;

  @override
  String get teamId;
  @override
  String get title;
  @override
  String get content;
  @override
  String get modifiedByUserId;
  @override
  @JsonKey(ignore: true)
  _$$_CreateNoteCommandCopyWith<_$_CreateNoteCommand> get copyWith =>
      throw _privateConstructorUsedError;
}
