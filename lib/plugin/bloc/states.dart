abstract class BlocState {}

class LoadingBlocState extends BlocState {}

class InitialBlocState extends BlocState {}

class GenericReadyState<T> extends BlocState {
  final T value;

  GenericReadyState({required this.value});
}
