import 'package:freezed_annotation/freezed_annotation.dart';

part 'event_builder.freezed.dart';

@freezed
class EventBuilder with _$EventBuilder {
  const factory EventBuilder({
    final String? teamId,
    final String? name,
    final String? description,
    final DateTime? startTime,
    final Duration? duration,
  }) = _EventBuilder;
}

extension EventBuilderFeatures on EventBuilder {
  bool get canBuild => startTime != null && name != null;
}
