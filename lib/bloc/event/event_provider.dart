import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:supercalipso/bloc/env.dart';
import 'package:supercalipso/bloc/event/event_service.dart';
import 'package:supercalipso/data/model/event/team_event.dart';
import 'package:supercalipso/data/provider/api/event/firestore_data_source.dart';
import 'package:supercalipso/data/provider/api/event/i_event_data_source.dart';
import 'package:supercalipso/data/provider/api/event/mocked_data_source.dart';
import 'package:supercalipso/data/repository/event_repository.dart';

final eventDataSourceProvider = Provider<IEventDataSource>((ref) {
  if (EnvVariables.isMocked) return EventMockedDataSource();
  return TeamEventFirestoreDataSource();
});

final eventRepositoryProvider = Provider<EventRepository>((ref) {
  return EventRepository(provider: ref.watch(eventDataSourceProvider));
});
