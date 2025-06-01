import '../model/stella_types.dart';
import 'type_system.dart';

final class SimpleTypeSystem implements InheritanceSystem {
  const SimpleTypeSystem();

  @override
  bool instanceOf(StellaType? clazz, StellaType? base) {
    return clazz is Wildcard || base is Wildcard || base == clazz;
  }
}
