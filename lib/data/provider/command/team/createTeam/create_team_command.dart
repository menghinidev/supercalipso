import 'package:freezed_annotation/freezed_annotation.dart';

part 'create_team_command.freezed.dart';
part 'create_team_command.g.dart';

@freezed
class CreateTeamCommand with _$CreateTeamCommand {
  const CreateTeamCommand._();

  const factory CreateTeamCommand({required String name, required String userId}) = _CreateTeamCommand;

  factory CreateTeamCommand.fromJson(Map<String, dynamic> json) => _$CreateTeamCommandFromJson(json);
}
