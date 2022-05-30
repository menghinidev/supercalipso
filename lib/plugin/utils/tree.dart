class Tree<T> {
  T value;
  List<Tree<T>> children;
  Tree<T>? parent;

  Tree({required this.value, this.parent}) : children = [];

  static List<Tree<T>> fromFlat<T>(List<T> flatItems, int? Function(T node) parentKey, int Function(T node) getKey) {
    // ignore: prefer_for_elements_to_map_fromiterable
    var _lookUp = Map<int, Tree<T>>.fromIterable(
      flatItems,
      key: (object) => getKey(object),
      value: (object) => Tree(value: object),
    );
    return _generateTree<T>(_lookUp, parentKey, getKey, flatItems);
  }

  static List<Tree<T>> _generateTree<T>(
    Map<int, Tree<T>> flattenMap,
    int? Function(T node) parentKey,
    int Function(T node) getKey,
    List<T> flatItems,
  ) {
    for (var element in flatItems) {
      if (parentKey(element) != null && flattenMap.containsKey(parentKey(element))) {
        var parent = flattenMap[parentKey(element)];
        var currentItem = flattenMap[getKey(element)];
        parent!.children.add(currentItem!);
        currentItem.parent = parent;
      }
    }
    return flattenMap.values.where((element) => element.parent == null).toList();
  }
}
