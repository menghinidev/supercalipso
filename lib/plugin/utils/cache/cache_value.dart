import '../timewrappers/timestamp.dart';

class CachedValue<T> {
  final Duration cacheLifetime;
  T? _value;
  late TimeStamp _latestUpdate;

  CachedValue({T? initialValue}) : cacheLifetime = const Duration(minutes: 5) {
    _value = initialValue;
    _latestUpdate = TimeStamp.now();
  }

  bool get isValid => !_isExpired && _value != null;
  TimeStamp get latestUpdate => _latestUpdate;

  Future<T?> getValue({Future<T?> Function(T? outdatedValue)? onOutdated}) async {
    if (isValid) return _value;
    if (onOutdated == null) return null;
    _value = await onOutdated(_value);
    return _value;
  }

  void updateValue(T? value) {
    _value = value;
    _latestUpdate = TimeStamp.now();
  }

  bool get _isExpired => TimeStamp.now().isAfter(_latestUpdate.increase(cacheLifetime));
}

extension CachedLists<T> on List<CachedValue<T>> {
  Future<List<T>> getValues({Future<T?> Function(T? outdatedValue)? onOutdated}) async {
    var values = <T>[];
    T? current;
    for (var item in this) {
      current = await item.getValue(onOutdated: onOutdated);
      values.add(current!);
    }
    return values;
  }
}
