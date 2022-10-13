// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'register_user_command.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_RegisterUserCommand _$$_RegisterUserCommandFromJson(
        Map<String, dynamic> json) =>
    _$_RegisterUserCommand(
      uid: json['uid'] as String,
      displayName: json['displayName'] as String,
      email: json['email'] as String,
    );

Map<String, dynamic> _$$_RegisterUserCommandToJson(
        _$_RegisterUserCommand instance) =>
    <String, dynamic>{
      'uid': instance.uid,
      'displayName': instance.displayName,
      'email': instance.email,
    };
