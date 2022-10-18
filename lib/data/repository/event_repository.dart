import 'package:rxdart/rxdart.dart';
import 'package:supercalipso/data/model/event/team_event.dart';
import 'package:supercalipso/data/provider/api/event/i_event_data_source.dart';
import 'package:supercalipso/data/provider/command/event/create/create_event.dart';
import 'package:supercalipso/data/provider/command/event/update/update_event_command.dart';
import 'package:supercalipso/plugin/utils.dart';
import 'package:supercalipso/services/installer.dart';

extension CumulativeStream<X> on BehaviorSubject<List<X>> {
  update(List<X>? values, bool Function(X, X) equals) async {
    var toAdd = values ?? <X>[];
    if (!hasValue) {
      add(toAdd);
      return;
    }
    var latest = valueOrNull!;
    var asSet = latest.toSet();
    for (var e in toAdd) {
      var elementInSet = asSet.getWhere((element) => equals(e, element));
      if (elementInSet != null) asSet.remove(elementInSet);
      asSet.add(e);
    }
    asSet.addAll(toAdd);
    add(asSet.toList());
  }
}

class EventRepository {
  final controller = BehaviorSubject<List<TeamEvent>>();
  final provider = Installer.instance.get<IEventDataSource>();

  Stream<List<TeamEvent>> get eventsChanges => controller.stream;

  Stream<List<TeamEvent>> getTeamEventsChanges({required String teamId}) {
    return controller.stream.map((event) => event.where((element) => element.teamId == teamId).toList());
  }

  Stream<TeamEvent> getEventChanges({required String eventId}) {
    return controller.stream.mapNotNull((event) => event.getWhere((element) => element.id == eventId));
  }

  Future<Response<List<TeamEvent>>> getTeamEvents({required String teamId}) async {
    var events = await provider.readTeamEvents(teamId: teamId);
    return events.ifSuccess((payload) => controller.update(payload, TeamEventProperties.equalsById));
  }

  Future<Response<TeamEvent>> getEvent({required String id}) async {
    return await provider
        .readTeamEvent(eventId: id)
        .ifSuccess((payload) => controller.update([payload!], TeamEventProperties.equalsById));
  }

  Future<Response> createEvent({
    required String teamId,
    required String name,
    required DateTime startTime,
    required String userId,
    DateTime? endTime,
    String? description,
    String? iconName,
  }) async {
    var command = CreateEventCommand(
      teamId: teamId,
      name: name,
      startTime: startTime,
      endTime: endTime,
      description: description,
      createdByUserId: userId,
      iconName: iconName,
    );
    var event = await provider.createTeamEvent(command: command);
    return await event.flatMapAsync((t) => getTeamEvents(teamId: teamId));
  }

  Future<Response> updateEvent({
    required String eventId,
    String? name,
    DateTime? startTime,
    DateTime? endTime,
    String? description,
    String? iconName,
  }) async {
    var command = UpdateEventCommand(
      eventId: eventId,
      title: name,
      startTime: startTime,
      endTime: endTime,
      description: description,
      iconName: iconName,
    );
    var event = await provider.updateTeamEvent(command: command);
    return await event.flatMapAsync((t) => getTeamEvents(teamId: t!.teamId));
  }

  Future<Response> deleteEvent({required String eventId}) async {
    var event = await provider.readTeamEvent(eventId: eventId);
    var delete = await event.flatMapAsync((t) => provider.deleteTeamEvent(eventId: eventId));
    return await delete.flatMapAsync((t) => getTeamEvents(teamId: event.payload!.teamId));
  }
}
