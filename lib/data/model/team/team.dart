import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:supercalipso/data/model/team/invitation/invitation.dart';
import 'package:supercalipso/data/model/team/subscription/subscription.dart';

part 'team.g.dart';
part 'team.freezed.dart';

@freezed
class Team with _$Team {
  const Team._();
  const factory Team({required String id, required String name}) = _Team;

  factory Team.fromJson(Map<String, Object?> json) => _$TeamFromJson(json);
}
