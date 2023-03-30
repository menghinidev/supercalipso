// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

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
      _$CreateNoteCommandCopyWithImpl<$Res, CreateNoteCommand>;
  @useResult
  $Res call(
      {String teamId, String title, String content, String modifiedByUserId});
}

/// @nodoc
class _$CreateNoteCommandCopyWithImpl<$Res, $Val extends CreateNoteCommand>
    implements $CreateNoteCommandCopyWith<$Res> {
  _$CreateNoteCommandCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? teamId = null,
    Object? title = null,
    Object? content = null,
    Object? modifiedByUserId = null,
  }) {
    return _then(_value.copyWith(
      teamId: null == teamId
          ? _value.teamId
          : teamId // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      content: null == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
      modifiedByUserId: null == modifiedByUserId
          ? _value.modifiedByUserId
          : modifiedByUserId // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_CreateNoteCommandCopyWith<$Res>
    implements $CreateNoteCommandCopyWith<$Res> {
  factory _$$_CreateNoteCommandCopyWith(_$_CreateNoteCommand value,
          $Res Function(_$_CreateNoteCommand) then) =
      __$$_CreateNoteCommandCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String teamId, String title, String content, String modifiedByUserId});
}

/// @nodoc
class __$$_CreateNoteCommandCopyWithImpl<$Res>
    extends _$CreateNoteCommandCopyWithImpl<$Res, _$_CreateNoteCommand>
    implements _$$_CreateNoteCommandCopyWith<$Res> {
  __$$_CreateNoteCommandCopyWithImpl(
      _$_CreateNoteCommand _value, $Res Function(_$_CreateNoteCommand) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? teamId = null,
    Object? title = null,
    Object? content = null,
    Object? modifiedByUserId = null,
  }) {
    return _then(_$_CreateNoteCommand(
      teamId: null == teamId
          ? _value.teamId
          : teamId // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      content: null == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
      modifiedByUserId: null == modifiedByUserId
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
            (identical(other.teamId, teamId) || other.teamId == teamId) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.content, content) || other.content == content) &&
            (identical(other.modifiedByUserId, modifiedByUserId) ||
                other.modifiedByUserId == modifiedByUserId));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, teamId, title, content, modifiedByUserId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
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
