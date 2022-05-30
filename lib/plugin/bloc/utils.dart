import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

mixin BlocRequester<X extends BlocBase<Object>> {
  X getBloc(BuildContext context) => BlocProvider.of<X>(context);

  T getAnyBloc<T extends BlocBase<Object>>(BuildContext context) => BlocProvider.of<T>(context);
}
