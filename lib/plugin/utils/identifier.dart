import 'extensions/list_extensions.dart';

abstract class Identifier {
  final int id;

  Identifier({required this.id});
}

extension InterableIdentifiersExtension<X extends Identifier> on Iterable<X> {
  X? byId(int id) => (getWhere((element) => element.id == id) as X);
  Iterable<X> intesectByIds(Set<int> ids) => where((element) => ids.contains(element.id));
}
