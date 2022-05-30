import 'package:flutter/material.dart';
import '../states.dart';

class BlocStateListenerBinder<S extends BlocState> {
  final Function(BuildContext, S) trigger;

  const BlocStateListenerBinder({required this.trigger});

  bool isActive(BlocState state) => state is S;

  void listener(BuildContext context, BlocState state) => trigger(context, state as S);
}
