import 'dart:async';

import 'package:flutter/material.dart';
import '../../bloc/errors/error_manager_bloc.dart';
import '../../bloc/listeners/bloc_state_listener.dart';
import '../../bloc/listeners/bloc_state_listener_binder.dart';
import '../../bloc/utils.dart';

class ErrorBlocListener<T> extends StatelessWidget with BlocRequester<ErrorManagerBloc> {
  final Widget child;
  final Future<T> Function(BuildContext context, ErrorProcessing state) errorHandler;
  const ErrorBlocListener({required this.child, required this.errorHandler, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocStateListener<ErrorManagerBloc>(
      stateBinders: [
        BlocStateListenerBinder<ErrorProcessing>(
          trigger: (context, state) => errorHandler(context, state).then(
            (value) => getBloc(context).add(ErrorDismissed()),
          ),
        )
      ],
      child: child,
    );
  }
}
