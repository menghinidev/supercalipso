abstract class MementoState<T> {
  final T _state;

  MementoState(this._state);

  T get state => _state;
}

abstract class MementoStateOriginator<T> {
  T _state;

  MementoStateOriginator(this._state);

  MementoState<T> saveToMemento();

  void changeState(T state) {
    _state = state;
  }

  void restoreFromMemento(MementoState<T> m) {
    changeState(m.state);
  }

  T get state => _state;
}

abstract class MementoStateCaretaker<T> {
  List<MementoState<T>> savedHistory;

  MementoStateCaretaker(MementoState<T> mementoState) : savedHistory = [mementoState];

  saveMemento(MementoState<T> state) => savedHistory.add(state);

  MementoState<T> rollback() {
    if (savedHistory.length == 1) return savedHistory.last;
    return savedHistory.removeLast();
  }
}
