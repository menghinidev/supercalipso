abstract class BlocEvent {}

class BlocStarted<T> extends BlocEvent {
  final T? startValue;

  BlocStarted({this.startValue});
}
