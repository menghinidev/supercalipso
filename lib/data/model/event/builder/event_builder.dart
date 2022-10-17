import 'package:freezed_annotation/freezed_annotation.dart';

part 'event_builder.freezed.dart';

@freezed
class EventBuilder with _$EventBuilder {
  const factory EventBuilder({
    String? teamId,
    String? name,
    String? description,
    DateTime? startTime,
    DateTime? endTime,
    String? iconName,
  }) = _EventBuilder;
}

extension EventBuilderFeatures on EventBuilder {
  bool get canBuild => startTime != null && name != null;
}
