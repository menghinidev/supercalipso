import 'package:flutter/material.dart';
import '../../bloc/states.dart';

class BlocStateBuilderBinder<S extends BlocState> {
  final Widget Function(BuildContext, S) builder;

  const BlocStateBuilderBinder({required this.builder});

  bool isActive(BlocState state) => state is S;

  Widget build(BuildContext context, BlocState state) => builder(context, state as S);
}

class ErrorBlocStateBuilderBinder extends BlocStateBuilderBinder<LoadingBlocState> {
  ErrorBlocStateBuilderBinder({required Widget errorWidget}) : super(builder: (context, state) => errorWidget);
}

class LoadingBlocStateBuilderBinder extends BlocStateBuilderBinder<LoadingBlocState> {
  LoadingBlocStateBuilderBinder({required Widget loadingWidget}) : super(builder: (context, state) => loadingWidget);
}

class InitialBlocStateBuilderBinder extends BlocStateBuilderBinder<InitialBlocState> {
  InitialBlocStateBuilderBinder({required Widget loadingWidget}) : super(builder: (context, state) => loadingWidget);
}
