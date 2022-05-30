import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:supercalipso/plugin/bloc.dart';

class NavigationBlocIdle extends BlocState {}

class NavigationBlocOperating extends BlocState {
  final Function(BuildContext context) operation;

  NavigationBlocOperating(this.operation);
}

class GoTo extends BlocEvent {
  final Function(BuildContext context) pageBuilder;

  GoTo({required this.pageBuilder});
}

class Pop extends BlocEvent {}

class NavigationBloc extends Bloc<BlocEvent, BlocState> {
  NavigationBloc() : super(NavigationBlocIdle()) {
    on<GoTo>((event, emit) => _handleGoToEvent(event, emit));
    on<Pop>((event, emit) => _handlePopEvent(event, emit));
  }

  Future _handleGoToEvent(GoTo event, Emitter<BlocState> emitter) {
    emitter.call(NavigationBlocOperating(event.pageBuilder));
    return Future.value();
  }

  Future _handlePopEvent(Pop event, Emitter<BlocState> emitter) {
    emitter.call(NavigationBlocOperating((context) => Navigator.pop(context)));
    return Future.value();
  }
}

class NavigationBlocStateListener extends BlocStateListener<NavigationBloc> {
  NavigationBlocStateListener({required Widget child, Key? key})
      : super(
          key: key,
          child: child,
          stateBinders: [
            BlocStateListenerBinder<NavigationBlocOperating>(trigger: (context, state) => state.operation(context)),
          ],
        );
}
