extension ListExtension<X> on List<X> {
  List<X> appendInPlace(X value) {
    insert(length, value);
    return this;
  }
}

extension IterableBaseExtension<X> on Iterable<X> {
  X? getWhere(bool Function(X element) where) {
    X? value;
    try {
      value = firstWhere((element) => where(element));
    } catch (e) {
      value = null;
    }
    return value;
  }
}
