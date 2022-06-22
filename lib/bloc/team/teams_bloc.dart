import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:supercalipso/bloc/auth/auth_bloc.dart';
import 'package:supercalipso/bloc/auth/states.dart';
import 'package:supercalipso/bloc/team/states.dart';
import 'package:supercalipso/data/reposotory/team_repository.dart';
import 'package:supercalipso/plugin/bloc.dart';
import 'package:supercalipso/services/intaller.dart';

class TeamsBloc extends Bloc<BlocEvent, BlocState> {
  final repository = Installer.instance.get<TeamRepository>();
  final errorBloc = Installer.instance.get<ErrorManagerBloc>();
  final AuthenticationBloc authenticationBloc;
  late StreamSubscription authSub;

  TeamsBloc({required this.authenticationBloc}) : super(InitialBlocState()) {
    on<BlocStarted<Authenticated>>((event, emit) => _handleBlocStarted(event, emit));
    on<BlocClosed>((event, emit) => emit.call(InitialBlocState()));
    authSub = authenticationBloc.stream.listen((event) {
      if (event is Authenticated) {
        add(BlocStarted<Authenticated>(startValue: event));
      } else if (event is Unauthenticated) {
        add(BlocClosed());
      }
    });
  }

  Future _handleBlocStarted(BlocStarted<Authenticated> event, Emitter<BlocState> emitter) async {
    emitter.call(LoadingBlocState());
    var teams = await repository.getUserTeams();
    var invitations = await teams.flatMapAsync((t) => repository.getUserTeamInvitations());
    invitations.ifSuccess((payload) => emitter.call(TeamsLoaded(
          enrolledTeams: teams.payload!,
          teamInvitations: payload!,
        )));
    invitations.ifError((payload) => errorBloc.add(GeneralErrorRaised(description: 'Something went wrong')));
    return Future.value();
  }
}
