import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../bloc/events.dart';
import '../../bloc/listeners/bloc_state_listener_binder.dart';
import '../../bloc/states.dart';

class BlocStateListener<T extends Bloc<BlocEvent, BlocState>> extends BlocListener<T, BlocState> {
  BlocStateListener({Key? key, required List<BlocStateListenerBinder> stateBinders, Widget? child, T? bloc})
      : super(
          key: key,
          child: child,
          bloc: bloc,
          listenWhen: (previous, state) => stateBinders.where((element) => element.isActive(state)).isNotEmpty,
          listener: (context, state) {
            var activeBinders = stateBinders.where((element) => element.isActive(state));
            if (activeBinders.isEmpty) return;
            activeBinders.first.listener(context, state);
          },
        );
}

class MultiBlocStateListener extends StatelessWidget {
  final List<BlocStateListener> listeners;
  final Widget child;
  const MultiBlocStateListener({Key? key, required this.child, this.listeners = const <BlocStateListener>[]})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(listeners: listeners, child: child);
  }
}
